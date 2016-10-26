//
//  ViewController.m
//  UIView和核心动画的区别
//
//  Created by liuxingchen on 16/10/26.
//  Copyright © 2016年 liuxingchen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *orangeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event

{
    
//        CABasicAnimation *anim = [CABasicAnimation animation];
//    
//        anim.keyPath = @"position";
//    
//        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(150, 400)];
//    
//        // 注意：取消反弹代码必须放在图层添加动画之前。
//        anim.removedOnCompletion = NO;
//    
//        anim.fillMode = kCAFillModeForwards;
//    
//        anim.delegate = self;
//    
//        [self.orangeView.layer addAnimation:anim forKey:nil];
    
    //UIView动画
    [UIView animateWithDuration:0.25 animations:^{
        
        self.orangeView.layer.position = CGPointMake(150, 400);
    }completion:^(BOOL finished) {
                         NSLog(@"%@", NSStringFromCGPoint(self.orangeView.layer.position));
    }];
// 注意：核心动画一切都是假象，并不会真实的改变图层的属性值，如果以后做动画的时候，不需要与用户交互，通常用核心动画（转场）。
    
// UIView动画必须通过修改属性的真实值，才有动画效果。
}
//核心动画的代理不需要遵守协议
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"%@", NSStringFromCGPoint(self.orangeView.layer.position));
}
@end
