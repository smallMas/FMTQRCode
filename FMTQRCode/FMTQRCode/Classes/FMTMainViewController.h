//
//  FMTMainViewController.h
//  FMTQRCode
//
//  Created by 凡施健 on 13-5-17.
//  Copyright (c) 2013年 凡施健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface FMTMainViewController : UIViewController <UITextViewDelegate,ZBarReaderDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    IBOutlet UITextView *scourceTextView;
    IBOutlet UILabel *textLabel;
}

- (IBAction)compiledCode:(id)sender;
- (IBAction)scanningImg:(id)sender;
- (IBAction)readFromAlbums:(id)sender;
- (IBAction)clickFourButton:(id)sender;
@end
