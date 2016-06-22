//
//  ViewController.m
//  MyKeyboardBaseScroller
//
//  Created by user on 2016/6/22.
//  Copyright © 2016年 user. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *kScrollView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.baseScrollView = _kScrollView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
