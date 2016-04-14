//
//  ViewController.m
//  TouchScale
//
//  Created by 陈李龙 on 16/4/13.
//  Copyright © 2016年 陈李龙. All rights reserved.
//

#import "ViewController.h"
#import "CLLScareView.h"

@class CLLScareView;


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (strong, nonatomic) IBOutlet CLLScareView *scareView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scareView.weightLabel = self.weightLabel;
}


-(BOOL)prefersStatusBarHidden{
    return YES;
}
@end
