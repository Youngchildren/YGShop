//
//  UITextView+Placeholder.m
//  ZKXFProject
//
//  Created by 卜立新 on 2018/8/7.
//  Copyright © 2018年 zhongkefurong. All rights reserved.
//

#import "UITextView+Placeholder.h"
#import <objc/runtime.h>

static char * const labelKey = "placeholderKey";
static char * const needAdjust = "needAdjust";
static char * changeLocation = "location";

@implementation UITextView (Placeholder)

#pragma mark - runtime method
+ (void)load
{
    method_exchangeImplementations(class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc")), class_getInstanceMethod([self class], NSSelectorFromString(@"swizzledDealloc")));
}

+ (void)swizzledDealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self swizzledDealloc];
}

- (BOOL)needAdjustFont
{
    return [objc_getAssociatedObject(self, needAdjust) boolValue];
}

- (void)setNeedAdjustFont:(BOOL)needAdjustFont
{
    objc_setAssociatedObject(self, needAdjust, @(needAdjustFont), OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark -
- (UILabel *)placeholdLabel
{
    UILabel *lbl = objc_getAssociatedObject(self, labelKey);
    if (!lbl) {
        lbl = [[UILabel alloc] init];
        lbl.textAlignment = NSTextAlignmentLeft;
        lbl.numberOfLines = 0;
        lbl.textColor = [self.class defaultPlaceholderColor];
        objc_setAssociatedObject(self, labelKey, lbl, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePlaceholdLabel) name:UITextViewTextDidChangeNotification object:nil];
        [self addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew) context:nil];
    }
    return lbl;
}

/**
 设置placeholder颜色

 @return <#return value description#>
 */
+ (UIColor *)defaultPlaceholderColor
{
    static UIColor *color = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        UITextField *textField = [[UITextField alloc] init];
        textField.placeholder = @" ";
        color = [textField valueForKeyPath:@"placeholderLabel.textColor"];
    });
    return color;
}

- (void)updatePlaceholdLabel
{
    if (self.text.length) {
        [self.placeholdLabel removeFromSuperview];
    }
    [self insertSubview:self.placeholdLabel atIndex:0];
    
    // 更新字体
    if ([self needAdjustFont]) {
        self.placeholdLabel.font = self.font;
        [self setNeedAdjustFont:NO];
    }
    // 边距
    CGFloat lineFragmentPadding = self.textContainer.lineFragmentPadding;
    UIEdgeInsets contentInset = self.textContainerInset;
    // frame
    CGFloat labelX = lineFragmentPadding + contentInset.left;
    CGFloat labelY = contentInset.top;
    if (self.location.x != 0 || self.location.y != 0) {
        
        if (self.location.x < 0 || self.location.x > CGRectGetWidth(self.bounds) - lineFragmentPadding - contentInset.right || self.location.y< 0) {
            // 不做处理
        }else{
            labelX += self.location.x;
            labelY += self.location.y;
        }
        
    }
    
    CGFloat labelW = CGRectGetWidth(self.bounds)  - contentInset.right - labelX;
    CGFloat labelH = [self.placeholdLabel sizeThatFits:CGSizeMake(labelW, MAXFLOAT)].height;
    self.placeholdLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
    
}

#pragma mark - observer font KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"font"])
    {
        self.needAdjustFont = YES;
        [self updatePlaceholdLabel];
    }
}

#pragma mark - getter and setter
- (void)setPlaceholder:(NSString *)placeholder
{
    self.placeholdLabel.text = placeholder;
    [self updatePlaceholdLabel];
}

- (NSString *)placeholder
{
    return self.placeholdLabel.text;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    self.placeholdLabel.textColor = placeholderColor;
    [self updatePlaceholdLabel];
}

- (UIColor *)placeholderColor
{
    return self.placeholdLabel.textColor;
}

- (void)setAttributePlaceholder:(NSAttributedString *)attributePlaceholder
{
    self.placeholdLabel.attributedText = attributePlaceholder;
    [self updatePlaceholdLabel];
}

- (NSAttributedString *)attributePlaceholder
{
    return self.placeholdLabel.attributedText;
}

- (void)setLocation:(CGPoint)location
{
    objc_setAssociatedObject(self, changeLocation,NSStringFromCGPoint(location), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updatePlaceholdLabel];
}

-(CGPoint)location
{
    return CGPointFromString(objc_getAssociatedObject(self, changeLocation));
}

@end
