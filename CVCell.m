//
//  CVCell.m
//  NavCtrl
//
//  Created by Chris on 7/16/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import "CVCell.h"

@implementation CVCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CVCell" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
        self.cellLogo.contentMode = UIViewContentModeScaleAspectFit;
    }
   
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)dealloc {
    [_cellLabel release];
    [_cellLogo release];
    [_deleteLabel release];
    [super dealloc];
}

@end
