Pod::Spec.new do |s|
  s.name             = "Artsy+UIColors"
  s.version          = "1.0.0"
  s.summary          = "UIColors for Artsy Apps."
  s.homepage         = "http://github.com/Artsy/Artsy-UIColors"
  s.license          = 'MIT'
  s.author           = { "Orta" => "orta.therox@gmail.com" }
  s.source           = { :git => "http://github.com/Artsy/Artsy-UIColors", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/artsy'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'

  s.frameworks = 'UIKit'
  s.dependency 'EDColor', '~> 0.4'
end
 