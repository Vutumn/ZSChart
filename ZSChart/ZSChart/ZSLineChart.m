

//
//  ZSLineChart.m
//  FSLineChart
//
//  Created by x on 2018/4/9.
//  Copyright © 2018年 Arthur GUIBERT. All rights reserved.
//

#import "ZSLineChart.h"

@interface ZSLineChart()
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ZSLineChart

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDefaultParameter];
        [self createXData];
        [self createYData];
    }
    return self;
}

- (void)initDefaultParameter
{
    _margin = 20;
    _xAxisLength = self.frame.size.width - 2 * _margin;
    _yAxisLength = self.frame.size.height - 2 * _margin;
}

#pragma mark -xyDataInit
- (void)createXData
{
    
   // UILabel *label
}

- (void)createYData
{
    
}

- (void)setChartData:(NSArray *)array
{
    if (array == nil || array.count == 0) {
        return;
    }
    for (NSInteger i = 0; i < array.count; i++) {
        CGFloat oneblankWidth = _xAxisLength / array.count;
        //label在x轴上的表现形式
        //todo:当数组长度过长时，应采用一种新的表现形式来让用户感知
        UILabel *xlabel = [UILabel new];
        xlabel.font = [UIFont systemFontOfSize:10];
        xlabel.text = [NSString stringWithFormat:@"%@", array[i]];
        CGSize size = CGSizeMake(100, MAXFLOAT);//设置高度宽度的最大限度
        CGRect rect = [xlabel.text boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10]} context:nil];
        
        xlabel.frame = CGRectMake(oneblankWidth / 2 + oneblankWidth * i + _margin, self.frame.size.height - _margin + 5, rect.size.width, rect.size.height);
        [self addSubview:xlabel];
    }
}

- (void)setYAxisData:(NSArray *)array
{
    if (array == nil || array.count == 0) {
        return;
    }
    
    //todo:当xdata与ydata不匹配
    for (NSInteger i = 0; i < array.count; i++) {
        CGFloat oneblankWidth = _yAxisLength / array.count;
        
        UILabel *ylabel = [UILabel new];
        ylabel.font = [UIFont systemFontOfSize:10];
        ylabel.text = [NSString stringWithFormat:@"%@", array[i]];
        CGSize size = CGSizeMake(100, MAXFLOAT);
        CGRect rect = [ylabel.text boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10]} context:nil];
        
        ylabel.frame = CGRectMake(oneblankWidth / 2 + oneblankWidth * i + _margin, self.frame.size.height - _margin + 5, rect.size.width, rect.size.height);
        [self addSubview:ylabel];
    }
}

#pragma mark -system
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0f);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextMoveToPoint(context, _margin, self.frame.size.height - _margin - _yAxisLength);
    CGContextAddLineToPoint(context, _margin, self.frame.size.height - _margin);
    CGContextAddLineToPoint(context, _margin + _xAxisLength, self.frame.size.height - _margin);
    CGContextStrokePath(context);
}

@end
