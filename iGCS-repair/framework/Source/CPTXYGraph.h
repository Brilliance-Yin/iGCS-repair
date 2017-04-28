#import <Foundation/Foundation.h>
#import "CPTGraph.h"
#import "CPTDefinitions.h"

@interface CPTXYGraph : CPTGraph {
@private
    CPTScaleType xScaleType;
    CPTScaleType yScaleType;
}
@property (nonatomic, retain) UIView *hostingView;

/// @name Initialization
/// @{
-(id)initWithFrame:(CGRect)newFrame xScaleType:(CPTScaleType)newXScaleType yScaleType:(CPTScaleType)newYScaleType;
///	@}

@end
