//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Timothy Ng on 9/10/17.
//  Copyright © 2017 Timothy Ng. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    

    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, highPitch, lowPitch, echo, reverb
    }

    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .highPitch:
            playSound(pitch: 1000)
        case .lowPitch:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        slowButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit;
        fastButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit;
        highPitchButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit;
        lowPitchButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit;
        echoButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit;
        reverbButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit;
        setupAudio()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }

}
