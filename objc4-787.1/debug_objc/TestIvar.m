//
//  TestIvar.m
//  debug_objc
//
//  Created by xy00 on 2020/9/22.
//

#import "TestIvar.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface TestIvar()
{
    NSString *sex;
}

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger age;

@end

@implementation TestIvar

- (void)test
{

    self.name = @"NIO";
    self.age = 30;
    self->sex = @"123789";
    self.baseIndex = @"INDEX";
    Ivar var2 = class_getClassVariable(self.superclass, @"baseIndex".UTF8String); // 取不到值
    var2 = class_getInstanceVariable(self.superclass, @"testIvar".UTF8String);
    if (var2)
    {
    }
    unsigned int outCount = 0;
    Ivar *ivar_list = class_copyIvarList(self.class, &outCount);
    for (NSInteger i=0; i<outCount; i++)
    {
        Ivar ivar = ivar_list[i];
        const char *name = ivar_getName(ivar);
        NSLog(@"%@", [NSString stringWithUTF8String:name]);
        ptrdiff_t offset = ivar_getOffset(ivar);
        NSLog(@"%@", @(offset));
        const char *encoding = ivar_getTypeEncoding(ivar);
        NSLog(@"%@", [NSString stringWithUTF8String:encoding]);

        // object_getIvar 只能返回引用类型的值，值类型会导致 crash
        // 建议使用 valueForKey: 来获取对应的值
        //object_getIvar(self, ivar);
        id value = [self valueForKey:[NSString stringWithUTF8String:name]];
        NSLog(@"%@", value);
    }
    /**
     *2020-09-23 09:14:15.108891+0800 debug_objc[66986:1661736] sex
     *2020-09-23 09:14:15.109979+0800 debug_objc[66986:1661736] 24
     *2020-09-23 09:14:15.110307+0800 debug_objc[66986:1661736] @"NSString"
     *2020-09-23 09:14:15.111011+0800 debug_objc[66986:1661736] 123789
     *2020-09-23 09:14:15.111296+0800 debug_objc[66986:1661736] _name
     *2020-09-23 09:14:15.111457+0800 debug_objc[66986:1661736] 32
     *2020-09-23 09:14:15.111712+0800 debug_objc[66986:1661736] @"NSString"
     *2020-09-23 09:14:15.112202+0800 debug_objc[66986:1661736] NIO
     *2020-09-23 09:14:15.112293+0800 debug_objc[66986:1661736] _age
     *2020-09-23 09:14:15.112373+0800 debug_objc[66986:1661736] 40
     *2020-09-23 09:14:15.112449+0800 debug_objc[66986:1661736] q
     *2020-09-23 09:14:15.113049+0800 debug_objc[66986:1661736] 30
    */
}

@end
