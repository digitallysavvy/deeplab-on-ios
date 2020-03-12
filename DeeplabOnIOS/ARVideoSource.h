//
//  ARVideoSource.h
//  DeeplabOnIOS
//
//  Created by Eddie Long on 12/03/2020.
//

#import <Foundation/Foundation.h>
#import <CoreMedia/CoreMedia.h>

NS_ASSUME_NONNULL_BEGIN

@interface ARVideoSource : NSObject

- (void) sendBuffer:(CVPixelBufferRef) pixelBuffer timestamp: (CMTime)timestamp;
@end

NS_ASSUME_NONNULL_END
