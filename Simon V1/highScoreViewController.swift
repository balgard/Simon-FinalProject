//
//  highScoreViewController.swift
//  Simon V1
//
//  Created by Balgard on 12/6/16.
//  Copyright © 2016 Balgard. All rights reserved.
//

import UIKit

class highScoreViewController: UIViewController {

    @IBOutlet weak var score1: scoreLabel!
    @IBOutlet weak var score2: scoreLabel!
    @IBOutlet weak var score3: scoreLabel!
    @IBOutlet weak var score4: scoreLabel!
    @IBOutlet weak var score5: scoreLabel!
    @IBOutlet weak var score6: scoreLabel!
    @IBOutlet weak var score7: scoreLabel!
    @IBOutlet weak var score8: scoreLabel!
    @IBOutlet weak var score9: scoreLabel!
    @IBOutlet weak var score10: scoreLabel!
    
    var currentScore = 0
    
    var scoreArray = [scoreLabel]()
    var nameArray = [String]()
    var namesScores = [Int : String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        scoreArray.append(score1)
        scoreArray.append(score2)
        scoreArray.append(score3)
        scoreArray.append(score4)
        scoreArray.append(score5)
        scoreArray.append(score6)
        scoreArray.append(score7)
        scoreArray.append(score8)
        scoreArray.append(score9)
        scoreArray.append(score10)
        
        //not sure why this doesn't work
        //let score1Area = NSTrackingArea(rect: score1.bounds, options: NSTrackingAreaOptions.ActiveAlways | NSTrackingAreaOptions.MouseEnteredAndExited, owner: self, userInfo: nil)
        
        
        setNewValues(label: scoreArray[2], value: 0)
        setNewValues(label: scoreArray[3], value: 0)
        setNewValues(label: scoreArray[1], value: 0)
        setNewValues(label: scoreArray[0], value: 0)
        setNewValues(label: scoreArray[4], value: 0)
        setNewValues(label: scoreArray[5], value: 0)
        setNewValues(label: scoreArray[6], value: 0)
        setNewValues(label: scoreArray[7], value: 3)
        setNewValues(label: scoreArray[8], value: 0)
        setNewValues(label: scoreArray[9], value: 0)
        
        
        
        
        numberArray()
        
        
        sortValues()
        checkNewScore(score: currentScore)
    }
    
    func numberArray()
    {
        var i = 0
        for label in scoreArray
        {
            label.number = i
            i += 1
        }
    }
    
    func checkNewScore(score: Int)
    {
        var scores = [Int]()
        var x = 0
        while x < scoreArray.count
        {
            scores.append(scoreArray[x].value)
            x += 1
        }
        scores.append(score)
        scores = scores.sorted(by: >)
        scores.removeLast()
        var i = 0
        while i < scoreArray.count
        {
            setNewValues(label: scoreArray[i], value: scores[i])
            i += 1
        }
        for label in scoreArray
        {
            if label.value == score
            {
                label.backgroundColor = UIColor.yellow
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
                    label.backgroundColor = UIColor.clear
                })
            }
        }
    }
    
    func sortValues()
    {
        var i = 0
        var scores = [Int]()
        while i < scoreArray.count
        {
            scores.append(scoreArray[i].value)
            i += 1
        }
        scores = scores.sorted(by: >)
        var x = 0
        while x < scoreArray.count
        {
            setNewValues(label: scoreArray[x], value : scores[x])
            x += 1
        }
    }
    
        
    func setNewValues(label : scoreLabel, value : Int)
    {
        label.value = value
        label.text = "\(label.value)"
    }
    
    @IBAction func onTapped(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    }
}
