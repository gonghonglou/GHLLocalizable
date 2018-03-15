//
//  NSBundle+GHLLanguage.h
//  GHLLocalizable
//
//  Created by gonghonglou on 2018/3/14.
//  Copyright © 2018年 Troy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (GHLLanguage)

/**
 * 设置当前语言
 *
 * @param language 当前语言字符串形式
 */
+ (void)setLanguage:(NSString *)language;

@end
