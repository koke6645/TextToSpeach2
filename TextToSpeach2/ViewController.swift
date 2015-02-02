//
//  ViewController.swift
//  TextToSpeach2
//
//  Created by Red_iMac on 1/29/15.
//  Copyright (c) 2015 Red_iMac. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVSpeechSynthesizerDelegate {

    @IBOutlet weak var textBox: UITextView!
    
    @IBOutlet weak var slider: UISlider!
    
    var currentSpeed: Float = 0.3
    
    var synthersizer = AVSpeechSynthesizer()
    
    @IBAction func sliderSpeedChanged(sender: UISlider) {
        currentSpeed = sender.value
    }
    
    @IBAction func speach(sender: AnyObject) {
        var utterance = AVSpeechUtterance(string: textBox.text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        //utterance.voice = AVSpeechSynthesisVoice(language: "en-AU")
        //utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        //utterance.voice = AVSpeechSynthesisVoice(language: "en-IE")
        
        utterance.rate = currentSpeed
        self.synthersizer.delegate = self
        
        if !synthersizer.speaking {
            synthersizer.speakUtterance(utterance)
        }
        
    }
    
    @IBAction func stopSpeak(sender: UIButton) {
        if synthersizer.speaking {
            synthersizer.stopSpeakingAtBoundary(.Immediate)
        }
        
    }
    
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer!, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance!) {
        let mutableAttributedString = NSMutableAttributedString(string: utterance.speechString)
        mutableAttributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: characterRange)
        textBox.attributedText = mutableAttributedString
    }
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer!, didFinishSpeechUtterance utterance: AVSpeechUtterance!) {
        textBox.attributedText = NSAttributedString(string: utterance.speechString)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textBox.attributedText = NSMutableAttributedString(string: "Step inside magnificent lobbies, corridors, and the underground Pedway system for an in-depth, personal approach to a Chicago architecture walking tour downtown. Available six days a week, the Loop Interior Architecture Walking Tour takes you on a creative route that weaves through buildings and secret short-cuts. 95% of the tour takes places in heated interiors.")
        //textBox.attributedText = NSMutableAttributedString(string: "Step inside magnificent lobbies, corridors, and the underground Pedway system for an in-depth, personal approach to a Chicago architecture walking tour downtown. Available six days a week, the Loop Interior Architecture Walking Tour takes you on a creative route that weaves through buildings and secret short-cuts. Ninety-five percent of the tour takes places in heated interiors.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

