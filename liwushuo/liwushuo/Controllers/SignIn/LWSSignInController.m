//
//  LWSSignInController.m
//  liwushuo
//
//  Created by lee on 2017/11/24.
//  Copyright © 2017年 Pinellia Zeit. All rights reserved.
//

#import "LWSSignInController.h"

@interface LWSSignInController ()<UIScrollViewDelegate, UITextFieldDelegate>

/// 密码输入框
@property (nonatomic, strong) UITextField *passwordTextField;
/// 手机号输入框
@property (nonatomic, strong) UITextField *photoNumTextField;
/// 密码或者短信验证图标
@property (nonatomic, strong) UIImageView *passwordImageV;
/// 获取验证码按钮
@property (nonatomic, strong) UIButton *authBtn;

@property (nonatomic, strong) UIScrollView *bgScrollView;
@end

#define topMargin (Main_Screen_Height == 812.0 ? 55 : 21)

@implementation LWSSignInController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self baseUI];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.bgScrollView endEditing:YES];
}

//只要scrollView在滚动，就会调用这个方法（监听scrollView的滚动）
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"只要scrollView在滚动,%@, %@",NSStringFromCGSize(scrollView.contentSize),NSStringFromCGRect(scrollView.frame));
}

//用户即将开始拖拽scrollView，就会调用这个方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"用户即将开始拖拽");
}

//用户即将停止拖拽scrollView，就会调用这个方法
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"用户即将停止拖拽");
}

//用户已经停止拖拽scrollView，就会调用这个方法
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (decelerate == NO) {
        NSLog(@"scrollView停止滚动，完全静止");
    } else {
        NSLog(@"用户停止拖拽，但是scrollView由于惯性，会继续滚动，并且减速");
    }
}

//scrollView已经停止减速，就会调用这个方法（停止滚动）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"（停止滚动）");
}


#pragma mark - cycleView
- (void)baseUI
{
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            //ok
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft).inset(0);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight).inset(0);
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).inset(0);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).inset(0);
//            make.edges.equalTo(self.view.mas_safeAreaLayoutGuide);
        } else {
            make.edges.equalTo(self.view);
        }
//        make.edges.equalTo(self.view);
    
    }];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(Main_Screen_Width, Main_Screen_Height * 2);
    
    UITapGestureRecognizer *tapGeus = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        [scrollView endEditing:YES];
    }];
    [scrollView addGestureRecognizer:tapGeus];
    
    // 头像
    UIImageView *iconImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_info_boy_70x70_"]];
    [scrollView addSubview:iconImageV];
    [iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(@68);
        make.top.equalTo(scrollView).offset(topMargin);
        make.centerX.equalTo(scrollView);
        
    }];
    
    // 标题
    UILabel *signLabel = [[UILabel alloc] init];
    [scrollView addSubview:signLabel];
    [signLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconImageV.mas_bottom).offset(18);
        make.centerX.equalTo(iconImageV);
    }];
    signLabel.font = [UIFont fontWithName:@"PingFang SC" size:15.0];
    signLabel.text = @"注册登录";
    signLabel.textColor = [UIColor colorWithRed:50/255.0 green:30/255.0 blue:30/255.0 alpha:1.0];
    signLabel.textAlignment = NSTextAlignmentCenter;
    
    // 头部 view
    UIView *signHeaderView = [[UIView alloc] init];
    [scrollView addSubview:signHeaderView];
    [signHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(scrollView);
        make.height.mas_equalTo(@220);
        make.centerX.equalTo(scrollView);
        make.top.equalTo(scrollView).offset(204);
        
    }];
//    signHeaderView.backgroundColor = [UIColor blueColor];
    
    // 底部 view
    UIView *signFooterView = [[UIView alloc] init];
    [scrollView addSubview:signFooterView];
    [signFooterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scrollView).offset(460);
        make.height.mas_equalTo(@136);
        make.width.equalTo(scrollView);
        make.bottom.equalTo(scrollView).offset(-20);
    }];
    signFooterView.backgroundColor = [UIColor whiteColor];
    
    [self drawHeaderUI:signHeaderView];
    [self drawFooterUI:signFooterView];
}

- (void)drawHeaderUI:(UIView *)headerView
{
    // 手机图标
    UIImageView *phoneImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon_Mobile Phone_24x24_"]];
    [headerView addSubview:phoneImageView];
    [phoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView);
        make.left.equalTo(headerView).offset(44);
        make.width.height.mas_equalTo(@24);
    }];
    phoneImageView.contentMode = UIViewContentModeScaleToFill;
    
    // 短信图标
    UIImageView *msgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon_Message_24x24_"]];
    [headerView addSubview:msgImageView];
    [msgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneImageView.mas_bottom).offset(16);
        make.height.with.mas_equalTo(@24);
        make.left.equalTo(phoneImageView);
    }];
    msgImageView.contentMode = UIViewContentModeScaleToFill;
    self.passwordImageV = msgImageView;
    
    // 选择手机区号
    UIButton *selectPhotoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [headerView addSubview:selectPhotoBtn];
    [selectPhotoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneImageView.mas_right).offset(12);
        make.height.mas_equalTo(@22);
        make.width.mas_equalTo(@45);
        make.centerY.equalTo(phoneImageView.mas_centerY);
        
    }];
    [selectPhotoBtn setTitle:@"＋86" forState:UIControlStateNormal];
    selectPhotoBtn.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:14];
    [selectPhotoBtn setTitleColor:RGB(80, 60, 60) forState:UIControlStateNormal];
    
    // 手机号输入框
    UITextField *phoneTextField = [[UITextField alloc] init];
    [headerView addSubview:phoneTextField];
    [phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(selectPhotoBtn.mas_right).offset(12);
        make.height.mas_equalTo(@30);
        make.right.equalTo(headerView).offset(-44);
        make.centerY.equalTo(phoneImageView.mas_centerY);
    }];
//    phoneTextField.placeholder = @"输入手机号";
    phoneTextField.textColor = RGB(140, 120, 120);
    phoneTextField.delegate = self;
    NSAttributedString *attPlaceholder = [[NSAttributedString alloc] initWithString:@"输入手机号" attributes:@{NSForegroundColorAttributeName : RGB(140, 120, 120)}];
    phoneTextField.attributedPlaceholder = attPlaceholder;
    phoneTextField.font = [UIFont fontWithName:@"PingFang SC" size:14.0];
    phoneTextField.borderStyle = UITextBorderStyleNone;
    phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.photoNumTextField = phoneTextField;

    /// 下划线
    UIView *lineViewOne = [[UIView alloc] init];
    [headerView addSubview:lineViewOne];
    [lineViewOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneTextField.mas_bottom).offset(5);
        make.height.mas_equalTo(@0.5);
        make.left.equalTo(phoneImageView.mas_right).offset(12);
        make.right.equalTo(headerView).offset(-44);
        
    }];
    lineViewOne.backgroundColor = RGB(240, 230, 230);
 
    UITextField *passwordTextField = [[UITextField alloc] init];
    [headerView addSubview:passwordTextField];
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(lineViewOne.mas_bottom).offset(10);
        make.left.equalTo(selectPhotoBtn);
        make.right.height.equalTo(phoneTextField);
        make.centerY.equalTo(msgImageView.mas_centerY);
    }];
    passwordTextField.textColor = RGB(140, 120, 120);
    NSAttributedString *placeholder = [[NSAttributedString alloc] initWithString:@"短信验证码" attributes:@{NSForegroundColorAttributeName : RGB(140, 120, 120)}];

    passwordTextField.attributedPlaceholder = placeholder;
    passwordTextField.font = [UIFont fontWithName:@"PingFang SC" size:13.0];
    passwordTextField.borderStyle = UITextBorderStyleNone;
    passwordTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.passwordTextField = passwordTextField;
    
    /// 下划线
    UIView *lineViewTwo = [[UIView alloc] init];
    [headerView addSubview:lineViewTwo];
    [lineViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwordTextField.mas_bottom).offset(5);
        make.height.mas_equalTo(@0.5);
        make.left.equalTo(phoneImageView.mas_right).offset(12);
        make.right.equalTo(headerView).offset(-44);
        
    }];
    lineViewTwo.backgroundColor = RGB(240, 230, 230);

    UIButton *authBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [headerView addSubview:authBtn];
    [authBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.right.equalTo(passwordTextField);
        make.height.mas_equalTo(@28);
        make.width.mas_equalTo(@76);
        
    }];
    authBtn.layer.cornerRadius = 3.0;
    authBtn.layer.masksToBounds = YES;
    [authBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    authBtn.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:11.0];
    [authBtn setBackgroundColor:RGB(220, 210, 210)];
    self.authBtn = authBtn;
    
    // 登录按钮
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [headerView addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineViewTwo.mas_bottom).offset(33);
        make.height.mas_equalTo(@43);
//        make.width.equalTo(headerView).multipliedBy(0.8);
        make.left.equalTo(headerView).offset(44.0);
        make.right.equalTo(headerView).offset(-44.0);
        make.centerX.equalTo(headerView);
    }];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:RGB(220, 210, 210)];
    loginBtn.layer.cornerRadius = 3.0;
    loginBtn.layer.masksToBounds = YES;
    loginBtn.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:15.0];
    [loginBtn addTarget:self action:@selector(signInButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    // 切换密码方式
    UIButton *switchPasswordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [headerView addSubview:switchPasswordBtn];
    [switchPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginBtn.mas_bottom).offset(18);
        make.right.equalTo(loginBtn);
        make.height.mas_equalTo(@30);
    }];
    
    [switchPasswordBtn setTitle:@"使用密码登录" forState:UIControlStateNormal];
    [switchPasswordBtn setTitle:@"使用验证码登录" forState:UIControlStateSelected];
    [switchPasswordBtn setTitleColor:RGB(255, 80, 102) forState:UIControlStateNormal];
    switchPasswordBtn.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:12.0];
    [switchPasswordBtn addTarget:self action:@selector(switchPasswordInput:) forControlEvents:UIControlEventTouchUpInside];

    UIButton *secureText = [UIButton buttonWithType:UIButtonTypeCustom];
    [headerView addSubview:secureText];
    [secureText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(@30);
//        make.right.equalTo(passwordTextField);
    }];
    [secureText setTitle:@"" forState:UIControlStateNormal];
    [secureText setImage:[UIImage imageNamed:@"Icon_visible_close_24x24_"] forState:UIControlStateNormal];
    [secureText setImage:[UIImage imageNamed:@"Icon_visible_open_24x24_"] forState:UIControlStateSelected];
    [secureText setTitleColor:RGB(140, 120, 120) forState:UIControlStateNormal];
    [secureText addTarget:self action:@selector(closeOrOpenPasswordVisible:) forControlEvents:UIControlEventTouchUpInside];

    passwordTextField.rightView = secureText;
    passwordTextField.rightViewMode = UITextFieldViewModeAlways;

}


- (void)drawFooterUI:(UIView *)footerView
{
    UILabel *titleLabel = [[UILabel alloc] init];
    [footerView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(footerView);
        make.centerX.equalTo(footerView);
        make.height.mas_equalTo(@17);
    }];
    
    titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:12.0];
    titleLabel.textColor = RGB(140, 120, 120);
    titleLabel.text = @"使用社交账号登录";
    
    UIView *leftView = [[UIView alloc] init];
    [footerView addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@0.5);
        make.centerY.equalTo(titleLabel);
        make.left.equalTo(footerView).offset(40);
        make.right.equalTo(titleLabel.mas_left).offset(-11);
    }];
    leftView.backgroundColor = RGB(240, 230, 230);
//    leftView.backgroundColor = [UIColor redColor];
    
    UIView *rightView = [[UIView alloc] init];
    [footerView addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@0.5);
        make.centerY.equalTo(titleLabel);
        make.right.equalTo(footerView).offset(-40);
        make.left.equalTo(titleLabel.mas_right).offset(11);
    }];
    rightView.backgroundColor = RGB(240, 230, 230);
    
    // 微信第三方登陆
    UIButton *weChatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerView addSubview:weChatBtn];
    [weChatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(footerView);
        make.height.width.mas_equalTo(@36);
        make.top.equalTo(titleLabel.mas_bottom).offset(30);
    }];
    [weChatBtn setImage:[UIImage imageNamed:@"wechat_36x36_"] forState:UIControlStateNormal];
    // 新浪第三方登陆
    UIButton *sinaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerView addSubview:sinaBtn];
    [sinaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(footerView).offset(-102);
        make.height.width.top.equalTo(weChatBtn);
    }];
    [sinaBtn setImage:[UIImage imageNamed:@"sina_36x36_"] forState:UIControlStateNormal];
    // QQ 第三方登陆
    UIButton *qqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerView addSubview:qqBtn];
    [qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(footerView).offset(102);
        make.height.width.top.equalTo(weChatBtn);
    }];
    [qqBtn setImage:[UIImage imageNamed:@"qq_36x36_"] forState:UIControlStateNormal];
}



/**
 切换登录方式，短信验证码 或者是 密码登录

 @param button 切换登录方式按钮
 */
- (void)switchPasswordInput:(UIButton *)button
{
    button.selected = !button.selected;
    self.authBtn.hidden = button.selected;
    self.passwordTextField.secureTextEntry = button.selected;

    NSAttributedString *placeholder = [[NSAttributedString alloc] initWithString:@"短信验证码" attributes:@{NSForegroundColorAttributeName : RGB(140, 120, 120)}];
    NSAttributedString *selectAttHolder = [[NSAttributedString alloc] initWithString:@"输入密码" attributes:@{NSForegroundColorAttributeName : RGB(140, 120, 120)}];
    
    
    if (button.selected) {
        self.passwordImageV.image = [UIImage imageNamed:@"Icon_Password_24x24_"];
        self.passwordTextField.attributedPlaceholder = selectAttHolder;
    }else {
        self.passwordImageV.image = [UIImage imageNamed:@"Icon_Message_24x24_"];
        self.passwordTextField.attributedPlaceholder = placeholder;
        
    }
    
}
#pragma mark - ButtonTouchEvent

/**
 切换登录方式事件

 @param button 切换登录按钮
 */
- (void)signInButtonClick:(UIButton *)button
{
    if ([self convertToInt:self.photoNumTextField.text] > 11) {
        NSLog(@"%d, 不允许", [self convertToInt:self.photoNumTextField.text]);
        return;
    }
    NSLog(@"%d, 允许输入", [self convertToInt:self.photoNumTextField.text]);
}

- (void)closeOrOpenPasswordVisible:(UIButton *)button
{
    button.selected = !button.selected;
    self.passwordTextField.secureTextEntry = !button.selected;
}




#pragma mark - TextField Delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([self convertToInt:string] > 11) {
        NSLog(@"%d, 不允许", [self convertToInt:string]);
        return  NO;
    }
    NSLog(@"%d, 允许输入", [self convertToInt:string]);
    return YES;
}


// 判断字符串长度(包含中英文)
- (int)convertToInt:(NSString *)string
{
    int strlength = 0;
    char* p = (char*)[string cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[string lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;
}

// 判断字符串包含汉字的个数
- (int)chineseNumber:(NSString *)str
{
    int t = 0;
    for ( int i = 0; i < str.length; i++) {
        unichar ch = [str characterAtIndex:i];
        if (0x4e00 < ch  && ch < 0x9fff)
        {
            t++;

        }
    }
    return t;
}

// 判断字符串是否为纯数字
- (BOOL)isPureNumandCharacters:(NSString *)string
{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        return NO;
    }
    return YES;
}
@end
