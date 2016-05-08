//
//  ViewController.swift
//  10655336-pset3
//
//  Created by Emma Immink on 08-05-16.
//  Copyright © 2016 Emma Immink. All rights reserved.
//

import UIKit
import SQLite


class ViewController: UIViewController {

    @IBOutlet weak var AddingField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var todolist = Array<String> ()
    
    // Make SQL expressions
    private var db: Connection?
    let notes = Table("notes")
    let id = Expression<Int64>("id")
    let note = Expression<String>("note")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SaveToDatabase(sender: AnyObject) {
    }
    
    private  func SetUpDatabase(){
        
    }
    
    private func CreateTable() {
        
    }

    private func ReadTable() {
        
    }
    
    private func DeleteNote(){
        
    }
}