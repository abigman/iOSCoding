//
//  UIView+NKMoreAttribute.m
//  NKKugouIOS-1
//
//  Created by hegf on 14-12-29.
//  Copyright (c) 2014年 hegf. All rights reserved.
//

#import "UIView+NKMoreAttribute.h"

@implementation UIView (NKMoreAttribute)

-(CGFloat)width{
    return self.frame.size.width;
}

-(CGFloat)height{
    return self.frame.size.height;
}

-(CGFloat)left{
    return self.frame.origin.x;
}

-(CGFloat)right{
    return self.frame.origin.x + self.frame.size.width;
}

-(CGFloat)up{
    return self.frame.origin.y;
}

- (CGFloat)bottom{
    return self.frame.origin.y +self.frame.size.height;
}

@end
