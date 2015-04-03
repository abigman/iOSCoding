//
//  UIButton+NKImage.h
//  NKKugouIOS-1
//
//  Created by hegf on 14-12-29.
//  Copyright (c) 2014年 hegf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (NKImage)
+(instancetype)buttonWithNormalImage:(NSString*)imageNormal hilightedImage: (NSString*)imageHighted target:(id)target action:(SEL)action;
+(instancetype)buttonWithNormalImage:(NSString*)imageNormal selectedImage: (NSString*)imageSelected target:(id)target action:(SEL)action;
@end
