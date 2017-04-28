//
//  SetWPRequest.m
//  iGCS
//
//  Created by Claudio Natoli on 13/10/13.
//
//

#import "SetWPRequest.h"

@implementation SetWPRequest

- (instancetype)initWithInterface:(iGCSMavLinkInterface*)interface andSequence:(uint16_t)sequence {
    if ((self = [super init])) {
        _interface = interface;
        _sequence  = sequence;

        _title    = [NSString stringWithFormat:@"Setting Waypoint %d", sequence];
        _subtitle = @"Sending";
        _timeout  = MAVLINK_SET_WP_RETRANSMISSION_TIMEOUT;
    }
    return self;
}

- (void) checkForACK:(mavlink_message_t)packet withHandler:(MavLinkRetryingRequestHandler*)handler {
    if (packet.msgid == MAVLINK_MSG_ID_MISSION_CURRENT) {
        mavlink_mission_current_t current;
        mavlink_msg_mission_current_decode(&packet, &current);
        
        // Is this the ACK we were waiting for?
        if (current.seq == _sequence) {
            [handler completedWithSuccess:YES];
        }
    }
}

- (void) performRequest {
    [_interface issueRawSetWaypointCommand:_sequence];
}

@end
