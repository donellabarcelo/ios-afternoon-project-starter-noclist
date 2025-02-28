//
//  AgentDetailViewController.swift
//  NOCList
//
//  Created by Donella Barcelo on 7/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AgentDetailViewController: UIViewController {
    
    @IBOutlet weak var coverNameLabel: UILabel!
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var accessLabel: UILabel!
    
    var agent: (coverName: String, realName: String, accessLevel: Int, compromised: Bool)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Agents"
        coverNameLabel.text = agent.coverName
        realNameLabel.text = agent.realName
        accessLabel.text = "Level \(agent.accessLevel)"
        if agent.compromised == true {
            view.backgroundColor = UIColor(hue: 0, saturation: 0.4, brightness: 0.9, alpha: 1.0)
        }
        
    
    }


}
