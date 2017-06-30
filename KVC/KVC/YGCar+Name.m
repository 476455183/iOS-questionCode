//
//  YGCar+Name.m
//  KVC
//
//  Created by Mr_zhang on 16/10/9.
//  Copyright © 2016年 Mr_zhang. All rights reserved.
//

#import "YGCar+Name.h"
#import <objc/message.h>

@implementation YGCar (Name)

- (void)setName:(NSString *)name
{
    //Associated:关联的意思
    
    /**
     *  产生关联，让某个对象(name)与当前对象的属性(name)产生关联 
        参数1：id object：表示给哪个对象添加关联
        参数2：const void *key ：表示id类型的key值（以后用这个key来获取属性）属性名
        参数3：id value ：属性值
        参数4：策略，是个枚举(点进去，解释详细)
     */
    objc_setAssociatedObject(self, "YGM", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name
{
    return objc_getAssociatedObject(self, "YGM");
}

@end
