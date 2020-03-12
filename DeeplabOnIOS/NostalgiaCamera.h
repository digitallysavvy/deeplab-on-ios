//
//  NostalgiaCamera.h
//  DeeplabOnIOS
//
//  Created by Dwayne Forde on 2017-12-23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DeeplabOnIOS-Swift.h"

@class ARVideoSource;

// Protocol for callback action
@protocol NostalgiaCameraDelegate <NSObject>

- (void)matchedItem;

@end

// Public interface for camera. ViewController only needs to init, start and stop.
@interface NostalgiaCamera : NSObject

-(id) initWithController: (UIViewController<NostalgiaCameraDelegate>*)c andImageView: (UIImageView*)iv;
-(void)start;
-(void)stop;
-(void)setVideoSource;
-(ARVideoSource *)returnSwiftClassInstance;
- (void)captureOutput:(AVCaptureOutput *)output didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection;

@end
