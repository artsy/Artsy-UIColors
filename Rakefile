desc "Runs the specs [EMPTY]"
task :update do
  system "git clone https://github.com/artsy/elan vendor/elan" unless Dir.exists? "vendor/elan"
  Dir.chdir "vendor/elan" do
    system "git pull"
  end
  require 'json'
  colours = JSON.parse(File.read("vendor/elan/components/lib/variables/colors.json"))
  
  def objc(name)
    "artsy" + name.split('-').map{|e| e.capitalize}.join.gsub("Color", "")
  end
  def objc_hex(colour)
    colour.gsub("#", "0x")
  end
  
  @artsy_colors = colours.map {|k, v| [objc(k), objc_hex(v)] }.to_h
  
  def update_file(file_path, before, per_color, after) 
    content = before
    @artsy_colors.each do |name, hex|
      content << per_color.gsub("{name}", name).gsub("{colour}", hex)
    end
    content << after
    File.open(file_path, 'w') { |tmp| tmp.write(content) }
  end
  

  # Header file
  prefix = "@interface UIColor (ArtsyColors)\n\n"
  content = "+ (UIColor *){name};\n\n"
  postfix = "@end"
  update_file("Classes/UIColor+ArtsyColors.h", prefix, content, postfix)
  
  # Implementation file
  prefix = %{
// See: https://github.com/artsy/elan

@implementation UIColor (ArtsyColors)

+ (UIColor *)ar_colorWithHex:(UInt32)hex
{
    return [self ar_colorWithHex:hex andAlpha:1];
}

+ (UIColor *)ar_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;

    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:alpha];
}
  }

  content = "+ (UIColor *){name}\n{\n    return [UIColor ar_colorWithHex:{colour}];\n}\n\n"
  postfix = "@end"
  update_file("Classes/UIColor+ArtsyColors.m", prefix, content, postfix)
  
  # Update Tests
  prefix = %{
SpecBegin(UnitTests)

__block UIView *sut;

beforeEach(^{
    sut = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
});
  }
  content = %{
it(@"{name} looks right", ^{
    sut.backgroundColor = [UIColor {name}];
    expect(sut).to.haveValidSnapshot();
});
  }
  postfix = "SpecEnd"
  update_file("UnitTests/UnitTests.m", prefix, content, postfix)
  
  # README
  readme = File.read("README.md")
  prefix = readme.split("## Colours").first + "\n## Colours"
  postfix = "\n## Author" + readme.split("## Author").last
  content = %{
<img src="https://raw.githubusercontent.com/artsy/Artsy-UIColors/master/UnitTests/ReferenceImages/UnitTestsSpec/{name}_looks_right@2x.png">
  }
  update_file("README.md", prefix, content, postfix)  
end

desc "Updates the test snapshots"
task :new_snapshots do
    before = "snapshotController.recordMode = record"
    after = "snapshotController.recordMode = YES"
    
    path = "Pods/Expecta+Snapshots/EXPMatchers+FBSnapshotTest.m"
    new_file = File.open(path).read.gsub(before, after)
    File.open(path, 'w') { |tmp| tmp.write(new_file) }
    
    `rm -rf UnitTests/ReferenceImages/`
    `xcodebuild -workspace UnitTests.xcworkspace -scheme UnitTests -sdk iphonesimulator -destination 'name=iPhone 6' build test`
    
    new_file = File.open(path).read.gsub(after, before)
    File.open(path, 'w') { |tmp| tmp.write(new_file) }
end

task :version do
  git_remotes = `git remote`.strip.split("\n")

  if git_remotes.count > 0
    puts "-- fetching version number from github"
    sh 'git fetch'

    remote_version = remote_spec_version
  end

  if remote_version.nil?
    puts "There is no current released version. You're about to release a new Pod."
    version = "0.0.1"
  else
    puts "The current released version of your pod is " +
          remote_spec_version.to_s()
    version = suggested_version_number
  end
  
  puts "Enter the version you want to release (" + version + ") "
  new_version_number = $stdin.gets.strip
  if new_version_number == ""
    new_version_number = version
  end

  replace_version_number(new_version_number)
end

desc "Release a new version of the Pod (append repo=name to push to a private spec repo)"
task :release do
  # Allow override of spec repo name using `repo=private` after task name
  repo = ENV["repo"] || "master"

  puts "* Running version"
  sh "rake version"

  unless ENV['SKIP_CHECKS']
    if `git symbolic-ref HEAD 2>/dev/null`.strip.split('/').last != 'master'
      $stderr.puts "[!] You need to be on the `master' branch in order to be able to do a release."
      exit 1
    end

    if `git tag`.strip.split("\n").include?(spec_version)
      $stderr.puts "[!] A tag for version `#{spec_version}' already exists. Change the version in the podspec"
      exit 1
    end

    puts "You are about to release `#{spec_version}`, is that correct? [y/n]"
    exit if $stdin.gets.strip.downcase != 'y'
  end

  puts "* Running specs"
  sh "rake spec"
 
  puts "* Linting the podspec"
  sh "pod lib lint"

  # Then release
  sh "git commit #{podspec_path} CHANGELOG.md -m 'Release #{spec_version}' --allow-empty"
  sh "git tag -a #{spec_version} -m 'Release #{spec_version}'"
  sh "git push origin master"
  sh "git push origin --tags"
  sh "pod push #{repo} #{podspec_path}"
end

# @return [Pod::Version] The version as reported by the Podspec.
#
def spec_version
  require 'cocoapods'
  spec = Pod::Specification.from_file(podspec_path)
  spec.version
end

# @return [Pod::Version] The version as reported by the Podspec from remote.
#
def remote_spec_version
  require 'cocoapods-core'

  if spec_file_exist_on_remote?
    remote_spec = eval(`git show origin/master:#{podspec_path}`)
    remote_spec.version
  else
    nil
  end
end

# @return [Bool] If the remote repository has a copy of the podpesc file or not.
#
def spec_file_exist_on_remote?
  test_condition = `if git rev-parse --verify --quiet origin/master:#{podspec_path} >/dev/null;
  then
  echo 'true'
  else
  echo 'false'
  fi`

  'true' == test_condition.strip
end

# @return [String] The relative path of the Podspec.
#
def podspec_path
  podspecs = Dir.glob('*.podspec')
  if podspecs.count == 1
    podspecs.first
  else
    raise "Could not select a podspec"
  end
end

# @return [String] The suggested version number based on the local and remote
#                  version numbers.
#
def suggested_version_number
  if spec_version != remote_spec_version
    spec_version.to_s()
  else
    next_version(spec_version).to_s()
  end
end

# @param  [Pod::Version] version
#         the version for which you need the next version
#
# @note   It is computed by bumping the last component of
#         the version string by 1.
#
# @return [Pod::Version] The version that comes next after
#                        the version supplied.
#
def next_version(version)
  version_components = version.to_s().split(".");
  last = (version_components.last.to_i() + 1).to_s
  version_components[-1] = last
  Pod::Version.new(version_components.join("."))
end

# @param  [String] new_version_number
#         the new version number
#
# @note   This methods replaces the version number in the podspec file
#         with a new version number.
#
# @return void
#
def replace_version_number(new_version_number)
  text = File.read(podspec_path)
  text.gsub!(/(s.version( )*= ")#{spec_version}(")/,
              "\\1#{new_version_number}\\3")
  File.open(podspec_path, "w") { |file| file.puts text }
end
