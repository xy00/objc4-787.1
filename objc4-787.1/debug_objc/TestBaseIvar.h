//
//  TestBaseIvar.h
//  debug_objc
//
//  Created by xy00 on 2020/9/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestBaseIvar : NSObject
{
    NSString *testIvar;
}
@property (nonatomic, strong) NSString *baseIndex;

@end

NS_ASSUME_NONNULL_END
