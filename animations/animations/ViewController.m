//
//  ViewController.m
//  animations
//
//  Created by Erick Dávila on 1/9/20.
//  Copyright © 2020 Erick Dávila. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    int width = [UIScreen mainScreen].bounds.size.width;
    int y = 50;
    LOTAnimationView *cloud = [[LOTAnimationView alloc] initWithFrame:CGRectMake(width/2 - 100, y, 200, 200)];
    cloud.animation = @"cloud";
    [self.view addSubview:cloud];
    cloud.loopAnimation = YES;
    [cloud play];
    y = y + 250;
    
    LOTAnimationView *finger = [[LOTAnimationView alloc] initWithFrame:CGRectMake(width/2 - 50, y, 200, 200)];
    finger.animation = @"finger";
    [self.view addSubview:finger];
    finger.loopAnimation = YES;
    [finger play];
    y = y + 250;
    
    LOTAnimationView *data = [[LOTAnimationView alloc] initWithFrame:CGRectMake(width/2 - 100, y, 200, 200)];
    data.animation = @"circle";
    [self.view addSubview:data];
    data.loopAnimation = YES;
    [data play];
    y = y + 250;
    
}


@end
