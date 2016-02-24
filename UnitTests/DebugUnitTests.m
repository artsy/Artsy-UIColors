#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#define EXP_SHORTHAND
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <Expecta+Snapshots/EXPMatchers+FBSnapshotTest.h>
#import <Artsy+UIColors/UIColor+ArtsyColors.h>
#import <Artsy+UIColors/UIColor+DebugColours.h>

SpecBegin(DebugUnitTests)

__block UIView *sut;

beforeEach(^{
    sut = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
});

describe(@"debug", ^{
    it(@"blue is aesthetically pleasing", ^{
        sut.backgroundColor = [UIColor debugColourBlue];
        expect(sut).to.haveValidSnapshot();
    });

    it(@"puple is exceedingly purple", ^{
        sut.backgroundColor = [UIColor debugColourPurple];
        expect(sut).to.haveValidSnapshot();
    });

    it(@"red rocks", ^{
        sut.backgroundColor = [UIColor debugColourRed];
        expect(sut).to.haveValidSnapshot();
    });

    it(@"green fits nicely with the rest", ^{
        sut.backgroundColor = [UIColor debugColourGreen];
        expect(sut).to.haveValidSnapshot();
    });

    it(@"random doesnt give the same result twice", ^{
        UIColor *oneColor = [UIColor debugColourRandom];
        UIColor *twoColor = [UIColor debugColourRandom];

        const CGFloat *oneComponents = CGColorGetComponents(oneColor.CGColor);
        const CGFloat *twoComponents = CGColorGetComponents(twoColor.CGColor);

        BOOL isTheSame = (
                          (oneComponents[0] == twoComponents[0]) &&
                          (oneComponents[1] == twoComponents[1]) &&
                          (oneComponents[2] == twoComponents[2])
                          );
        expect(isTheSame).to.beFalsy();
        
    });
});

SpecEnd