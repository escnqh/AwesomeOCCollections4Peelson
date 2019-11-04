//
//  UIViewController+PIAdditions.m
//  AwesomeOCCollections4Peelson
//
//  Created by Peelson on 2019/11/4.
//  Copyright © 2019 Peelson. All rights reserved.
//

#import "UIViewController+PIAdditions.h"
#import "AppDelegate.h"

@implementation UIViewController (PIAdditions)

+ (UIViewController *)pi_toppestViewController:(UIViewController *)sourceViewController {
    UIViewController *presentViewController = sourceViewController.presentedViewController;
    if (!presentViewController || presentViewController.isBeingDismissed) {
        return sourceViewController;
    } else {
        return [self pi_toppestViewController:presentViewController];
    }
}

+ (UIViewController *)pi_toppestNavigationViewController:(UIViewController *)sourceViewController {
    UIViewController *viewcController = [UIViewController pi_toppestViewController:sourceViewController];
    if ([viewcController isKindOfClass:UINavigationController.class]) {
        return (UIViewController *)viewcController;
    } else if ([sourceViewController isKindOfClass:UINavigationController.class]) {
        return (UINavigationController *)sourceViewController;
    } else {
        return nil;
    }
}

+ (UIViewController *)pi_topViewController {
    return [self pi_topViewController:((AppDelegate *)[UIApplication sharedApplication].delegate).window.rootViewController];
}

+ (UIViewController *)pi_topViewController:(UIViewController *)rootViewController
{
    if (rootViewController.presentedViewController == nil) {
        return rootViewController;
    }

    if ([rootViewController.presentedViewController isMemberOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return [self pi_topViewController:lastViewController];
    }

    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    return [self pi_topViewController:presentedViewController];
}

+ (void)pi_dismissAllViewControllersForViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion {
    if (viewController.presentedViewController == nil) {
        if (completion) {
            completion();
        }
    } else {
        [UIViewController pi_dismissAllViewControllersForViewController:viewController.presentedViewController animated:animated completion:^{
            if (viewController.presentedViewController.isBeingDismissed) {
                if (completion) {
                    completion();
                } else {
                    [viewController.presentedViewController dismissViewControllerAnimated:animated completion:completion];
                }
            }
        }];
    }
}

+ (UIViewController *)pi_visibleViewController {
    UIViewController *rootViewController = ((AppDelegate *)[UIApplication sharedApplication].delegate).window.rootViewController;
    return [self pi_visibleViewControllerFrom:rootViewController];
}

+ (UIViewController *)pi_visibleViewControllerFrom:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self pi_visibleViewControllerFrom:[((UINavigationController *)vc) visibleViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self pi_visibleViewControllerFrom:[((UITabBarController *)vc) selectedViewController]];
    } else {
        if (vc.presentedViewController) {
            return [self pi_visibleViewControllerFrom:vc.presentedViewController];
        } else {
            return vc;
        }
    }
}

- (void)pi_viewControllerDismissSelf {
    if (self.navigationController) {
        if ([self.navigationController.viewControllers.firstObject isEqual:self]) {
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        } else {
            [self.navigationController popViewControllerAnimated:YES];
        }
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (BOOL)pi_isVisibaleViewController {
    return self == [UIViewController pi_visibleViewController];
}

- (void)pi_showViewController:(UIViewController *)viewController {
    if (![viewController isKindOfClass:[UIViewController class]]) {
        return;
    }
    if ([self isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)self;
        viewController.hidesBottomBarWhenPushed = YES;
        [nav pushViewController:viewController animated:YES];
    } else {
        if (self.navigationController) {
            viewController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:viewController animated:YES];
        } else {
            [self presentViewController:viewController animated:YES completion:^{
            }];
        }
    }
}

@end
