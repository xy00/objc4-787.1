//
//  TestProperty.m
//  debug_objc
//
//  Created by xy00 on 2020/9/22.
//

#import "TestProperty.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface TestProperty()

@property (nonatomic, strong) NSString *myName;
@property (nonatomic, assign) NSInteger age;

@end

@implementation TestProperty

- (void)test
{
    objc_property_t property = class_getProperty(self.class, @"myName".UTF8String);
    const char *name = property_getName(property);
    NSLog(@"%@", [NSString stringWithUTF8String:name]);
    // myName
    const char *attributes = property_getAttributes(property);
    NSLog(@"%@", [NSString stringWithUTF8String:attributes]);
    // T@"NSString",&,N,V_myName
    unsigned int outCount = 0;
    objc_property_attribute_t *attribute_list = property_copyAttributeList(property, &outCount);
    for (NSInteger i=0; i<outCount; i++)
    {
        objc_property_attribute_t attribute_t = attribute_list[i];
        const char *attr_name = attribute_t.name;
        const char *attr_value = attribute_t.value;
        NSLog(@"%@", [NSString stringWithUTF8String:attr_name]);
        NSLog(@"%@", [NSString stringWithUTF8String:attr_value]);
//        class_getWeakIvarLayout(<#Class  _Nullable __unsafe_unretained cls#>)
//        class_getIvarLayout(<#Class  _Nullable __unsafe_unretained cls#>)
//        class_getInstanceVariable(<#Class  _Nullable __unsafe_unretained cls#>, <#const char * _Nonnull name#>)
//        class_copyIvarList(<#Class  _Nullable __unsafe_unretained cls#>, <#unsigned int * _Nullable outCount#>)
//        object_getIvar(<#id  _Nullable obj#>, <#Ivar  _Nonnull ivar#>)
    }
    /**
     *2020-09-22 10:14:17.647395+0800 debug_objc[77399:825618] T
     *2020-09-22 10:14:17.647635+0800 debug_objc[77399:825618] @"NSString"
     *2020-09-22 10:14:18.010213+0800 debug_objc[77399:825618] &
     *2020-09-22 10:14:18.010421+0800 debug_objc[77399:825618]
     *2020-09-22 10:14:18.446254+0800 debug_objc[77399:825618] N
     *2020-09-22 10:14:18.446412+0800 debug_objc[77399:825618]
     *2020-09-22 10:14:18.801959+0800 debug_objc[77399:825618] V
     *2020-09-22 10:14:18.802086+0800 debug_objc[77399:825618] _myName
     */
    
}

@end
