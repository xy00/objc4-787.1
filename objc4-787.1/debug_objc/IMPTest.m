//
//  IMPTest.m
//  debug_objc
//
//  Created by xy00 on 2020/9/18.
//

#import "IMPTest.h"

@implementation IMPTest

+ (void)testImp:(NSString *)msg
{
    long long address = (long long)self;
    NSLog(@"%@", @(address).stringValue);
    NSLog(@"CLASS:%@--%@", NSStringFromSelector(_cmd), msg);
}

- (void)testImp:(NSString *)msg
{
    long long address = (long long)self;
    NSLog(@"%@", @(address).stringValue);
    NSLog(@"INSTANCE:%@--%@", NSStringFromSelector(_cmd), msg);
}

- (void)instanceTest
{
    void (*function) (id self, SEL _cmd, NSString *msg);
    
    function = [IMPTest methodForSelector:@selector(testImp:)];
    function(self, @selector(testImp:), @"IMP TEST0");
    /**
    *  CLASS:testImp:--IMP TEST0
    *
    *  1. IMPTest
    *  2. IMPTest.Meta = IMPTest.isa_t
    *  3. find IMP with testImp: in IMPTest.Meta
    *  4. get IMP of class testImp:
    */
    
    function = [self methodForSelector:@selector(testImp:)];
    function(self, @selector(testImp:), @"IMP TEST1");
    /**
    *  INSTANCE:testImp:--IMP TEST1
    *
    *  1. IMPTest.instance = self
    *  2. IMPTest = IMPTest.instance.isa_t
    *  3. find IMP with testImp: in IMPTest
    *  4. get IMP of instance testImp:
    */
    
    function = [IMPTest instanceMethodForSelector:@selector(testImp:)];
    function(self, @selector(testImp:), @"IMP TEST2");
    /**
    *  INSTANCE:testImp:--IMP TEST2
    *
    *  1. IMPTest
    *  not get isa
    *  2. find IMP with testImp: in IMPTest
    *  3. get IMP of instance testImp:
    */
}

@end
