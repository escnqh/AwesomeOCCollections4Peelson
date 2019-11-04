//
//  UIViewController+PIAdditions.h
//  AwesomeOCCollections4Peelson
//
//  Created by Peelson on 2019/11/4.
//  Copyright © 2019 Peelson. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (PIAdditions)

/// 获取sourceViewController上present出来的最上层ViewController， 可能是UINavigationController或者UIViewController
/// @param sourceViewController 目标viewController
/// @return 最上层ViewController
+ (UIViewController *)pi_toppestViewController:(UIViewController *)sourceViewController;

/// 获取sourceVC上present出来的最上层 UINavigationController
/// @param sourceViewController 目标viewController
/// @return 最上层 UINavigationController，找不到则返回空
+ (UIViewController *)pi_toppestNavigationViewController:(UIViewController *)sourceViewController;


/// 获取present出来最上面的VC，可能是UINavigationController或者UIViewController
+ (UIViewController *)pi_topViewController;


/// 为 viewController dismiss 所有 present 起来的 VC
/// @param viewController 目标ViewController
/// @param animated 是否进行动画
/// @param completion 完成后block
+ (void)pi_dismissAllViewControllersForViewController:(UIViewController *)viewController
                                             animated:(BOOL)animated
                                           completion:(void (^)(void))completion;

/// 获取((AppDelegate *)[UIApplication sharedApplication].delegate).window.rootViewController的最上面看到的ViewController
+ (UIViewController *)pi_visibleViewController;

/// 把自己pop或者dismiss
- (void)pi_viewControllerDismissSelf;

/// 是否是最上层VC
- (BOOL)pi_isVisibaleViewController;


/// 能push就push，不能就present
/// @param viewController 目标ViewController
- (void)pi_showViewController:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
