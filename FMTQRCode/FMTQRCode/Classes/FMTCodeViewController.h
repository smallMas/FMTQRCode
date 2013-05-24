//
//  FMTCodeViewController.h
//  FMTQRCode
//
//  Created by 凡施健 on 13-5-17.
//  Copyright (c) 2013年 凡施健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QRCodeGenerator.h"

@interface FMTCodeViewController : UIViewController <UIActionSheetDelegate>{
    IBOutlet UIImageView *imageView;
    UIImage *codeImage;
    QRPointType pointType;
    QRPositionType positionType;
    UIColor *codeColor;
}

@property (nonatomic,retain)NSString *codeContent;

- (IBAction)selectColor:(id)sender;
- (IBAction)selectBackgroundColor:(id)sender;
- (IBAction)selectPointType:(id)sender;
- (IBAction)selectPositionType:(id)sender;
@end
