//
//  FMTImageSet.h
//  FMTQRCode
//
//  Created by 凡施健 on 13-5-21.
//  Copyright (c) 2013年 凡施健. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMTImageSet : NSObject

+(UIImage *)colorizeImage:(UIImage *)baseImage withColor:(UIColor *)theColor; //改变图片的颜色
+(UIImage *)colorizeImage:(UIImage *)baseImage withBackgroundColor:(UIColor *)theColor; //改变图片的背景色
+(UIImage *)maskImage:(UIImage *)baseImage withImage:(UIImage *)theMaskImage;
@end
