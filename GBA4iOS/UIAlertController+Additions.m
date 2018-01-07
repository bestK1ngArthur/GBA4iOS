//
//  UIAlertViewController+Errors.m
//  GBA4iOS
//
//  Created by Arthur K1ng on 07/01/2018.
//  Copyright © 2018 Riley Testut. All rights reserved.
//

#import "UIAlertController+Additions.h"

@implementation UIAlertController (Additions)

#pragma mark - Basic

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle preferredStyle:(UIAlertControllerStyle)preferredStyle
{
    return [self alertControllerWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherActions:@[] preferredStyle:preferredStyle];
}

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherActions:(NSArray *)otherActions preferredStyle:(UIAlertControllerStyle)preferredStyle
{
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    return [[self alloc] initWithTitle:title message:message cancelAction:cancelAction otherActions:otherActions preferredStyle:preferredStyle];
}

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelAction:(UIAlertAction *)cancelAction otherActions:(NSArray *)otherActions preferredStyle:(UIAlertControllerStyle)preferredStyle
{
    return [[self alloc] initWithTitle:title message:message cancelAction:cancelAction otherActions:otherActions preferredStyle:preferredStyle];
}

- (instancetype)initWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelAction:(UIAlertAction *)cancelAction otherActions:(NSArray *)otherActions preferredStyle:(UIAlertControllerStyle)preferredStyle
{
    
    self = [UIAlertController alertControllerWithTitle:title
                                               message:message
                                        preferredStyle:preferredStyle];
    
    // Check and add actions to alert
    for (id action in otherActions)
    {
        if ([action isKindOfClass:[UIAlertAction class]])
        {
            [self addAction:action];
        }
    }

    // Add cancel action
    [self addAction:cancelAction];
    
    return self;
}

#pragma mark - Errors

+ (instancetype)alertControllerWithError:(NSError *)error
{
    return [self alertControllerWithError:error cancelButtonTitle:NSLocalizedString(@"OK", @"RSTAlertView Dismiss Button Title")];
}

+ (instancetype)alertControllerWithError:(NSError *)error cancelButtonTitle:(NSString *)cancelButtonTitle
{
    return [self alertControllerWithError:error cancelButtonTitle:cancelButtonTitle otherActions:@[]];
}

+ (instancetype)alertControllerWithError:(NSError *)error cancelAction:(UIAlertAction *)cancelAction
{
    return [self alertControllerWithError:error cancelAction:cancelAction otherActions:@[]];
}

+ (instancetype)alertControllerWithError:(NSError *)error cancelButtonTitle:(NSString *)cancelButtonTitle otherActions:(NSArray *)otherActions
{
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    return [[self alloc] initWithError:error cancelAction:cancelAction otherActions:otherActions];
}

+ (instancetype)alertControllerWithError:(NSError *)error cancelAction:(UIAlertAction *)cancelAction otherActions:(NSArray *)otherActions
{
    return [[self alloc] initWithError:error cancelAction:cancelAction otherActions:otherActions];
}

- (instancetype)initWithError:(NSError *)error cancelAction:(UIAlertAction *)cancelAction otherActions:(NSArray *)otherActions
{
    // For error alerts preferred style is UIAlertControllerStyleAlert
    
    self = [UIAlertController alertControllerWithTitle:[error localizedDescription]
                                               message:[error localizedRecoverySuggestion]
                                        preferredStyle:UIAlertControllerStyleAlert];
    
    self = [[UIAlertController alloc] initWithTitle:[error localizedDescription]
                                            message:[error localizedRecoverySuggestion]
                                       cancelAction:cancelAction
                                       otherActions:otherActions
                                     preferredStyle:UIAlertControllerStyleAlert];
    
    return self;
}

@end
