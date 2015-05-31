//
//  ViewController.swift
//  FiftyTwo
//
//  Created by Azin Mehrnoosh on 5/8/15.
//
//  Copyright (c) 2015 Azin Mehrnoosh
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var colorChanger = ColorWheel()
    
    //Defining the little clickity click sounds
    var buttonClick = AVAudioPlayer()
    var buttonTick = AVAudioPlayer()
    var buttonClicko = AVAudioPlayer()
    var timerbell = AVAudioPlayer()
    
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer  {
        //1
        var path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        var url = NSURL.fileURLWithPath(path!)
        
        //2
        var error: NSError?
        
        //3
        var audioPlayer:AVAudioPlayer?
        audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
        
        //4
        return audioPlayer!
    }
    
    @IBOutlet weak var backgroundObject: UIView!
    @IBOutlet weak var stopButton: UIBarButtonItem!
    @IBOutlet weak var playButton: UIBarButtonItem!
    @IBOutlet weak var colorButton: UIButton!
    
    //Interface color changer
    @IBAction func colorButton2(sender: UIButton) {
        
        var tempColor = colorChanger.randomColor()
        self.backgroundObject.backgroundColor = tempColor
        playButton.tintColor = tempColor
        stopButton.tintColor = tempColor
        colorButton.tintColor = tempColor
        buttonTick.play()
    }

    //Timer Stuff
    var timer = NSTimer()
    var count_52 = 60*52 //number of seconds in 52 minutes
    var count_17 = 60*17 //number of seconds in 17 minutes
    var count = 60*52
    var work_or_play = "work"
    
    //The following code allows for HH:MM:SS type of output
    func secondsToHoursMinutesSeconds (var seconds : Int) -> (h:Int, m:Int, s:Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func updateTime() {
        var (h,m,s) = secondsToHoursMinutesSeconds(count)
        
        // These help show the 2 character integers instead of 1 character
        var str_min = String(format: "%01d", m)
        var str_sec = String(format: "%02d", s)
        
        count--
        
        time.text = "\(str_min):\(str_sec)" //This displays the function that ultimately splits the seconds into H,M,S
        
        if count <= 0 {
            timerbell.play()
            switchTime()
        }
    }
    
    @IBOutlet var time: UILabel!
    
    //Function to switch between 52 minutes and 17 minutes
    func switchTime() {
        timer.invalidate()
        if work_or_play == "work" {
            count = count_17
            work_or_play = "play"
            time.text = "17:00"
        }
        else {
            count = count_52
            work_or_play = "work"
            time.text = "52:00"
        }
    }
    
    
    //This stops the timer
    @IBAction func stop(sender: AnyObject) {
        switchTime()
        
        buttonClicko.play()
        
    }
    
    @IBAction func start(sender: AnyObject) {
        if work_or_play == "work" {
            timer.invalidate()
            count = count_52
        }
        else {
            timer.invalidate()
            count = count_17
        }

        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)

        buttonClick.play()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonClick = self.setupAudioPlayerWithFile("click", type:"m4a")
        buttonTick = self.setupAudioPlayerWithFile("tick", type: "m4a")
        buttonClicko = self.setupAudioPlayerWithFile("clicko", type: "m4a")
        timerbell = self.setupAudioPlayerWithFile("smallbell2", type: "wav")

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}