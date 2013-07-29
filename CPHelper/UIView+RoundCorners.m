#import "UIView+RoundCorners.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (RoundCorners)

-(void)roundCorners:(UIRectCorner)corners withRadius:(float)radius {
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
