//
//  DoctorHomeScreen.swift
//  Project3#Try
//
//  Created by khalid ali on 18/04/1443 AH.
//

import UIKit

class DoctorHomeScreen: UIViewController , UITableViewDelegate, UITableViewDataSource {
    var array = [String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//        let cell = tableView.dequeueReusableCell(withIdentifier: "patient", for: indexPath) as! DoctorHomeScreen
//        cell.textLabel?.text = array[indexPath.row]
//        array.append("aaaa")
        return cell
    }
    

    @IBOutlet weak var patientsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
}
    
