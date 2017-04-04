//
//  ViewController.swift
//  Groupa
//
//  Created by ollaollu on 23/03/2017.
//  Copyright © 2017 ollaollu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var usernameField: UITextField!
    var usernames = [String]()
    
    @IBOutlet weak var groupNumberField: UITextField!
    var groups = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usernames.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "displayCell", for:indexPath) as! displayCell
        cell.displayLabel.text = usernames[indexPath.item]
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          usernames.remove(at: indexPath.row)
          reloadTable()
        }
    }
    
    func reloadTable() {
        tableView.reloadData();
    }

    @IBAction func addUsername(_ sender: Any) {
        usernames.append(usernameField.text!)
        usernameField.text = "";
        reloadTable()
    }
    
    @IBAction func generateGroups(_ sender: Any) {
        let grouping = Int(groupNumberField.text!)
        while usernames.isEmpty == false {
          let grouped = usernames.prefix(grouping!)
          groups.append(Array(grouped))
          usernames = usernames.filter{ !grouped.contains($0) }
        }
        
        //print groupings to console
        usernames = []
        groupNumberField.text = ""
        reloadTable()
        print(groups)
    }
}

