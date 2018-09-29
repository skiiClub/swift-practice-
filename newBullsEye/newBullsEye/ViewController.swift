//
//  ViewController.swift
//  newBullsEye
//
//  Created by Chomiak, John Robert on 9/29/18.
//  Copyright © 2018 Chomiak, John Robert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //default variables. Only assigning them here to give them Global scope
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    
    @IBOutlet weak var roundLabel: UILabel!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetLabel: UILabel!
    
    //Runs at the beginning of program. CurrentValue uses the IBOutlet to get slider data. This is specified by dragging it on the storyboard
    
    //Target value is just random number.
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = Int(slider.value.rounded())
        targetValue = Int(arc4random_uniform(101))+1
        startNewRound()
        print(score)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetButton() {
        resetGame()
    }
    
    func resetGame(){
        currentValue = 0
        targetValue = 0
        score = 0
        round = 1
    
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    
    @IBAction func showAlert() {
        var difference: Int
        let title: String
        difference = abs(targetValue - currentValue)
       
        
        var points = 100 - difference
        if difference == 0{
            points += 100
        } else if difference == 1{
            points += 50
        }
        
        
        if difference == 0{
            title = "Perfect!"
        } else if difference >= 5{
            title = "Close!"
        }
        else if difference <= 10{
            title = "Close enough!"
        }
        
        else{
            title = "Not even close!"
        }
        
        score += points
        
        let message = "You scored \(points) points"
    
        
        
        
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
    

    }
    
    
    
    
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = Int(slider.value.rounded())
    }
    
    func startNewRound(){
        targetValue = Int(arc4random_uniform(101))
        if targetValue < 1{
            targetValue += 1
        }
        currentValue = 50
        slider.value = Float(currentValue)
        
        //updating round label
        round+=1
        UpdateLabels()
    }
    
    //Updates target label
    func UpdateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

}

