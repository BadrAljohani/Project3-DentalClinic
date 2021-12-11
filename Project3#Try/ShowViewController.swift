//
//  ShowViewController.swift
//  Project3#Try
//
//  Created by khalid ali on 15/04/1443 AH.
//

import UIKit

class ShowViewController: UIViewController {
    
    
    @IBOutlet weak var textFieldID: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var patinet = [Patients]()
    
    func fetchFromDBpatients() {
        let request = Patients.fetchRequest()
        
        do {
            try! patinet = context.fetch(request)
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    @IBAction func ButtonDoctorPatients(_ sender: UIButton) {
        
        let trancfer = storyboard?.instantiateViewController(withIdentifier: "ShowPatientDetails") as! ShowPatientDetails
        navigationController?.pushViewController(trancfer, animated: true)
        
        
    }
}
