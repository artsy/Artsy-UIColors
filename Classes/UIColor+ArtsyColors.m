// See: https://github.com/artsy/elan

#import <EDColor/EDColor.h>

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


+ (UIColor *)artsyLightGrey
{
    return [UIColor ar_colorWithHex:0xe5e5e5];
}

+ (UIColor *)artsyMediumGrey
{
    return [UIColor ar_colorWithHex:0xcccccc];
}

+ (UIColor *)artsyHeavyGrey
{
    return [UIColor ar_colorWithHex:0x888888];
}

+ (UIColor *)artsyPurple
{
    return [UIColor ar_colorWithHex:0x6a0bc1];
}

+ (UIColor *)artsyPurpleWithAlpha:(CGFloat)alpha
{
    return [UIColor ar_colorWithHex:0x6a0bc1 andAlpha:alpha];
}

+ (UIColor *)artsyRed;
{
    return [UIColor ar_colorWithHex:0xc73030];
}

+ (UIColor *)artsyAttention
{
    return [UIColor ar_colorWithHex:0xffffd7];
}

@end

