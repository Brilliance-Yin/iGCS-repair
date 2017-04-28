//
//  BluetoothStream.m
//  iGCS
//
//  Created by Andrew Aarestad on 2/22/13.
//
//

#import "BluetoothStream.h"

@implementation BluetoothStream

+(BluetoothStream*) createForTx {
    DDLogInfo(@"Creating BluetoothStream for Peripheral mode (Tx).");
    
    BluetoothStream *bts = [[BluetoothStream alloc] init];
    
    // BTLE usage
    //bts.streamPeripheral = [[BTLEMavLinkPeripheral alloc] init];
    
    // GKSession usage
    GKLocalController *gkSessionController = [[GKLocalController alloc] init:bts];
    bts.gkLocalController = gkSessionController;  
    
    return bts;
}


+(BluetoothStream*) createForRx {
    DDLogInfo(@"Creating BluetoothStream for Central mode (Rx).");
    
    BluetoothStream *bts = [[BluetoothStream alloc] init];
    
    // BTLE usage
    //bts.streamCentral = [[BTLEMavLinkCentral alloc] init];
    
    
    // GKSession usage
    GKLocalController *gkController = [[GKLocalController alloc] init:bts];
    bts.gkLocalController = gkController;
    
    
    return bts;
}

#pragma mark -
#pragma mark MavLinkInterface methods


// MavLinkInterface destination override (used for Tx)
-(void)consumeData:(const uint8_t*)bytes length:(NSUInteger)length {
    if (self.gkLocalController) {
        [self.gkLocalController sendMavlinkData:bytes length:length];
    }
}

-(void) close {
    if (self.streamCentral) {
        [self.streamCentral stopScan];
    }
    
    if (self.streamPeripheral) {
        [self.streamPeripheral stopStream];
    }
}

@end
