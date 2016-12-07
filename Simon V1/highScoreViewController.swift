//
//  highScoreViewController.swift
//  Simon V1
//
//  Created by Balgard on 12/6/16.
//  Copyright © 2016 Balgard. All rights reserved.
//

import UIKit

class highScoreViewController: UIViewController {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    @IBAction func onTapped(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    }
}
