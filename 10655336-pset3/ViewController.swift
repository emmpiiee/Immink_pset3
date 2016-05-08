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
        SetUpDatabase()
        ReadTable()
        tableView.reloadData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveToDatabase(sender: AnyObject) {
        
    }
    
    // Make connection database
    private  func SetUpDatabase(){
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        
        do {
            db = try Connection("\(path)/db.sqlite3")
            CreateTable()
        } catch {
            print("Cannot connect to database: \(error)")
        }
    }
    
    private func CreateTable() {
        do {
            try db!.run(notes.create(ifNotExists: true) { t in  // create table notes
                t.column(id, primaryKey: .Autoincrement)        //create collumn id
                t.column(note)                                  // create collumn note
                })
        } catch {
            print("Failed to create a table: \(error)")
        }
    }
    
    private func ReadTable() {
        todolist.removeAll()
        do {
            for item in try db!.prepare(notes) {
                todolist.append(item[note])
            }
        } catch {
            print("Cannot read database: \(error)")
        }
    }
    
    private func DeleteNote(){
        
    }
}
