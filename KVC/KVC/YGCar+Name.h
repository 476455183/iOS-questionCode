//
//  YGCar+Name.h
//  KVC
//
//  Created by Mr_zhang on 16/10/9.
//  Copyright © 2016年 Mr_zhang. All rights reserved.
//

#import "YGCar.h"

@interface YGCar (Name)
/**
 *  在分类中声明一个属性时，智慧生成setter和getter方法的声明，不会生成setter和getter方法的实现以及带下划线的成员变量。】
 //runtime 动态添加属性
 */
@property (nonatomic, strong) NSString *name;

@end
