//
//  main.m
//  debug_objc
//
//  Created by xy00 on 2020/9/21.
//

#import <Foundation/Foundation.h>
#import "TestIMP.h"
#import "TestMethod.h"
#import "TestProperty.h"
#import "TestIvar.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        TestIMP *testIMP = [[TestIMP alloc] init];
//        [testIMP test];
//
//        TestMethod *testMethod = [[TestMethod alloc] init];
//        [testMethod test];
//
//        TestProperty *testProperty = [[TestProperty alloc] init];
//        [testProperty test];
        
        TestIvar *testIvar = [[TestIvar alloc] init];
        [testIvar test];
    }
    return 0;
}
