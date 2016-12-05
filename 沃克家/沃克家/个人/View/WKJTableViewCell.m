//
//  WKJTableViewCell.m
//  沃克家
//
//  Created by kura on 2016/12/2.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "WKJTableViewCell.h"

@interface WKJTableViewCell ()

@end

@implementation WKJTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 15/375, SCREEN_WIDTH * 15/375, SCREEN_WIDTH * 20/375, SCREEN_WIDTH * 20/375)];
        [self.contentView addSubview:_leftImageView];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.leftImageView.frame) + SCREEN_WIDTH * 10/375, self.leftImageView.frame.origin.y, SCREEN_WIDTH * 200/320, self.leftImageView.frame.size.height)];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont fontWithName:@"AppleGothic" size:13.0f];
        [self.contentView addSubview:_titleLabel];
    }
    return self;
}



@end
