//
//  ZSLineChart.h
//  FSLineChart
//
//  Created by x on 2018/4/9.
//  Copyright © 2018年 Arthur GUIBERT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSLineChart : UIView

@property (nonatomic) CGFloat xAxisLength;
@property (nonatomic) CGFloat yAxisLength;
@property (nonatomic) CGFloat margin;


- (void)setChartData:(NSArray *)array;

- (void)setYAxisData:(NSArray *)array;

@end
