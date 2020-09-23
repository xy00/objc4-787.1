//
//  TestBaseIvar.m
//  debug_objc
//
//  Created by xy00 on 2020/9/22.
//

#import "TestBaseIvar.h"

static NSString *_baseIndex;
@implementation TestBaseIvar

- (void)setBaseIndex:(NSString *)baseIndex
{
    _baseIndex = baseIndex;
}

- (NSString *)baseIndex
{
    return _baseIndex;
}

@end
