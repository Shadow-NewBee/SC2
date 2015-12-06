//
//  ViewController.m
//  StarCraft2
//
//  Created by xiaoT on 15/10/18.
//  Copyright © 2015年 赖三聘. All rights reserved.
//

#import "ViewController.h"
#import "SCRaceCell.h"
#import "TerranViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *raceList;
@property (nonatomic, strong) NSArray *imageList;

@end

@implementation ViewController

-(BOOL)prefersStatusBarHidden
{
    return NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *SCArray = [[NSArray alloc] initWithObjects:@"Terran",@"Protos",@"Zerg", nil];
    NSArray *imageArray = [[NSArray alloc] initWithObjects:@"T.jpg",@"P.jpg",@"Z.jpg", nil];
    
    self.raceList = SCArray;
    self.imageList = imageArray;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.raceList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCRaceCell *cell = [SCRaceCell ScCellWithTableView:tableView];
    
    cell.raceLabel.text = self.raceList[indexPath.row];
    cell.raceImageView.image = [UIImage imageNamed:self.imageList[indexPath.row]];
    return cell;
}


#pragma delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 175;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Cell was selected");
   
    if (indexPath.row == 0) {
        
        TerranViewController *terranViewController = [[TerranViewController alloc]init];
       
        terranViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TerranViewController"];

        [self.navigationController pushViewController:terranViewController animated:YES];

    }
//   这里可以继续用判断来进行。
    
}




@end
