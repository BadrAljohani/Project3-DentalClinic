//
//  DoctorHomeScreen.swift
//  Project3#Try
//
//  Created by khalid ali on 18/04/1443 AH.
//

import UIKit

class DoctorHomeScreen: UIViewController , UITableViewDelegate, UITableViewDataSource {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var patientList = [Patients]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        patientList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = patientList[indexPath.row].pName
        cell.detailTextLabel?.text = patientList[indexPath.row].pId
        //print(patientList)
        return cell
    }
    // Override to support conditional editing of the table view.
   func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    

    @IBOutlet weak var patientsTable: UITableView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "trancfer", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index1 = tableView.indexPathForSelectedRow
        let trancferVC = segue.destination as! PatientDetals
        trancferVC.LabelName.text = patientList[index1!.row].pName
        trancferVC.LableID.text = patientList[index1!.row].pId
        trancferVC.Labelphone.text = patientList[index1!.row].phoneNumber
        trancferVC.LableEmail.text = patientList[index1!.row].email
        trancferVC.LableComlanin.text = patientList[index1!.row].consult
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        fetchFromDBpatients()
        // Do any additional setup after loading the view.
    }
    
    func fetchFromDBpatients() {
    let request = Patients.fetchRequest()

    do {
        patientList =  try! context.fetch(request)
//        print(patientList)
        
    } catch {
        print("enable to get data from DB")
    }
        
    }
    

    
}
