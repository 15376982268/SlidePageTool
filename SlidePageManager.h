//
//  SlidePageManager.h
//  SlidePageTool
//
//  Created by liyanting的Mac on 16/6/16.
//  Copyright © 2016年 liyanting. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "SlidePageSquareView.h"
#import "SlidePageLineView.h"

typedef NS_ENUM(NSInteger,SlidePageType){
    SlidePageTypeSquare,
    SlidePageTypeLine
};

@interface SlidePageManager : NSObject


/**
 根据数据创建选择器
 
 @param dataArr            数据源  <NSString*>
 @param type               选择器类型
 @param bgColor            背景颜色 <UIColor*>
 @param squareViewColor    滑块的颜色 <UIColor*>
 @param squareLineWidth        line的宽度（如果不传默认平分，如果>屏幕）（）
 @param squareLineHight        line的高度（如果不传默认为1）
 @param unSelectTitleColor 未选中文字的颜色 <UIColor*>
 @param selectTitleColor   选中文字的颜色 <UIColor*>
 @param titleFont          文字的字体 <UIFont*>
 
 @return 选择器视图 UIScrollView
 */
- (UIScrollView *)createBydataArr:(NSArray<NSString *> *)dataArr slidePageType:(SlidePageType)type bgColor:(UIColor *)bgColor squareViewColor:(UIColor *)squareViewColor squareLineWidth:(CGFloat)squareLineWidth squareLineHight:(CGFloat)squareLineHight unSelectTitleColor:(UIColor*)unSelectTitleColor selectTitleColor:(UIColor *)selectTitleColor witTitleFont:(UIFont *)titleFont;


/**
 *  页面滚动时传入偏移量
 */
@property (nonatomic,assign) CGFloat  contentOffsetX;

/**
 *  页面结束滚动时传入偏移量
 */
@property (nonatomic,assign) CGFloat  endcontentOffsetX;
@end
