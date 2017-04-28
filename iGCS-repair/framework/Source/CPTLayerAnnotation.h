#import <Foundation/Foundation.h>
#import "CPTAnnotation.h"
#import "CPTDefinitions.h"

@class CPTConstraints;

@interface CPTLayerAnnotation : CPTAnnotation {
@private
    CPTLayer *anchorLayer;
	CPTConstraints *xConstraints;
    CPTConstraints *yConstraints;
    CPTRectAnchor rectAnchor;
}

@property (nonatomic, readonly, assign) CPTLayer *anchorLayer;
@property (nonatomic, readwrite, assign) CPTRectAnchor rectAnchor;

-(id)initWithAnchorLayer:(CPTLayer *)anchorLayer;

@end
