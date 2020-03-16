//
//  CVVideoCamera.h
//  DeeplabOnIOS
//
//  Created by Eddie Long on 12/03/2020.
//

#import <opencv2/opencv.hpp>
#import <opencv2/videoio/cap_ios.h>
#import <opencv2/imgcodecs/ios.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoCamera : CvVideoCamera

@property (nonatomic, weak) id<AVCaptureVideoDataOutputSampleBufferDelegate> outputDelegate;

@end

NS_ASSUME_NONNULL_END
