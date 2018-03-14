//
//  NSBundle+GHLLanguage.m
//  GHLLocalizable
//
//  Created by gonghonglou on 2018/3/14.
//  Copyright © 2018年 Troy. All rights reserved.
//

#import "NSBundle+GHLLanguage.h"
#import <objc/runtime.h>

static const NSString *GHLBundleKey = @"GHLLanguageKey";

@interface BundleEx : NSBundle

@end

@implementation BundleEx

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {
    
    NSBundle *bundle = objc_getAssociatedObject(self, &GHLBundleKey);
    if (bundle) {
        return [bundle localizedStringForKey:key value:value table:tableName];
    } else {
        return [super localizedStringForKey:key value:value table:tableName];
    }
}

@end

@implementation NSBundle (GHLLanguage)

+ (void)setLanguage:(NSString *)language {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object_setClass([NSBundle mainBundle], [BundleEx class]);
    });
    id value = language ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]] : nil;
    objc_setAssociatedObject([NSBundle mainBundle], &GHLBundleKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end

