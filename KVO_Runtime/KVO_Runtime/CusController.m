//
//  CusController.m
//  KVO_Runtime
//
//  Created by  ZhuHong on 2018/1/2.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "CusController.h"
#import "KVObject.h"
#import "NSObject+KVO.h"

@interface CusController ()

@property (nonatomic, strong) KVObject* kObj;

@end

@implementation CusController

- (KVObject*)kObj {
    if (!_kObj) {
        _kObj = [KVObject new];
    }
    return _kObj;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.kObj.age = 21;
    
    [self.kObj PG_addObserver:self forKey:@"age" withBlock:^(id observedObject, NSString *observedKey, id oldValue, id newValue) {
        NSLog(@"%@, %@, %@, %@", observedObject, observedKey, oldValue, newValue);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.kObj.age = 22;
    
    NSLog(@"被成功修改  %zd", self.kObj.age);
}

- (void)dealloc {
    [self.kObj PG_removeObserver:self forKey:@"age"];
}


@end
