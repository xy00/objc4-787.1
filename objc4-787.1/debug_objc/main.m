//
//  main.m
//  debug_objc
//
//  Created by xy00 on 2020/9/15.
//

#import <Foundation/Foundation.h>
#import "IMPTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        IMPTest *imptest = [[IMPTest alloc] init];
        [imptest instanceTest];
        NSLog(@"Hello, World!");
    }
    return 0;
}
