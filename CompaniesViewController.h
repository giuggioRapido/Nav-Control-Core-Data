//
//  CompaniesViewController.h
//  NavCtrl
//
//  Created by Chris on 7/15/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "CVCell.h"
#import "ProductsViewController.h"



@class ChildViewController;

@interface CompaniesViewController: UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) DAO *dao;
@property (nonatomic, strong) ProductsViewController * productsVC;
-(void) downloadComplete;


@end
