//
//  FMTCodeViewController.m
//  FMTQRCode
//
//  Created by 凡施健 on 13-5-17.
//  Copyright (c) 2013年 凡施健. All rights reserved.
//

#import "FMTCodeViewController.h"
#import "FMTImageSet.h"

@interface FMTCodeViewController ()

@end

@implementation FMTCodeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"二维码显示";
    
    pointType = QRPointRect;
    positionType = QRPositionNormal;
    codeColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
//    codeColor = [UIColor darkGrayColor];
    [imageView setBackgroundColor:[UIColor lightGrayColor]];
    codeImage = [QRCodeGenerator qrImageForString:_codeContent imageSize:imageView.frame.size.width withPointType:pointType withPositionType:positionType withColor:codeColor];
    [imageView setImage:codeImage];
    
//    UIColor *bColor = [UIColor darkGrayColor];
//    const CGFloat *components = CGColorGetComponents(bColor.CGColor);
//    NSLog(@"a :%f  b :%f   c:%f",components[0],components[1],components[2]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectColor:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择二维码的颜色" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"red",@"orange",@"yellow",@"green",@"blue",@"mageta",@"black", nil];
    actionSheet.tag = 1;
//    [actionSheet showInView:self.view];
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}

- (IBAction)selectBackgroundColor:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择二维码的颜色" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"鸨色",@"肌色",@"练色",@"白绿",@"藤色",@"珊瑚色",@"灰白", nil];
    actionSheet.tag = 2;
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}

- (IBAction)selectPointType:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择点的type" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"矩形点", @"圆点",nil];
    actionSheet.tag = 3;
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}

- (IBAction)selectPositionType:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择角的type" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"直角",@"圆角", nil];
    actionSheet.tag = 4;
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (actionSheet.tag == 1 || actionSheet.tag == 2) {
        UIColor *aColor;
        UIColor *bColor;
        switch (buttonIndex) {
            case 0:
                aColor = [UIColor redColor];
                bColor = [UIColor colorWithRed:0.97 green:0.68 blue:0.75 alpha:1.0];// 鸨色
                break;
            case 1:
                aColor = [UIColor orangeColor];
                bColor = [UIColor colorWithRed:1.0 green:0.87 blue:0.72 alpha:1.0];// 肌色
                break;
            case 2:
                aColor = [UIColor yellowColor];
                bColor = [UIColor colorWithRed:0.84 green:0.78 blue:0.61 alpha:1.0];// 练色
                break;
            case 3:
                aColor = [UIColor greenColor];
                bColor = [UIColor colorWithRed:0.79 green:0.91 blue:0.78 alpha:1.0];// 白绿
                break;
            case 4:
                aColor = [UIColor blueColor];
                bColor = [UIColor colorWithRed:0.67 green:0.71 blue:0.85 alpha:1.0];// 藤色
                break;
            case 5:
                aColor = [UIColor magentaColor];
                bColor = [UIColor colorWithRed:0.96 green:0.68 blue:0.65 alpha:1.0];// 珊瑚色
                break;
            case 6:
                aColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];// 这里不能使用blackcolor方法 因为blackcolor方法不是按照RGB来计算的
                bColor = [UIColor colorWithRed:0.86 green:0.84 blue:0.75 alpha:1.0];// 灰白
                break;
            default:
                aColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];// 这里不能使用blackcolor方法 因为blackcolor方法不是按照RGB来计算的
                bColor = [UIColor colorWithRed:0.86 green:0.84 blue:0.75 alpha:1.0];// 灰白
                break;
        }
        if (actionSheet.tag == 1) {
            // 改变二维码的颜色
            codeColor = aColor;
            UIImage *bImage = [FMTImageSet colorizeImage:codeImage withColor:aColor];
            [imageView setImage:bImage];
        }else {
            [imageView setBackgroundColor:bColor];
        }
    }else {
        if (actionSheet.tag == 3) {
            switch (buttonIndex) {
                case 0:
                    pointType = QRPointRect;
                    break;
                case 1:
                    pointType = QRPointRound;
                    break;
                default:
                    break;
            }
        }else if(actionSheet.tag == 4) {
            switch (buttonIndex) {
                case 0:
                    positionType = QRPositionNormal;
                    break;
                case 1:
                    positionType = QRPositionRound;
                    break;
                default:
                    break;
            }
        }
        codeImage = [QRCodeGenerator qrImageForString:_codeContent imageSize:imageView.frame.size.width withPointType:pointType withPositionType:positionType withColor:codeColor];
        [imageView setImage:codeImage];
    }
}
@end
