//
//  CVVideoCamera.m
//  DeeplabOnIOS
//
//  Created by Eddie Long on 12/03/2020.
//

#import "VideoCamera.hpp"

@implementation VideoCamera

- (void) captureOutput:(AVCaptureOutput *)output didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    
    if ([super respondsToSelector:@selector(captureOutput:didOutputSampleBuffer:fromConnection:)]) {
        [super captureOutput:output didOutputSampleBuffer:sampleBuffer fromConnection:connection];
    }
    
    if ([self.outputDelegate respondsToSelector:@selector(captureOutput:didOutputSampleBuffer:fromConnection:)]) {
        [self.outputDelegate captureOutput:output didOutputSampleBuffer:sampleBuffer fromConnection:connection];
    }
}

- (void) captureOutput:(AVCaptureOutput *)output didDropSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    if ([self.outputDelegate respondsToSelector:@selector(captureOutput:didDropSampleBuffer:fromConnection:)]) {
        [super captureOutput:output didDropSampleBuffer:sampleBuffer fromConnection:connection];
    }
    
    if ([self.outputDelegate respondsToSelector:@selector(captureOutput:didDropSampleBuffer:fromConnection:)]) {
        [self.outputDelegate captureOutput:output didDropSampleBuffer:sampleBuffer fromConnection:connection];
    }
}

@end
