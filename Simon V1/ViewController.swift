//
//  ViewController.swift
//  Simon V1
//
//  Created by Balgard on 12/1/16.
//  Copyright © 2016 Balgard. All rights reserved.
//

import UIKit

//Tried to have only one set of labels and create another array of labels that contains the created pattern.  Can't connect the two labels together so that when a label in the pattern array is called, the label of matching color on the storyboard will have its color changed.




class ViewController: UIViewController
{
    @IBOutlet weak var patternButton: UIButton!
    @IBOutlet weak var currentScore: UILabel!
    @IBOutlet weak var greenLabel: gridLabel!
    @IBOutlet weak var redLabel: gridLabel!
    @IBOutlet weak var yellowLabel: gridLabel!
    @IBOutlet weak var blueLabel: gridLabel!
    @IBOutlet weak var backgroundView: UIView!
    var patternCreated = false
    var needsPattern = true
    var gameStarted = false
    var gameEnded = false
    var gridArray = [gridLabel]()
    var pattern = [gridLabel]()
    var tapsPerPattern = 0
    override func viewDidLoad()
    {
        super.viewDidLoad()
        gridArray.append(greenLabel)
        gridArray.append(redLabel)
        gridArray.append(yellowLabel)
        gridArray.append(blueLabel)
        numberGrid()
    }
    
    func createPattern()
    {
        gameStarted = true
        pattern = [gridLabel]()
        var x = gridLabel()
        x.color = Int(arc4random_uniform(4))
        x.number = x.color
        pattern.append(x)
        patternCreated = true
        needsPattern = false
    }
    
    func appendPattern()
    {
        var x = gridLabel()
        x.color = Int(arc4random_uniform(4))
        x.number = x.color
        pattern.append(x)
        needsPattern = false
    }
    
    func numberGrid()
    {
        var i = 0
        for label in gridArray
        {
            label.number = i
            label.color = i
            label.oldColor = label.backgroundColor!
            i += 1
        }
    }
    
    func showPattern()
    {
        for label in pattern
        {
            if(label.color == gridArray[0].color)
            {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(0.5 * Double(pattern.index(of: label)!)), execute:
                    {
                        self.gridArray[0].setGridColor(grid: self.greenLabel)
                })
            }
            else if label.color == gridArray[1].color
            {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(0.5 * Double(pattern.index(of: label)!)), execute:
                    {
                        self.gridArray[1].setGridColor(grid: self.redLabel)
                })
            }
            else if (label.color == gridArray[2].color)
            {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(0.5 * Double(pattern.index(of: label)!)), execute:
                    {
                        self.gridArray[2].setGridColor(grid: self.yellowLabel)
                })
            }
            else if (label.color == gridArray[3].color)
            {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(0.5 * Double(pattern.index(of: label)!)), execute:
                    {
                        self.gridArray[3].setGridColor(grid: self.blueLabel)
                })
            }
        }
    }
    
    @IBAction func unwindToMenu(Segue: UIStoryboardSegue)
    {
        
    }
    
    @IBAction func onGridTapped(_ sender: UITapGestureRecognizer)
    {
        var message : String
        for label in gridArray
        {
            if label.frame.contains(sender.location(in: backgroundView))
            {
                label.setGridColor(grid: label)
                if(gameStarted == true)
                {
                    if(tapsPerPattern == pattern.count)
                    {
                        if(pattern.count > 1)
                        {
                            message = "You got to a pattern that was \(pattern.count - 1) in length"
                        }
                        else
                        {
                            message = "You didn't memorize any pattern"
                        }
                        let alert = UIAlertController(title: "You have lost ", message: message, preferredStyle: .alert)
                        let alertAction = UIAlertAction(title: "Restart Game", style: .default) {
                            
                            (action) -> Void in self.performSegue(withIdentifier: "High Scores Screen", sender: self)
                            self.resetGame()
                        }
                        alert.addAction(alertAction)
                        present(alert, animated: true, completion: nil)
                        gameEnded = true
                    }
                    if gameEnded == false
                    {
                        if(label.number == pattern[tapsPerPattern].number)
                        {
                            tapsPerPattern += 1
                            
                            if(tapsPerPattern == pattern.count)
                            {
                                needsPattern = true
                                
                            }
                        }
                        else
                        {
                            
                            if(pattern.count > 1)
                            {
                                message = "You got to a pattern that was \(pattern.count - 1) in length"
                            }
                            else
                            {
                                message = "You didn't memorize any pattern"
                            }
                            //let scoreScreen = highScoreViewController()
                            let alert = UIAlertController(title: "You have lost ", message: message, preferredStyle: .alert)
                            let alertAction = UIAlertAction(title: "Restart Game", style: .default) {
                                
                                (action) -> Void in self.performSegue(withIdentifier: "High Scores Screen", sender: self)
                                self.resetGame()
                            }
                            alert.addAction(alertAction)
                            present(alert, animated: true, completion: nil)
                            
                        }
                    }
                }
            }
        }
    }
    
    func resetGame()
    {
        pattern = [gridLabel]()
        needsPattern = true
        patternCreated = false
        gameStarted = false
        gameEnded = false
        tapsPerPattern = 0
        patternButton.setTitle("Start Game", for: .normal)
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if ((needsPattern == true) && (tapsPerPattern == pattern.count))
        {
            if(patternCreated == false)
            {
                createPattern()
                tapsPerPattern = 0
                needsPattern = false
                patternButton.setTitle("Show New Pattern", for: .normal)
            }
            else
            {
                currentScore.text = "\(pattern.count)"
                appendPattern()
                tapsPerPattern = 0
                needsPattern = false
                
            }
            showPattern()
        }
    }
}

