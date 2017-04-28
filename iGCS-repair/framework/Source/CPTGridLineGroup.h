#import "CPTLayer.h"

@class CPTPlotArea;

@interface CPTGridLineGroup : CPTLayer {
@private
    CPTPlotArea *plotArea;
	BOOL major;
}

@property (nonatomic, readwrite, assign) CPTPlotArea *plotArea;
@property (nonatomic, readwrite) BOOL major;

@end
