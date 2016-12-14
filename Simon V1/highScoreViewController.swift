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
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
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
        scoreArray[0].name = "TEST"
        scoreArray[1].name = "TEST"
        scoreArray[2].name = "TEST"
        scoreArray[3].name = "TEST"
        scoreArray[4].name = "TEST"
        scoreArray[5].name = "TEST"
        scoreArray[6].name = "TEST"
        scoreArray[7].name = "TEST"
        scoreArray[8].name = "TEST"
        scoreArray[9].name = "TEST"

        
        
        
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
        
        var y = 0
        while y < scores.count
        {
            if(score == scores[y])
            {
                // Make an alert here for the name????
                
            }
            y += 1
        }
        //check if score is on list 
        //prompt new name for the score
        //connect the new name to the corresponding label
        
        
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
                break
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
    
    @IBAction func onScoreTapped(_ sender: UITapGestureRecognizer)
    {
        for label in scoreArray
        {
            if label.frame.contains(sender.location(in: stackView))
            {
                if label.text == label.name
                {
                    label.text = "\(label.value)"
                }
                else
                {
                    label.text = label.name
                }
            }
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
