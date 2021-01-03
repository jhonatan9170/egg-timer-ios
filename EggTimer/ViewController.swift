//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    let eggTime = ["Soft":5,"Medium":7,"Hard":12]
    var timer = Timer()
    var totalTime=0
    var secondPassed=0
    var player:AVAudioPlayer!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
       progressBar.progress=0.0
       timer.invalidate()
       let hardness = sender.titleLabel!.text!
         timeLabel.text=hardness
       totalTime=eggTime[hardness]!
       secondPassed=0
   
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){
            timer in self.updateTimer()
        }
    }
    
    func updateTimer(){
        if secondPassed<totalTime{
            secondPassed+=1
            progressBar.progress=Float(secondPassed)/Float(totalTime)
            print(progressBar.progress)
            }
        else{
            print("DONE")
            timer.invalidate()
            playSound()
            
           }
    }
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()

        
    }

    }
