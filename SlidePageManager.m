//
//  SlidePageManager.m
//  SlidePageTool
//
//  Created by liyanting的Mac on 16/6/16.
//  Copyright © 2016年 liyanting. All rights reserved.
//

#import "SlidePageManager.h"
@interface SlidePageManager (){

    UIColor * _bgColor;
    UIColor * _squareViewColor;
    CGFloat _squareLineWidth;
    CGFloat _squareLineHight;
    UIColor * _unSelectTitleColor;
    UIColor * _selectTitleColor;
    UIFont * _titleFont;

}
@property (nonatomic,strong) NSArray <NSString*>       * dataArr;
@property (nonatomic,assign) SlidePageType               slidePageType;
@property (nonatomic,strong) SlidePageSquareView       * slidePageSquareView;
@property (nonatomic,strong) SlidePageLineView         * slidePageLineView;

@end

@implementation SlidePageManager

/**
 根据数据创建选择器
 
 @param dataArr            数据源  <NSString*>
 @param type               选择器类型
 @param bgColor            背景颜色 <UIColor*>
 @param squareViewColor    滑块的颜色 <UIColor*>
 @param squareLineWidth        line的宽度（如果不传默认平分，如果>屏幕）（只是SlidePageType：lineView的时候有效）
 @param squareLineHight        line的高度（如果不传默认为1）（只是SlidePageType：lineView的时候有效）
 @param unSelectTitleColor 未选中文字的颜色 <UIColor*>
 @param selectTitleColor   选中文字的颜色 <UIColor*>
 @param titleFont          文字的字体 <UIFont*>
 
 @return 选择器视图 UIScrollView
 */
- (UIScrollView *)createBydataArr:(NSArray<NSString *> *)dataArr slidePageType:(SlidePageType)type bgColor:(UIColor *)bgColor squareViewColor:(UIColor *)squareViewColor squareLineWidth:(CGFloat)squareLineWidth squareLineHight:(CGFloat)squareLineHight unSelectTitleColor:(UIColor*)unSelectTitleColor selectTitleColor:(UIColor *)selectTitleColor witTitleFont:(UIFont *)titleFont{

    _bgColor = bgColor;
    _squareViewColor = squareViewColor;
    _squareLineWidth = squareLineWidth;
    _squareLineHight = squareLineHight;
    _unSelectTitleColor = unSelectTitleColor;
    _selectTitleColor = selectTitleColor;
    _titleFont = titleFont;
    
    self.dataArr       = dataArr;
    self.slidePageType = type;
    return  [self setUpView];
    

}

- (UIScrollView*)setUpView{
    switch (self.slidePageType) {
        case SlidePageTypeSquare:{
          self.slidePageSquareView  = [[SlidePageSquareView alloc]initWithDataArr:self.dataArr bgColor:_bgColor squareViewColor:_squareViewColor unSelectTitleColor:_unSelectTitleColor selectTitleColor:_selectTitleColor withTitleFont:_titleFont];
        
          self.slidePageSquareView.scrollsToTop = NO;

          return self.slidePageSquareView;
        }
            break;
        case SlidePageTypeLine:{

            self.slidePageLineView = [[SlidePageLineView alloc] initWithDataArr:self.dataArr bgColor:_bgColor squareViewColor:_squareViewColor squareLineWidth:_squareLineWidth squareLineHight:_squareLineHight unSelectTitleColor:_unSelectTitleColor selectTitleColor:_selectTitleColor withTitleFont:_titleFont];

            self.slidePageLineView.scrollsToTop = NO;

            return self.slidePageLineView;
        }
            break;
    }
}

- (void)setContentOffsetX:(CGFloat)contentOffsetX{
    _contentOffsetX = contentOffsetX;

    switch (self.slidePageType) {
        case SlidePageTypeSquare:{
            CGFloat scale = self.slidePageSquareView.contentSize.width/[UIScreen mainScreen].bounds.size.width;
            CGFloat moveDistance = contentOffsetX * (scale/self.dataArr.count);
            self.slidePageSquareView.squareViewOriginX = moveDistance;
        }
            break;
        case SlidePageTypeLine:{
            CGFloat scale = self.slidePageLineView.contentSize.width/[UIScreen mainScreen].bounds.size.width;
            CGFloat moveDistance = contentOffsetX * (scale/self.dataArr.count);
            self.slidePageLineView.squareViewOriginX = moveDistance;
        }
            break;
    }

}
- (void)setEndcontentOffsetX:(CGFloat)endcontentOffsetX{
    _endcontentOffsetX = endcontentOffsetX;
    switch (self.slidePageType) {
        case SlidePageTypeSquare:{
            self.slidePageSquareView.endcontentOffsetX = endcontentOffsetX;
        }
            break;
        case SlidePageTypeLine:{
            self.slidePageLineView.endcontentOffsetX = endcontentOffsetX;
        }
            break;
    }

}

@end
