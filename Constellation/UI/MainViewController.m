//
//  MainViewController.m
//  ZrtTool
//
//  Created by BillyWang on 15/10/14.
//  Copyright © 2015年 zrt. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"
#import "BackgroundViewController.h"
#import "MainNewHealineViewController.h"
#import "DSNavViewController.h"
#import "HomeViewController.h"

@interface MainViewController()<UITabBarControllerDelegate>

@end

@implementation MainViewController

#pragma mark -

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
    [self constructNotLoginViewControllers];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.selectedViewController beginAppearanceTransition: NO animated: animated];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.selectedViewController endAppearanceTransition];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    UINavigationController *nav = (UINavigationController *)viewController;
    
    if ([tabBarController.viewControllers containsObject:nav]) {
//        UIViewController *vc = [nav.viewControllers objectAtIndex:0];
//        
//        if ([vc respondsToSelector:@selector(refreshDefaultData)]) {
//            [vc performSelector:@selector(refreshDefaultData)];
//        }
    }
    
    return YES;
}

#pragma mark - 手势密码验证

- (void)createViewControllers
{
//    FamilyViewController *hvc    = [[FamilyViewController alloc] init];
    
    HomeViewController *hvc      = [[HomeViewController alloc] init];
    MainNewHealineViewController *mvc = [[MainNewHealineViewController alloc] init];

    
    DSNavViewController *hNav    = [[DSNavViewController alloc] initWithRootViewController:hvc];
    DSNavViewController *mNav    = [[DSNavViewController alloc] initWithRootViewController:mvc];

    
    [self setTabBarItem:hNav
                  title:@"星座"
            selectImage:@"星座选中"
          unselectImage:@"星座未选中"
                    tag:1];
    
    [self setTabBarItem:mNav
                  title:@"新闻"
            selectImage:@"头条选中"
          unselectImage:@"头条未选中"
                    tag:2];
    self.viewControllers = @[hNav,mNav];
}

- (void)constructNotLoginViewControllers
{
    [self createViewControllers];
    
    self.selectedIndex = 0;
//    self.tabBar.backgroundImage = [UIImage imageWithColor:RGB(237, 217, 219)];
    self.tabBar.backgroundImage = [UIImage imageWithColor:[UIColor whiteColor]];
}

- (void)setTabBarItem:(UINavigationController *) navController
                title:(NSString *)title
          selectImage:(NSString *)selectImage
        unselectImage:(NSString *)unselectImage
                  tag:(NSUInteger)tag
{
    UIImage * normalSelectImage = [IMAGE_NAME(selectImage) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * normalImage = [IMAGE_NAME(unselectImage) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navController.tabBarItem.title = title;
    
    NSDictionary *seleDic = [NSDictionary dictionaryWithObjectsAndKeys:
                               RGB(104, 58, 224),
                               NSForegroundColorAttributeName
                               ,nil];
    [navController.tabBarItem setTitleTextAttributes:seleDic forState:UIControlStateSelected];
    
//
//    NSDictionary *normalDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14.0f],NSFontAttributeName,
//                               nil];
//    [navController.tabBarItem setTitleTextAttributes:normalDic forState:UIControlStateNormal];

    
    navController.tabBarItem.image = normalImage;
    navController.tabBarItem.selectedImage = normalSelectImage;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
}



@end
