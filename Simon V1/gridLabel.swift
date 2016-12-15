//
//  gridLabel.swift
//  Simon V1
//
//  Created by Balgard on 12/1/16.
//  Copyright © 2016 Balgard. All rights reserved.
//

import UIKit

class gridLabel: UILabel {
    var color = 0
    var oldColor = UIColor.white
    var number = 0
    
    //checks if the label is supposed to be tapped or not
    func shouldBeTapped(tapped: gridLabel, required: gridLabel) -> Bool
    {
        if tapped == required
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    // changes the color of the gridLabel called for .2 seconds and then returns it to its original color 
    func setGridColor(grid: gridLabel)
    {
        if grid.color == 0//green
        {
            grid.backgroundColor = UIColor(red:0.20, green:0.80, blue:0.20, alpha:1.0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute:
                {
                    grid.backgroundColor = grid.oldColor
            })
        }
        else if grid.color == 1//red
        {
            grid.backgroundColor = UIColor(red:1.00, green:0.0, blue:0.0, alpha:1.0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute:
                {
                    grid.backgroundColor = grid.oldColor
            })
        }
        else if grid.color == 2//yellow
        {
            grid.backgroundColor = UIColor(red:1.0, green:1.0, blue:0.0, alpha:1.0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute:
                {
                    grid.backgroundColor = grid.oldColor
            })
        }
        else if grid.color == 3//blue
        {
            grid.backgroundColor = UIColor(red:0.0, green:0.0, blue:1.0, alpha:1.0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute:
                {
                    grid.backgroundColor = grid.oldColor
            })
        }
    }
}
