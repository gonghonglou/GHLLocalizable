//
//  GHLLocalizable.m
//  GHLLocalizable
//
//  Created by gonghonglou on 2018/3/14.
//  Copyright © 2018年 Troy. All rights reserved.
//

#import "GHLLocalizable.h"
#import "NSBundle+GHLLanguage.h"

static GHLLocalizable *currentLanguage;

@implementation GHLLocalizable

+ (void)initUserLanguage {
    NSString *language = [GHLLocalizable userLanguage];
    if ([[GHLLocalizable chineseHans] containsObject:language]) {
        language = [[GHLLocalizable chineseHans] firstObject];
    } else if ([[GHLLocalizable chineseHant] containsObject:language]) {
        language = [GHLLocalizable chineseHant].firstObject;
    } else if ([[GHLLocalizable english] containsObject:language]) {
        language = [GHLLocalizable english].firstObject;
    }

    [[NSUserDefaults standardUserDefaults] setObject:language forKey:GHLLanguageKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [NSBundle setLanguage:language];
    [[NSNotificationCenter defaultCenter] postNotificationName:GHLNotificationLanguageChanged object:currentLanguage];
}

+ (NSArray *)english {
    return @[@"en", @"en-CN"];
}

+ (NSArray *)chineseHans {
    return @[@"zh-Hans", @"zh-Hans-CN"];
}

+ (NSArray *)chineseHant {
    return @[@"zh-Hant", @"zh-Hant-CN"];
}

// 设置当前语言
+ (void)setUserlanguage:(NSString *)language {
    if ([[GHLLocalizable userLanguage] isEqualToString:language]) return;
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:GHLLanguageKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [NSBundle setLanguage:language];
    [[NSNotificationCenter defaultCenter] postNotificationName:GHLNotificationLanguageChanged object:currentLanguage];
}

// 获取应用当前语言
+ (NSString *)userLanguage {
    NSString *language = [[NSUserDefaults standardUserDefaults] objectForKey:GHLLanguageKey];
    if (language.length <= 0) {
        NSArray *languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        return languages.firstObject;
    }
    return language;
}

@end

