//
//  BaseKeyboardDetective.m
//  MyKeyboardBaseScroller
//
//  Created by user on 2016/6/22.
//  Copyright © 2016年 user. All rights reserved.
//

#import "BaseKeyboardDetective.h"

@implementation BaseKeyboardDetective

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setKeyboardNotifacation];
}

#pragma mark - Keyboard Detective
-(void)setKeyboardNotifacation{
    
    [[NSNotificationCenter defaultCenter] addObserver:self                              selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyboardWillShow:(NSNotification*)notification{
    
    NSDictionary *userInfo = [notification userInfo];
    // NSValue > CGRect > CGSize
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    NSLog(@"Keyboard Height: %f, Width: %f",keyboardSize.height, keyboardSize.width);
    
    // Specify the Keyboard Height to reset the scroll-view's contentInset and scrollIndicatorInset.
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0);
    self.baseScrollView.contentInset = contentInsets;
    self.baseScrollView.scrollIndicatorInsets = contentInsets;
}

-(void)keyboardWillHide:(NSNotification*)notification{
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.baseScrollView.contentInset = contentInsets;
    self.baseScrollView.scrollIndicatorInsets = contentInsets;
}

#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self.view endEditing:YES];
    return false;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL isok = YES;
    //    int tag = (int)textField.tag;
    //    int action = tag / 1000;
    //
    //    if(action == 1 && isok){
    //        if ([string rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location != NSNotFound)
    //        {
    //            isok = NO;
    //        }
    //    }
    return isok;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    
}

@end
