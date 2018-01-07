//
//  UIAlertViewController+Errors.h
//  GBA4iOS
//
//  Created by Arthur K1ng on 07/01/2018.
//  Copyright © 2018 Riley Testut. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (Additions)

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle preferredStyle:(UIAlertControllerStyle)preferredStyle;
+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherActions:(NSArray *)otherActions preferredStyle:(UIAlertControllerStyle)preferredStyle;
+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelAction:(UIAlertAction *)cancelAction otherActions:(NSArray *)otherActions preferredStyle:(UIAlertControllerStyle)preferredStyle;

+ (instancetype)alertControllerWithError:(NSError *)error;
+ (instancetype)alertControllerWithError:(NSError *)error cancelButtonTitle:(NSString *)cancelButtonTitle;
+ (instancetype)alertControllerWithError:(NSError *)error cancelAction:(UIAlertAction *)cancelAction;
+ (instancetype)alertControllerWithError:(NSError *)error cancelButtonTitle:(NSString *)cancelButtonTitle otherActions:(NSArray *)otherActions;
+ (instancetype)alertControllerWithError:(NSError *)error cancelAction:(UIAlertAction *)cancelAction otherActions:(NSArray *)otherActions;

@end

NS_ASSUME_NONNULL_END
