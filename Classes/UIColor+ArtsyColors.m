// For references on names see
// https://www.artsy.net/style-guide/colors

#import <EDColor/EDColor.h>
#import "UIColor+ArtsyColors.h"

@implementation UIColor (ArtsyColors)

+ (UIColor *)artsyLightGrey
{
    return [UIColor colorWithHex:0xe5e5e5];
}

+ (UIColor *)artsyMediumGrey
{
    return [UIColor colorWithHex:0xcccccc];
}

+ (UIColor *)artsyHeavyGrey
{
    return [UIColor colorWithHex:0x888888];
}

+ (UIColor *)artsyPurple
{
    return [UIColor colorWithHex:0x6a0bc1];
}

+ (UIColor *)artsyPurpleWithAlpha:(CGFloat)alpha
{
    return [UIColor colorWithHex:0x6a0bc1 andAlpha:alpha];
}

+ (UIColor *)artsyRed;
{
    return [UIColor colorWithHex:0xc73030];
}

+ (UIColor *)artsyAttention
{
    return [UIColor colorWithHex:0xfcecc5];
}

@end

