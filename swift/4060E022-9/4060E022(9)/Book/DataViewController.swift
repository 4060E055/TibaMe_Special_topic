//
//  DataViewController.swift
//  4060E028-Book
//
//  Created by guest1 on 2018/11/21.
//  Copyright © 2018年 dreamplatz. All rights reserved.
//

//
//  DataViewController.swift
//  4060E055-book5
//
//  Created by guest1 on 2018/11/21.
//  Copyright © 2018年 dreamplatz. All rights reserved.
//

import UIKit
import AVFoundation

class DataViewController: UIViewController ,AVSpeechSynthesizerDelegate{
    
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var authorLable: UILabel!
    
    @IBOutlet weak var contentLable: UILabel!
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var switchOfVoice: UISwitch!
    
    var speechSynthesizer = AVSpeechSynthesizer()
    var dataObject: String = ""
    var index = Int()
    var isInitial: Bool? = true
    var isFinished: Bool? = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        speechSynthesizer.delegate = self
        switchOfVoice.isOn = false
        
        let obj: AnyObject = dataObject as AnyObject
        let content:String = obj.description
        var result:Array<String> = content.components(separatedBy: "|")
        self.titleLable.text = result[0]
        self.authorLable.text = result[1]
        self.contentImageView.image = UIImage(named: result[2])
        self.contentLable!.text = result[3]
        
    }
    
    @IBAction func switchStateDidChange(_ sender: UISwitch) {
        if (sender.isOn == true){
            if isInitial! || !isFinished! {
                textToSpeech(self.titleLable.text!, preUtteranceDelay: nan(nil), postUtteranceDelay: 1)
                textToSpeech(self.contentLable.text!, preUtteranceDelay: nan(nil), postUtteranceDelay: 0.1)
            }
            speechSynthesizer.continueSpeaking()
        }else{
            isInitial = false
            speechSynthesizer.pauseSpeaking(at: AVSpeechBoundary.word)
        }
    }
    
    func textToSpeech(_ inputSpeechText: String, preUtteranceDelay: Double, postUtteranceDelay: Double) {
        
        let myUtterance = AVSpeechUtterance(string: inputSpeechText)
        myUtterance.rate = 0.3
        myUtterance.pitchMultiplier = 1.2
        if !preUtteranceDelay.isNaN {
            myUtterance.preUtteranceDelay = preUtteranceDelay
        }
        if !postUtteranceDelay.isNaN {
            myUtterance.postUtteranceDelay = postUtteranceDelay
        }
        myUtterance.volume = 1
        myUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        speechSynthesizer.speak(myUtterance)
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance){
        if !isInitial! {
            self.switchOfVoice.isOn = false
        }
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        if authorLable.text == "徐志摩1" {
            contentLable.font = contentLable.font.withSize(20)
            contentLable.textAlignment = .center
        }
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        speechSynthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }
    
    
}

