//
//  ViewController.swift
//  CustomFont
//
//  Created by 刘梦迪 on 2017/4/6.
//  Copyright © 2017年 mengdi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = ["learn Swift 30 days", "learn JavaScript 30 days", "learn Java 30 days", "learn Python 30 days", "learn Linux 30 days", "Learn SQL 30 days","learn Swift 30 days", "learn JavaScript 30 days", "learn Java 30 days", "learn Python 30 days", "learn Linux 30 days", "Learn SQL 30 days","learn Swift 30 days", "learn JavaScript 30 days", "learn Java 30 days", "learn Python 30 days", "learn Linux 30 days", "Learn SQL 30 days","learn Swift 30 days", "learn JavaScript 30 days", "learn Java 30 days", "learn Python 30 days", "learn Linux 30 days", "Learn SQL 30 days"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Gaspar Regular"]
    
    var fontRowIndex = 0 {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.contentInset = UIEdgeInsetsMake(-20, 0, -20, 0);
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func handleChangeFont(_ sender: UIButton) {
        fontRowIndex = Int(arc4random_uniform(4))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontCell", for: indexPath)
        
        let text = dataSource[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = UIFont(name: fontNames[fontRowIndex], size: 16)
        
        return cell
    }

}

