//
//  ARVideoSource.m
//  DeeplabOnIOS
//
//  Created by Eddie Long on 12/03/2020.
//

#import "ARVideoSource.h"
#import <AgoraRtcEngineKit/AgoraRtcEngineKit.h>

@interface ARVideoSource() <AgoraVideoSourceProtocol>

@end

@implementation ARVideoSource

@synthesize consumer;

- (AgoraVideoBufferType)bufferType {
    return AgoraVideoBufferTypePixelBuffer;
}

- (void)shouldDispose {
    
}

- (BOOL)shouldInitialize {
    return YES;
}

- (void)shouldStart {
    
}

- (void)shouldStop {
    
}

- (void) sendBuffer:(CVPixelBufferRef) pixelBuffer timestamp: (CMTime)timestamp {
    [consumer consumePixelBuffer:pixelBuffer withTimestamp:timestamp rotation:AgoraVideoRotationNone];
}

@end
