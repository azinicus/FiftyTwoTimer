//
//  ViewController.swift
//  FiftyTwo
//
//  Created by Azin Mehrnoosh on 5/8/15.
//
//  Copyright (c) 2015 Azin Mehrnoosh
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var count = 3120 //number of seconds in 52 minutes
    
    //The following code allows for HH:MM:SS type of output
    func secondsToHoursMinutesSeconds (var seconds : Int) -> (h:Int, m:Int, s:Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func updateTime() {
        var (h,m,s) = secondsToHoursMinutesSeconds(count)
        
        count--
        
        time.text = "\(m):\(s)" //This displays the function that ultimately splits the seconds into H,M,S
        
    }
    
    @IBOutlet var time: UILabel!
    
    
    //This stops the timer
    @IBAction func stop(sender: AnyObject) {
        
        timer.invalidate()
        
        count = 3120
        
        time.text = "52:00"
        
    }
    
    @IBAction func start(sender: AnyObject) {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
        
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

