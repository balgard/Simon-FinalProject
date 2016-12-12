//
//  highScoreViewController.swift
//  Simon V1
//
//  Created by Balgard on 12/6/16.
//  Copyright © 2016 Balgard. All rights reserved.
//

import UIKit

class highScoreViewController: UIViewController {
    
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var name3: UILabel!
    @IBOutlet weak var name4: UILabel!
    @IBOutlet weak var name5: UILabel!
    @IBOutlet weak var name6: UILabel!
    @IBOutlet weak var name7: UILabel!
    @IBOutlet weak var name8: UILabel!
    @IBOutlet weak var name9: UILabel!
    @IBOutlet weak var name10: UILabel!
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
        nameArray.append(name1.text!)
        nameArray.append(name2.text!)
        nameArray.append(name3.text!)
        nameArray.append(name4.text!)
        nameArray.append(name5.text!)
        nameArray.append(name6.text!)
        nameArray.append(name7.text!)
        nameArray.append(name8.text!)
        nameArray.append(name9.text!)
        nameArray.append(name10.text!)
        namesScores[score1.value] = name1.text!
        namesScores[score2.value] = name2.text!
        namesScores[score3.value] = name3.text!
        namesScores[score4.value] = name4.text!
        namesScores[score5.value] = name5.text!
        namesScores[score6.value] = name6.text!
        namesScores[score7.value] = name7.text!
        namesScores[score8.value] = name8.text!
        namesScores[score9.value] = name9.text!
        namesScores[score10.value] = name10.text!
        
        numberArray()
        setNewValues(label: scoreArray[2], value: 40)
        name3.text = "X"
        sortValues()
        sortNames()
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
    
    func sortNames()
    {
        var oldScores = [Int]()
        for (key, value) in namesScores
        {
            oldScores.append(key)
        }
        for compare in oldScores
        {
            if(oldScores[compare] != scoreArray[compare].value)
            {
                namesScores[compare] = nameArray[compare]
                
            }
        }
        //does nothing, but doesn't break anything
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
