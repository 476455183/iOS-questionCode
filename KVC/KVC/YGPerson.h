//
//  YGPerson.h
//  KVC
//
//  Created by Mr_zhang on 16/10/8.
//  Copyright © 2016年 Mr_zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YGCar;

@interface YGPerson : NSObject
/**
 *  名称
 */
@property (nonatomic, copy) NSString *name;

/**
 *  汽车对象
 */
@property (nonatomic, strong) YGCar *car;

@end
