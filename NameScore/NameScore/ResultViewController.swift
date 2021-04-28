//
//  ResultViewController.swift
//  NameScore
//
//  Created by 崎原邦達 on 2021/04/28.
//

import UIKit

class ResultViewController: UIViewController {

    var myName: String = ""

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(myName)
        self.nameLabel.text = "\(self.myName)'s score is ..."
        //0 - n
        //arc4random_uniform(n+1)
        self.scoreLabel.text = String(arc4random_uniform(101))
        
        // Do any additional setup after loading the view.
    }
    

  
}
