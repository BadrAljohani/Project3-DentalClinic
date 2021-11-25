//
//  PatientDetals.swift
//  Project3#Try
//
//  Created by khalid ali on 18/04/1443 AH.
//

import UIKit
import CoreData

class PatientDetals: UIViewController {
    
    var ppp: Patients?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
//    var pName:String = ""
//    var pId:String = ""
//    var email:String = ""
//    var phoneNuber:String = ""
//    var issue:String = ""
//    var status : String = ""
    
    @IBOutlet weak var statusLable: UILabel!
    
    @IBAction func DoctorSubmit(_ sender: UIButton) {
        
        
    }
    
    @IBAction func complete(_ sender: Any) {
//        UserDefaults.standard.set(complete.isOn, forKey: "Status")
//        if (complete.isOn){
//            statusLable.text = "Complete"
//        } else {
//            statusLable.text = "Not Complete"
//        }
//
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
    
   // Labelphone.text = ppp
    
    func getDector (drName : String?) {
        if let drName = drName{
        let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Patients")
        
        fetchRequest.predicate = NSPredicate (format: "drName = %@", drName)
        do{
            let fetchPatients = try context.fetch(fetchRequest)
            if fetchPatients.indices.contains(0){
                let mypatient = fetchPatients[0] as! Patients
                print(mypatient.drName ?? "not found")
                
//                name contains 'Dr Ahmad' OR 'Dr Mohamad'"
                
            }else{
                print(" iiiii ")
            }
        } catch {
            print("ERROr Fetch user")
        }
    }else{
        print("filed")
    }
        
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
