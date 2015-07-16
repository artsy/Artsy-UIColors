#import <UIKit/UIKit.h>

@interface UIColor (ArtsyColors)

/// rules, button borders
+ (UIColor *)artsyLightGrey;

/// carrets and deselected UI elements
+ (UIColor *)artsyMediumGrey;

/// type under works
+ (UIColor *)artsyHeavyGrey;

/// standard Artsy logotype purple
+ (UIColor *)artsyPurple;

+ (UIColor *)artsyPurpleWithAlpha:(CGFloat)alpha;

/// standard error color
+ (UIColor *)artsyRed;

/// communication to user
+ (UIColor *)artsyAttention;

@end
