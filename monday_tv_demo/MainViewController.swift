//
//  ViewController.swift
//  monday_tv_demo
//
//  Created by Andy Feng on 4/10/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddDataDelegate {

    var arr = ["1", "2", "3"]
    
    @IBOutlet weak var myTV: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // How many rows?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
    // What does each cell look like?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = arr[indexPath.row]
        
        
        return cell
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue" {
            
            let vc = segue.destination as! AddViewController
            
            vc.name = "Andy"
            vc.addDataDelegate = self
            
            
        }
        
        
    }
    
    func addSomeData(data: String) {
        
        print(data)
        
        
        arr.append(data)
        
        print(arr)
        
        myTV.reloadData()
    
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    

}

