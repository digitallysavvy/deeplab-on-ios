//
//  ViewController.swift
//  DeeplabOnIOS
//
//  Created by Dwayne Forde on 2017-12-23.
//

import UIKit
import SafariServices
import AgoraRtcEngineKit

class ViewController: UIViewController, NostalgiaCameraDelegate {
    
    @IBOutlet var imgView: UIImageView!
    var camera: NostalgiaCamera!
    let arVideoSource: ARVideoSource = ARVideoSource()  // for passing the AR camera as the stream
    
    var agoraKit: AgoraRtcEngineKit!                    // Agora.io Video Engine reference
    let channelProfile: AgoraChannelProfile = .liveBroadcasting
    let frameRate: AgoraVideoFrameRate = .fps30
    let videoDimension: CGSize = AgoraVideoDimension960x720
    let videoBitRate: Int = AgoraVideoBitrateStandard
    let videoOutputOrientationMode: AgoraVideoOutputOrientationMode = .fixedPortrait
    let audioSampleRate: UInt = 44100
    let audioChannelsPerFrame: UInt = 1
    let defaultToSpeakerPhone: Bool = true
    let channelName: String = "demo"
    
    // Initialize Camera when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        camera = NostalgiaCamera(controller: self, andImageView: imgView, andSource: arVideoSource)
        
        // Agora setup
        let agoraAppID = ""
        let agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: agoraAppID, delegate: self) // - init engine
        agoraKit.setChannelProfile(channelProfile) // - set channel profile
        if channelProfile == .liveBroadcasting {
            agoraKit.setClientRole(.broadcaster)
        }
        let videoConfig = AgoraVideoEncoderConfiguration(size: videoDimension, frameRate: frameRate, bitrate: videoBitRate, orientationMode: videoOutputOrientationMode)
        agoraKit.setVideoEncoderConfiguration(videoConfig) // - set video encoding configuration (dimensions, frame-rate, bitrate, orientation
        agoraKit.enableVideo() // - enable video

        agoraKit.enableExternalAudioSource(withSampleRate: audioSampleRate, channelsPerFrame: audioChannelsPerFrame) // - enable external audio souce (since video and audio are coming from seperate sources)
        agoraKit.enableWebSdkInteroperability(true)
        self.agoraKit = agoraKit // set a reference to the Agora engine
    }
    
    // Start it when it appears
    override func viewDidAppear(_ animated: Bool) {
        camera.start()
    }
    
    // Stop it when it disappears
    override func viewWillDisappear(_ animated: Bool) {
        camera.stop()
    }
    
    // Browse to a URL when a match is found
    func matchedItem() {
        let safariController = SFSafariViewController(url: URL(string: "https://www.visitdublin.com/")!)
        present(safariController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: AgoraRtcEngineDelegate {
    
}
