//
//  CLLScareView.m
//  TouchScale
//
//  Created by 陈李龙 on 16/4/13.
//  Copyright © 2016年 陈李龙. All rights reserved.
//

#import "CLLScareView.h"
#import "MBProgressHUD+MJ.h"

@interface CLLScareView()
@property (nonatomic,assign)CGFloat r;

@property (nonatomic,assign) CGPoint position;

@end

@implementation CLLScareView

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:3.0/255.0 green:169.0/255.0 blue:244.0/255.0 alpha:0.5].CGColor);
    

    CGRect c = CGRectMake(self.position.x - self.r, self.position.y - self.r, 2 * self.r, 2 * self.r);
    CGContextFillEllipseInRect(ctx, c);
    CGContextFillPath(ctx);
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   

}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:touch.view];
    self.position = touchPoint;

    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable ) {
        self.r = touch.force * 80;
        [self updateWeightLabel:touch.force * 57.72];
        [self setNeedsDisplay];
        
        
    }else{
        [MBProgressHUD showError:@"您的iPhone不支持！"];
    }
   

}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.r = 0.0;
    [self updateWeightLabel:0];
    [self setNeedsDisplay];
}

-(void)updateWeightLabel:(CGFloat)weight{
    
    self.weightLabel.text = [NSString stringWithFormat:@"%.0fg",weight];

}

@end
