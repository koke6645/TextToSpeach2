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
        utterance.rate = currentSpeed
        self.synthersizer.delegate = self
        synthersizer.speakUtterance(utterance)
        
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

