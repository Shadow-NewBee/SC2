//
//  SCRaceCell.h
//  StarCraft2
//
//  Created by xiaoT on 15/10/18.
//  Copyright © 2015年 赖三聘. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCRaceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *raceImageView;
@property (weak, nonatomic) IBOutlet UILabel *raceLabel;

+(instancetype)ScCellWithTableView:(UITableView *)tableView;
@end
