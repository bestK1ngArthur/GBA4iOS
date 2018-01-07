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

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle
{
    return [[self alloc] initWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherActions:@[] preferredStyle:UIAlertControllerStyleAlert];
}

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle preferredStyle:(UIAlertControllerStyle)preferredStyle
{
    return [[self alloc] initWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherActions:@[] preferredStyle:preferredStyle];
}

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherActions:(NSArray *)otherActions preferredStyle:(UIAlertControllerStyle)preferredStyle
{
    return [[self alloc] initWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherActions:otherActions preferredStyle:preferredStyle];
}

- (instancetype)initWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherActions:(NSArray *)otherActions preferredStyle:(UIAlertControllerStyle)preferredStyle
{
    
    self = [UIAlertController alertControllerWithTitle:title
                                               message:message
                                        preferredStyle:preferredStyle];
    
    for (id action in otherActions)
    {
        if ([action isKindOfClass:[UIAlertAction class]])
        {
            [self addAction:action];
        }
    }
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
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

+ (instancetype)alertControllerWithError:(NSError *)error cancelButtonTitle:(NSString *)cancelButtonTitle otherActions:(NSArray *)otherActions
{
    return [self alertControllerWithError:error cancelButtonTitle:cancelButtonTitle otherActions:otherActions];
}

- (instancetype)initWithError:(NSError *)error cancelButtonTitle:(NSString *)cancelButtonTitle otherActions:(NSArray *)otherActions
{
    self = [UIAlertController alertControllerWithTitle:[error localizedDescription]
                                               message:[error localizedRecoverySuggestion]
                                        preferredStyle:UIAlertControllerStyleAlert];
    
    self = [[UIAlertController alloc] initWithTitle:[error localizedDescription]
                                            message:[error localizedRecoverySuggestion]
                                  cancelButtonTitle:cancelButtonTitle
                                       otherActions:otherActions
                                     preferredStyle:UIAlertControllerStyleAlert];
    
    return self;
}

@end
