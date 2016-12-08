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
        var i = 0
        super.viewDidLoad()
        for label in scoreArray
        {
            label.number = i
            i += 1
        }
    }
    
    func setNewValues(label : scoreLabel, value : Int)
    {
        label.value = value
    }
    
    @IBAction func onTapped(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    }
}
