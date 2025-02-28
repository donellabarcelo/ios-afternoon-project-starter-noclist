//
//  NOCListTableViewController.swift
//  NOCList
//
//  Created by Ben Gohlke on 5/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class NOCListTableViewController: UITableViewController {
    
    
    private var agents: [(coverName: String, realName: String, accessLevel: Int, compromised: Bool)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Agents"
        
        
        loadNOCList()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agents.count
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
       return "\(compromisedCount()) agents compromised"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NOCListCell", for: indexPath)
        
        let personnel = agents[indexPath.row]
        cell.textLabel?.text = personnel.coverName
        cell.detailTextLabel?.text = personnel.realName
        
        if personnel.compromised == true {
            cell.backgroundColor = UIColor(hue: 0, saturation: 0.4, brightness: 0.9, alpha: 1.0)
        } else {
            cell.backgroundColor = .white
        }
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PresentAgentDetails" {
            let destinationVC = segue.destination as! AgentDetailViewController
           
            guard let index = tableView.indexPathForSelectedRow?.row else {return}
            
            let selectedAgent = agents[index]
            
            destinationVC.agent = selectedAgent
            
        }
        
    }
    
    private func loadNOCList() {
        let ethan = (coverName: "Ethan Hunt", realName: "Tom Cruise", accessLevel: 8, compromised: true)
        let jim = (coverName: "Jim Phelps", realName: "Jon Voight", accessLevel: 9, compromised: false)
        let claire = (coverName: "Claire Phelps", realName: "Emmanuelle Beart", accessLevel: 5, compromised: false)
        let eugene = (coverName: "Eugene Kittridge", realName: "Henry Czerny", accessLevel: 10, compromised: true)
        let franz = (coverName: "Franz Krieger", realName: "Jean Reno", accessLevel: 4, compromised: false)
        let luther = (coverName: "Luther Stickell", realName: "Ving Rhames", accessLevel: 4, compromised: false)
        let sarah = (coverName: "Sarah Davies", realName: "Kristin Scott Thomas", accessLevel: 5, compromised: true)
        let max = (coverName: "Max RotGrab", realName: "Vanessa Redgrave", accessLevel: 4, compromised: false)
        let hannah = (coverName: "Hannah Williams", realName: "Ingeborga Dapkūnaitė", accessLevel: 5, compromised: true)
        let jack = (coverName: "Jack Harmon", realName: "Emilio Estevez", accessLevel: 6, compromised: true)
        let frank = (coverName: "Frank Barnes", realName: "Dale Dye", accessLevel: 9, compromised: false)
        
    agents = [ethan, jim, claire, eugene, franz, luther, sarah, max, hannah, jack, frank]
        
    }
    
    func compromisedCount() -> String {
       var totalCompromised = -64
       for agent in agents {
        totalCompromised += agent.accessLevel
        }
        return "\(totalCompromised)"
        
   }
    
}
