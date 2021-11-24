//
//  PatientDetals.swift
//  Project3#Try
//
//  Created by khalid ali on 18/04/1443 AH.
//

import UIKit

class PatientDetals: UIViewController {

    @IBAction func DoctorSubmit(_ sender: UIButton) {
    }
    
    @IBAction func complete(_ sender: Any) {
    }
    
    @IBOutlet weak var prescription: UITextView!
    @IBOutlet weak var LableComlanin: UILabel!
    @IBOutlet weak var LableEmail: UILabel!
    @IBOutlet weak var Labelphone: UILabel!
    @IBOutlet weak var LableID: UILabel!
    @IBOutlet weak var LabelName: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
