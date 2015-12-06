//
//  SCRaceCell.m
//  StarCraft2
//
//  Created by xiaoT on 15/10/18.
//  Copyright © 2015年 赖三聘. All rights reserved.
//

#import "SCRaceCell.h"

@interface SCRaceCell ()



@end

@implementation SCRaceCell

+(instancetype)ScCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseId = @"SCRaceCell";
    SCRaceCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:nil options:nil] lastObject];
    }
    return cell;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
