//
//  ShowViewController.swift
//  Project3#Try
//
//  Created by khalid ali on 15/04/1443 AH.
//

import UIKit

class ShowViewController: UIViewController {

    var patinet = Patients ()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ButtonShowAppintment(_ sender: UIButton) {
        
        let trancfer = storyboard?.instantiateViewController(withIdentifier: "Conect") as! ViewController
        
        navigationController?.show(trancfer, sender: self)
    }
    
    @IBAction func showResult(_ sender: UIButton) {
        
        
        
    }
    
    
    
    
    
    
    @IBAction func ButtonDoctorPatients(_ sender: UIButton) {
       // patinet.drName?.filter{}
        let filterBya = NSPredicate(format: "drName CONTAINS 'Dr Ahmad'")
        print(patinet)
//        navigationController?.popViewController(animated: true)
        
//         navigationController?.pushViewController(DoctorHomeScreen, animated: true)
    }
    
}
