//
//  PatientResult.swift
//  DentalClinic
//
//  Created by khalid ali on 19/04/1443 AH.
//

import UIKit

class PatientResult: UIViewController {
    var pId = ""
        
        @IBOutlet weak var patientName: UILabel!
        @IBOutlet weak var patientId: UILabel!
        @IBOutlet weak var consultation: UITextView!
        
        
        var patientsArray = [Patients]()
        
        // GET THE HANDLE FOR DB
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        func fetchFromDB() {
            // fetch from DB
            
            let request = Patients.fetchRequest()
            
            request.predicate = NSPredicate (format: "pId==\(pId)")
            do {
                patientsArray = try context.fetch(request)
            } catch {
                print ("Unable to fetch data from DB")
            }
        }
        
        func fillDetails() {

            if let patient = patientsArray.first {
                patientName.text = patient.pName
                patientId.text = patient.pId
            }
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            fetchFromDB()
            fillDetails()
        }
    }
