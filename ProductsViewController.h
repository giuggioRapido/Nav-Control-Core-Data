//
//  ProductsViewController.h
//  NavCtrl
//
//  Created by Chris on 7/16/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKWebViewController.h"
#import "DAO.h"
#import "CVCell.h"

@interface ProductsViewController : UICollectionViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) WKWebViewController* webViewVC;
@property (nonatomic, retain) DAO *dao;

@end
