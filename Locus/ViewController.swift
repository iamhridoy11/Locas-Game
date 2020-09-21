//
//  ViewController.swift
//  Locus
//
//  Created by Mostafizur Rahman Hridoy on 2019-09-18.
//  Copyright © 2019 Mostafizur Rahman Hridoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0 //instance variable
    var targetValue = 0 //instance variable
    var score = 0 //for storing score, instance variable
    var round = 0 //instance variable

    @IBOutlet weak var roundLable: UILabel! //instance variable
    @IBOutlet weak var scoreLable: UILabel! //instance variable
    @IBOutlet weak var slider: UISlider!    //instance variable
    @IBOutlet weak var targetLable: UILabel! //instance variable
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startRound()
        
        let thumImgaeNormal = #imageLiteral(resourceName: "SliderThumb-Normal-1")
        slider.setThumbImage(thumImgaeNormal, for: .normal)
        
        let thumImgaeHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumImgaeHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft-1")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight-1")
        let trackRightREsizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightREsizable, for: .normal)
        
        
        
        
        
    }

    @IBAction func showAlert(_ sender: Any) {
        /*In the showAlert function there are 3 instance variables. "targetValue", "currentValue", "score". Also there are 6 local variables in the showAlert function. "difference", "points", "title", "message", "alert", "action"*/
        let difference = abs(targetValue - currentValue) // difference is a local variable
        let points = 100 - difference   //finding the points, points is a local variable
        score += points                 //calculating score
    
        
        let title : String              // title is a local variable
        
        if difference == 0
        {
            title = "Gocha, Perfect. Also you've got extra 100 bonus. Chill!!!!"
            score += 100 // add extra 100 when players gets a perfect score.
            
        }else if difference == 1
        {
            title = "Holy, Moly!!!!! you've almost nailed it. Just 1 short of reaching the target. You've got 50 bonus point"
            score += 50 // add extra 50 points when a player is just 1 off
        }
        else if difference < 5
        {
            title = "Oh, you almost had it!"
        }
        else if difference < 10
        {
            title = "Pretty Good"
        }else
        {
            title = "Not even close......"
        }
        
        let message = "You scored \(points) points"     // message is a local variable
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)                                      // alert is a local variable
        let action = UIAlertAction(title: "Ok", style: .default, handler: {
            action in
            self.startRound()
        })                                              // action is a local variable
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
       
        
        
        
        
//        difference = currentValue - targetValue
//        if difference < 0 {
//            difference = difference * (-1)
//        }
//
//        if currentValue > targetValue
//        {
//            difference = currentValue - targetValue
//        }else if targetValue > currentValue
//        {
//            difference = targetValue - currentValue
//        }else{
//            difference = 0
//        }
//        let message = "The value is: \(currentValue)" + "/n the target value is \(targetValue)" + "\n The difference is: \(difference)"
//
//        let alert = UIAlertController(title: "Hello world", message: message, preferredStyle: .alert)
//        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil)
//
//        startRound()
        
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startRound() {
        round += 1// to increment rounds
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLable()
    }
    
    func updateLable() {
        targetLable.text = String(targetValue)
        scoreLable.text = String(score)
        roundLable.text = String(round)
        
    }
    
    
    @IBAction func startNewgame(_ sender: Any) {
        score = 0
        round = 0
        startRound()
    }
}

