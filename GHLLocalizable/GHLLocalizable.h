//
//  GHLLocalizable.h
//  GHLLocalizable
//
//  Created by gonghonglou on 2018/3/14.
//  Copyright © 2018年 Troy. All rights reserved.
//

#import <Foundation/Foundation.h>

// 简体中文
#define GHLChinese_Hans @"zh-Hans"
// 繁体中文
#define GHLChinese_Hant @"zh-Hant"
// 英文
#define GHL_English @"en"

#define GHLNotificationLanguageChanged @"languageChanged"

#define GHLLanguageKey @"language"

#define CurrentLanguageIsChinese ([[GHLInternationalControl chineseHans] containsObject:[GHLLocalizable userLanguage]])

#import <Foundation/Foundation.h>

@interface GHLLocalizable : NSObject

+ (void)initUserLanguage;

// 设置当前语言
+ (void)setUserlanguage:(NSString *)language;

// 获取应用当前语言
+ (NSString *)userLanguage;

@end
