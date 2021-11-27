//
//  ShowViewController.swift
//  Project3#Try
//
//  Created by khalid ali on 15/04/1443 AH.
//

import UIKit

class ShowViewController: UIViewController {

//    var drArray = [Patients]()
    
    @IBOutlet weak var textFieldID: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var patinet = [Patients]()

    func fetchFromDBpatients() {
        let request = Patients.fetchRequest()
        

        //Filtering
        let filterDr = NSPredicate(format: "name contains 'Dr Ahmad' OR 'Dr Mohamad'")
        request.predicate = filterDr

        
        do {
            try! patinet = context.fetch(request)
            
        }
//    do {
//        patientArray =  try! context.fetch(request)
//    } catch {
//        print("enable to get data from DB")
//    }
}
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func ButtonShowAppintment(_ sender: UIButton) {
        
        let trancfer = storyboard?.instantiateViewController(withIdentifier: "selectDoctor") as! SelectTheDoctor
        
        navigationController?.show(trancfer, sender: self)
    }
    
    @IBAction func showResult(_ sender: UIButton) {
        let trancfer = storyboard?.instantiateViewController(withIdentifier: "PatientResult") as! PatientResult
        trancfer.pId = textFieldID.text ?? ""
        
        navigationController?.pushViewController(trancfer, animated: true)
        

        
    }

    @IBOutlet weak var DoctorFilter: UITextField!
    @IBAction func ButtonDoctorPatients(_ sender: UIButton) {
        
//        let DoctorList = patinet
//
//           DoctorList.drName = DoctorFilter.text
//        DoctorList.id =DoctorFilter.text
//        do { try! context.save()}
//        fetchFromDBpatients()
//        print(patinet)
//    }
//    func  {
//        let filterBya = NSPredicate(format: "drName CONTAINS 'Dr Ahmad' OR 'Dr Mohamad'")
//
//}
//       
//                let filterByA = NSPredicate(format: "name CONTAINS[cd]  'A'")
//                request.predicate = filterByA
//    
//        
//
//    
//        navigationController?.popViewController(animated: true)
//        
//         navigationController?.pushViewController(DoctorHomeScreen, animated: true)
//


}
}


