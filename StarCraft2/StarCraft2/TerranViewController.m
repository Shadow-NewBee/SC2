//
//  TerranViewController.m
//  StarCraft2
//
//  Created by xiaoT on 15/10/20.
//  Copyright © 2015年 赖三聘. All rights reserved.
//

#import "TerranViewController.h"
#import "TerranCollectionViewCell.h"
#import "SCUnits.h"
#import "SCUnitsGroup.h"



@interface TerranViewController ()

@property (nonatomic, strong) NSMutableArray *unitGroup;
@property(nonatomic,retain)UICollectionView*myCollectionView;

@end

@implementation TerranViewController

//static NSString * const reuseIdentifier = @"Cell";
-(BOOL)prefersStatusBarHidden
{
    return YES;
}


-(NSMutableArray *)unitGroup
{
    if (_unitGroup == nil) {
        _unitGroup = [SCUnitsGroup unitGroupList];
    }
    return _unitGroup;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.collectionView.delegate = self;
    
    self.collectionView.userInteractionEnabled = YES;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return self.unitGroup.count;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    SCUnitsGroup *unitGroup = self.unitGroup[section];
    return unitGroup.units.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    static NSString *reusedId = @"TerranId";
    // Configure the cell
    TerranCollectionViewCell *cell = (TerranCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reusedId forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[TerranCollectionViewCell alloc]init];
    }
    SCUnitsGroup *unitGroup = self.unitGroup[indexPath.section];
//    NSLog(@"--------%@",self.unitGroup[indexPath.section]);
    cell.nameLabel.text = [unitGroup.units[indexPath.row] name];
    SCUnits *unit = unitGroup.units[indexPath.row];
    cell.iconView.image = [UIImage imageNamed:unit.icon];
    
    return cell;
}


//尝试实现collectionViewCell的移动

#pragma mark - LXReorderableCollectionViewDataSource methods

-(void)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)fromIndexPath willMoveToIndexPath:(NSIndexPath *)toIndexPath
{
    SCUnitsGroup *unitGroup = self.unitGroup[fromIndexPath.item];
    [self.unitGroup removeObjectAtIndex:fromIndexPath.item];
    [self.unitGroup insertObject:unitGroup atIndex:toIndexPath.item];
}

-(BOOL)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)fromIndexPath canMoveToIndexPath:(NSIndexPath *)toIndexPath
{
    return YES;
}

#pragma mark <UICollectionViewDelegate>

//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor cyanColor];
//}
//
//-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
