//
//  ViewController.m
//  KVC
//
//  Created by Mr_zhang on 16/10/8.
//  Copyright © 2016年 Mr_zhang. All rights reserved.
//

#import "ViewController.h"
#import "YGPerson.h"
#import "YGCar.h"
#import <objc/runtime.h>
#import "YGCar+Name.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float price = 200.0;
    
    // ---------------------- KVC给属性赋值 ---------------------
    YGPerson *person = [[YGPerson alloc] init];
    // person对象给NSString类型的name赋值（使用setValue: forKey: 方法）
    [person setValue:@"YGM" forKey:@"name"];
    NSLog(@"name:%@",person.name);
    NSLog(@"name2:%@",[person valueForKey:@"name"]);  // KVC读取属性中的值
    
    YGCar *car = [[YGCar alloc] init];
    person.car = car;
    // person对象给YGCar类中NSNumber类型的属性price赋值 (使用setValue: forKeyPath: 方法)
    [person setValue:[NSNumber numberWithFloat:price] forKeyPath:@"car.price"];
    NSLog(@"price:%f",car.price.floatValue);
    NSLog(@"price2:%@",[person valueForKeyPath:@"car.price"]);  // KVC读取属性中的值
    
    
    // 获取指定类的所有成员变量
    [self getMemberVariables];
    
    YGCar *car1 = [[YGCar alloc] init];
    car1.name = @"abcccc";
    NSLog(@"name:%@",car1.name);
}

/**
 *  获取当前类的所有属性变量
 *
 *  @return 数组(存放类的所有属性)
 */
- (NSArray *)getAllProperties
{
    u_int count;
    objc_property_t *properties  =class_copyPropertyList([UIPageControl class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<count; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    free(properties);
    return propertiesArray;
}

- (void)runTests
{
    unsigned int count;
    Method *methods = class_copyMethodList([self class], &count);
    for (int i = 0; i < count; i++)
    {
        Method method = methods[i];
        SEL selector = method_getName(method);
        NSString *name = NSStringFromSelector(selector);
        //        if ([name hasPrefix:@"test"])
        NSLog(@"方法 名字 ==== %@",name);
        if (name)
        {
            //avoid arc warning by using c runtime
            //            objc_msgSend(self, selector);
        }
        
        NSLog(@"Test '%@' completed successfuly", [name substringFromIndex:4]);
    }
}

/**
 *  运行时(runtime)，获取所有成员变量
 */
- (void)getMemberVariables
{
    unsigned ivarCount;
    Ivar *ivars = class_copyIvarList([UIPageControl class], &ivarCount);
    
    for (int i = 0; i < ivarCount; i ++) {
        
        NSString *varibale = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
        
        NSLog(@"%@",varibale);
    }
    
}





@end
