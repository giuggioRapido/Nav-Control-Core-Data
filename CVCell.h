//
//  CVCell.h
//  NavCtrl
//
//  Created by Chris on 7/16/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
@class CompaniesViewController;

@interface CVCell : UICollectionViewCell

@property (retain, nonatomic) IBOutlet UILabel *cellLabel;
@property (retain, nonatomic) IBOutlet UIImageView *cellLogo;
@property (retain, nonatomic) IBOutlet UILabel *deleteLabel;

@end
