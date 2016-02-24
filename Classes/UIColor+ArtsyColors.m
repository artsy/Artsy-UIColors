
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
  + (UIColor *)artsyGrayLightest
{
    return [UIColor ar_colorWithHex:0xefefef];
}

+ (UIColor *)artsyGrayLighter
{
    return [UIColor ar_colorWithHex:0xe5e5e5];
}

+ (UIColor *)artsyGray
{
    return [UIColor ar_colorWithHex:0xcccccc];
}

+ (UIColor *)artsyGrayDark
{
    return [UIColor ar_colorWithHex:0x999999];
}

+ (UIColor *)artsyGrayDarker
{
    return [UIColor ar_colorWithHex:0x666666];
}

+ (UIColor *)artsyGrayDarkest
{
    return [UIColor ar_colorWithHex:0x333333];
}

+ (UIColor *)artsyPurpleLight
{
    return [UIColor ar_colorWithHex:0xb179d4];
}

+ (UIColor *)artsyPurple
{
    return [UIColor ar_colorWithHex:0x6a0bc1];
}

+ (UIColor *)artsyRedLight
{
    return [UIColor ar_colorWithHex:0xf4acb2];
}

+ (UIColor *)artsyRed
{
    return [UIColor ar_colorWithHex:0xcc3333];
}

+ (UIColor *)artsyYellowLight
{
    return [UIColor ar_colorWithHex:0xf9f8d8];
}

+ (UIColor *)artsyYellow
{
    return [UIColor ar_colorWithHex:0xccc8a2];
}

+ (UIColor *)artsyGreenLight
{
    return [UIColor ar_colorWithHex:0xb0d766];
}

+ (UIColor *)artsyGreen
{
    return [UIColor ar_colorWithHex:0x4f8200];
}

@end