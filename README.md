# GHLLocalizable

iOS 应用内语言设置工具

[![Packagist](https://img.shields.io/badge/license-MIT-green.svg)](https://raw.githubusercontent.com/gonghonglou/GHLLocalizable/master/LICENSE)
[![CocoaPods](https://img.shields.io/badge/pod-v1.3.1-green.svg)](https://cocoapods.org/pods/GHLLocalizable)
[![Travis](https://img.shields.io/badge/platform-ios-green.svg)](https://www.apple.com/nl/ios)
[![Build Status](https://travis-ci.org/gonghonglou/GHLLocalizable.svg?branch=master)](https://travis-ci.org/gonghonglou/GHLLocalizable)


# Demo 工程
请查看 `Example/GHLLocalizable.xcodeproj` 目录下示例工程

# 使用方法

默认你已经完成了对工程本地化语言的配置，如果没有，请参考我的博客文章：[iOS应用程序语言本地化及应用内语言设置（二）](http://gonghonglou.com/2018/03/14/set-language-2/)

## 应用内语言设置

接下来要做的就是使用 GHLLocalizable 获取软件语言、设置语言、监听语言改变等操作。

1、在 `AppDelegate` 的 `- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions` 方法里初始化该工具类，并监听通知：
```
// 语言初始化
[GHLLocalizableController initUserLanguage];
// 监控语言切换
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(languageChange:) name:GHLNotificationLanguageChanged object:nil];
```

2、记得在 `- (void)applicationWillTerminate:(UIApplication *)application`方法里删除通知：
```
[[NSNotificationCenter defaultCenter] removeObserver:self name:GHLNotificationLanguageChanged object:nil];
```

3、实现通知方法：
```
- (void)languageChange:(NSNotification *)note {
    // 在该方法里实现重新初始化 rootViewController 的行为，并且所有带有文字的页面都要重新渲染
    // 比如：[UIApplication sharedApplication].keyWindow.rootViewController = ...;
}
```

4、使用 `NSLocalizedString(<#key#>, <#comment#>)`方法 给所有文字添加本地化语言方法：
```
label.text = NSLocalizedString(@"这是一段本地化语言的文字", nil);
...
```

5、更改语言方法：
```
// 设置中文
[GHLLocalizable setUserlanguage:GHLChinese_Hans];

// 设置英文
[GHLLocalizable setUserlanguage:GHL_English];
```

# 安装
## CocoaPods
1. 添加 `pod 'GHLLocalizable'` 命令到你的 Podfile 文件。
2. 执行 `pod install` 方法，或者 `pod update` 方法。
3. 引用 `<GHLLocalizable/GHLLocalizable.h>` 头文件。

## 手动安装
1. 下载 GHLLocalizable 目录下的所有文件。
2. 添加这些源文件到你的工程里。
3. 引用 `GHLLocalizable.h` 头文件。

# License
DJLSplitCollectionView is provided under the MIT license. See LICENSE file for details.

