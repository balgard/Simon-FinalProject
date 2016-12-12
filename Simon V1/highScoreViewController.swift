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
        numberArray()
        for label in scoreArray
        {
            setNewValues(label: label, value: 0)
        }
        setNewValues(label: scoreArray[2], value: 40)
        sortValues()
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
        while i < scoreArray.count - 1
        {
            scores.append(scoreArray[i].value)
            
            /*if scoreArray[i].value < scoreArray[i+1].value
            {
                var temp = scoreArray[i].value
                setNewValues(label: scoreArray[i], value: scoreArray[i+1].value)
                setNewValues(label: scoreArray[i+1], value: temp)
            }*/
            i += 1
            // doesn't sort through the values.  Doesn't do anything right now.
            // How do i sort through an array so that the greatest value is at the front of the array
        }
        scores = scores.sorted(by: >)
        var x = 0
        while x < scoreArray.count - 1
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
