//
//  SysController.m
//  KVO_Runtime
//
//  Created by  ZhuHong on 2018/1/2.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "SysController.h"
#import "KVObject.h"

@interface SysController ()

@property (nonatomic, strong) KVObject* kObj;

@end

@implementation SysController

- (KVObject*)kObj {
    if (!_kObj) {
        _kObj = [KVObject new];
    }
    return _kObj;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.kObj.name = @"HG";
    
    // ADD KVO
    [self.kObj addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@", change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.kObj.name = @"CoderHG";
}

- (void)dealloc {
    [self.kObj removeObserver:self forKeyPath:@"name"];
}

@end
