//
//  EntryViewController.m
//  TextureTTDemo
//
//  Created by ByteDance on 25/11/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EntryViewController.h"
#import "DemoViewController.h"

#import <TextureTTDemo-Swift.h>

@interface EntryViewController ()

@property (nonatomic, strong) UIButton *demoButton;
@property (nonatomic, strong) UIButton *featureButton;

@end

@implementation EntryViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.demoButton = [[UIButton alloc] init];
        [self.demoButton setTitle:@"Demo" forState:UIControlStateNormal];
        [self.demoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.demoButton addTarget:self action:@selector(navigateToDemo) forControlEvents:UIControlEventTouchUpInside];
        
        self.featureButton = [[UIButton alloc] init];
        [self.featureButton setTitle:@"Benchmark" forState:UIControlStateNormal];
        [self.featureButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.featureButton addTarget:self action:@selector(navigateToBenchmark) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.demoButton];
    [self.view addSubview:self.featureButton];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.demoButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.featureButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.demoButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.demoButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [self.featureButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.featureButton.topAnchor constraintEqualToAnchor:self.demoButton.bottomAnchor constant:-10.0]
    ]];
}

- (void)navigateToDemo {
    DemoViewController *demoController = [[DemoViewController alloc] init];
    [self.navigationController pushViewController:demoController animated:YES];
}

- (void)navigateToBenchmark {
    BenchmarkViewController *viewController = [[BenchmarkViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
