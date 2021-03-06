//
//  ProductsViewController.m
//  NavCtrl
//
//  Created by Chris on 7/16/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import "ProductsViewController.h"

@interface ProductsViewController ()

@end

@implementation ProductsViewController

static NSString * const reuseIdentifier = @"cvCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureRecognized:)];
    //    [self.collectionView addGestureRecognizer:longPress];
    
    // Register cell classes
    [self.collectionView registerClass:[CVCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Configure layout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(200, 200)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.collectionView setCollectionViewLayout:flowLayout];
    [flowLayout setSectionInset:UIEdgeInsetsMake(50, 50, 50, 50)];
    
    // Do any additional setup after loading the view.
    self.dao = [DAO sharedDAO]; //––––– Instantiate DAO singleton
    
    self.webViewVC = [[WKWebViewController alloc] initWithNibName:@"WKWebViewController" bundle:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.editing = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    self.navigationController.toolbarHidden = editing;
    if (editing) {
        [self.navigationItem.leftBarButtonItem setTarget:self];
        [self.navigationItem.leftBarButtonItem setAction:@selector(cancel)];
    }
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dao.products count]; //––––– Return count for DAO's products array
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell
    NSObjectProduct *currentProduct = [self.dao.products objectAtIndex:indexPath.row]; //––––– This object changes for each row i.e. each product
    
    CVCell *cell = (CVCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if (self.editing == YES) {
        cell.deleteLabel.hidden = NO;
    }
    else {
        cell.deleteLabel.hidden = YES;
    }
    
    [cell.cellLabel setText: currentProduct.name];
    
    cell.cellLogo.image = [UIImage imageNamed:currentProduct.productPic];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.editing == YES) {
        NSObjectProduct *currentProduct = [self.dao.products objectAtIndex:indexPath.row];
        [self.dao deleteProduct:currentProduct];
        [self.collectionView reloadData];
        
    } else {
        // Pass the selected object to the new view controller.
        CVCell *currentCell = (CVCell*)[self.collectionView cellForItemAtIndexPath:indexPath];
        self.webViewVC.title =  currentCell.cellLabel.text;
        self.webViewVC.currentProduct = [self.dao.products objectAtIndex:indexPath.row]; //––––  webVC will refer to selected product
        
        // Push the view controller.
        [self.navigationController pushViewController:self.webViewVC animated:YES];
    }
    
}

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


#pragma mark - Navigation
/*
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark Rearrange with long press (uncomment code in viewDidLoad as well)
//- (IBAction)longPressGestureRecognized:(id)sender {
//    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
//    UIGestureRecognizerState state = longPress.state;
//
//    CGPoint location = [longPress locationInView:self.collectionView];
//    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:location];
//
//    static UIView       *snapshot = nil;        ///< A snapshot of the row user is moving.
//    static NSIndexPath  *sourceIndexPath = nil; ///< Initial index path, where gesture begins.
//
//    switch (state) {
//        case UIGestureRecognizerStateBegan: {
//            if (indexPath) {
//                sourceIndexPath = indexPath;
//
//                UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
//
//                // Take a snapshot of the selected row using helper method.
//                snapshot = [self customSnapshoFromView:cell];
//
//                // Add the snapshot as subview, centered at cell's center...
//                __block CGPoint center = cell.center;
//                snapshot.center = center;
//                snapshot.alpha = 0.0;
//                [self.collectionView addSubview:snapshot];
//                [UIView animateWithDuration:0.25 animations:^{
//
//                    // Offset for gesture location.
//                    center.y = location.y;
//                    snapshot.center = center;
//                    snapshot.transform = CGAffineTransformMakeScale(1.05, 1.05);
//                    snapshot.alpha = 0.98;
//
//                    // Fade out.
//                    cell.alpha = 0.0;
//                } completion:nil];
//            }
//            break;
//        }
//
//        case UIGestureRecognizerStateChanged: {
//            CGPoint center = snapshot.center;
//            center.y = location.y;
//            snapshot.center = center;
//
//            // Is destination valid and is it different from source?
//            if (indexPath && ![indexPath isEqual:sourceIndexPath]) {
//
//                // ... update data source.
//                [self.dao.companies exchangeObjectAtIndex:indexPath.row withObjectAtIndex:sourceIndexPath.row];
//
//                // ... move the rows.
//                [self.collectionView moveItemAtIndexPath:sourceIndexPath toIndexPath:indexPath];
//
//                // ... and update source so it is in sync with UI changes.
//                sourceIndexPath = indexPath;
//            }
//            break;
//        }
//
//        default: {
//            // Clean up.
//            UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:sourceIndexPath];
//            [UIView animateWithDuration:0.25 animations:^{
//
//                snapshot.center = cell.center;
//                snapshot.transform = CGAffineTransformIdentity;
//                snapshot.alpha = 0.0;
//
//                // Undo the fade-out effect we did.
//                cell.alpha = 1.0;
//
//            } completion:^(BOOL finished) {
//
//                [snapshot removeFromSuperview];
//                snapshot = nil;
//
//            }];
//            sourceIndexPath = nil;
//            break;
//        }
//    }
//}
//
//- (UIView *)customSnapshoFromView:(UIView *)inputView {
//
//    // Make an image from the input view.
//    UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, NO, 0);
//    [inputView.layer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//    // Create an image view.
//    UIView *snapshot = [[UIImageView alloc] initWithImage:image];
//    snapshot.layer.masksToBounds = NO;
//    snapshot.layer.cornerRadius = 0.0;
//    snapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0);
//    snapshot.layer.shadowRadius = 5.0;
//    snapshot.layer.shadowOpacity = 0.4;
//
//    return snapshot;
//}

@end
