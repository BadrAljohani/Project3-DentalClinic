

import UIKit
import CoreData

//struct patients {
//    var pid : String
//    var pname : String
//    var pemail : String
//    var PhoneNumber : String
//}
//
//struct Doctor {
//    var Dname : String
//    var clinicnum : Int
//}

class ViewController: UIViewController , UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var isDoctorsAdded = false
    
    var patientArray = [Patients]()
    var doctorsArray = [Doctors]()
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldID: UITextField!
    @IBOutlet weak var textFieldNumber: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var segmentDoctor: UISegmentedControl!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if (isDoctorsAdded == false) {
            
            // add all doctors to DB
            print("Doctors Added")
            
            isDoctorsAdded = true
        }
        
        // Do any additional setup after loading the view.
        fetchFromDBpatients()

    }
    
    func fetchFromDBpatients() {
    let request = Patients.fetchRequest()

    do {
        patientArray =  try! context.fetch(request)
//        patientArray[0].
    } catch {
        print("enable to get data from DB")
    }
        
    }
    
    
    @IBAction func addOnPreesed(_ sender: Any) {
        var indexForDoctor = segmentDoctor.selectedSegmentIndex
        if (indexForDoctor == 0) {
            print("Dr Ahmad")
            let pt = Patients(context: context)
            pt.drName = "Dr Ahmad"
            // save in data
            fetchFromDBpatients()
        }
        else if (indexForDoctor == 1) {
            print("Dr Mohammad")
            let  pt1 = Patients(context: context)
            pt1.drName = "Dr Mohammad"
            // save in data
            fetchFromDBpatients()
        }
        
        
//        let addPatientsva0 = textFieldName.text!
        let newPatient = Patients(context:context)
        newPatient.pName = textFieldName.text
        newPatient.pId = textFieldID.text
        newPatient.email = textFieldEmail.text
        newPatient.phoneNumber = textFieldNumber.text
        do {
            try! context.save()
        }
            //fetchFromDBpatients()
        

    }

}
