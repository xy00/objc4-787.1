//
//  TestMethod.m
//  debug_objc
//
//  Created by 刘光辉(健康互联网) on 2020/9/21.
//

#import "TestMethod.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation TestMethod

+ (NSString *)testMethod:(NSString *)msg
{
    NSString *logMsg = [@"CLASS: " stringByAppendingString:[msg uppercaseString]];
    return logMsg;
}

- (NSString *)testMethod:(NSString *)msg
{
    NSString *logMsg = [@"INSTANCE: " stringByAppendingString:[msg uppercaseString]];
    return logMsg;
}

- (void)testMethod
{
    // -class return isa class
    // +class return class
    NSString * (*function) (id , SEL , NSString *);
    
    Method method1 = class_getInstanceMethod(self.class, @selector(testMethod:)); // MethodTest
    const char *encoding1 = method_getTypeEncoding(method1);
    NSString *encodingValue1 = [NSString stringWithUTF8String:encoding1];
    NSLog(@"%@", encodingValue1);
    function = (NSString *(*)(id , SEL , NSString *))method_getImplementation(method1);
    NSLog(@"%@", function(self, @selector(testMethod:), @"method_1"));
    
    Method method2 = class_getInstanceMethod(TestMethod.class, @selector(testMethod:)); // MethodTest
    const char *encoding2 = method_getTypeEncoding(method2);
    NSString *encodingValue2 = [NSString stringWithUTF8String:encoding2];
    NSLog(@"%@", encodingValue2);
    function = (NSString *(*)(id , SEL , NSString *))method_getImplementation(method2);
    NSLog(@"%@", function(self, @selector(testMethod:), @"method_2"));
    
    Method method3 = class_getClassMethod(self.class, @selector(testMethod:));
    const char *encoding3 = method_getTypeEncoding(method3);
    NSString *encodingValue3 = [NSString stringWithUTF8String:encoding3];
    NSLog(@"%@", encodingValue3);
    function = (NSString *(*)(id , SEL , NSString *))method_getImplementation(method3);
    NSLog(@"%@", function(self, @selector(testMethod:), @"method_3"));
    
    Method method4 = class_getClassMethod(TestMethod.class, @selector(testMethod:));
    const char *encoding4 = method_getTypeEncoding(method4);
    NSString *encodingValue4 = [NSString stringWithUTF8String:encoding4];
    NSLog(@"%@", encodingValue4);
    function = (NSString *(*)(id , SEL , NSString *))method_getImplementation(method4);
    NSLog(@"%@", function(self, @selector(testMethod:), @"method_4"));
    
}

@end
