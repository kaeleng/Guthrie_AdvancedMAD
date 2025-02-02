//
//  DetailTableViewController.swift
//  Lab2
//
//  Created by Kaelen Guthrie on 2/15/18.
//  Copyright © 2018 Kaelen Guthrie. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var assignments = [String]()
    var selectedClass = 0
    var classListAssignments = Classes()
    var searchController : UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated:Bool){
        classListAssignments.classes = Array(classListAssignments.classData.keys)
        let chosenClass = classListAssignments.classes[selectedClass]
        assignments = classListAssignments.classData[chosenClass]! as [String]
        
        let resultsController = SearchResultsTableViewController()
        resultsController.allAssignments = assignments
        searchController = UISearchController(searchResultsController: resultsController)
        searchController.searchBar.placeholder = "Search for an assignment"
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = resultsController
    }

    override func viewWillDisappear(_ animated: Bool){
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return assignments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = assignments[indexPath.row]
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            assignments.remove(at: indexPath.row)
            let chosenClass = classListAssignments.classes[selectedClass]
            classListAssignments.classData[chosenClass]?.remove(at:indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        if segue.identifier=="doneSegue"{
            let source = segue.source as! AddViewController
            if((source.newAssignment.isEmpty) == false){
                assignments.append(source.newAssignment)
                tableView.reloadData()
                let chosenClass = classListAssignments.classes[selectedClass]
                classListAssignments.classData[chosenClass]?.append(source.newAssignment)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
 
}
