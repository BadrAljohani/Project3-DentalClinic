

import UIKit
import CoreData


class ViewController: UIViewController , UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var isDoctorsAdded = false
    
    var patientArray = [Patients]()
//    var doctorsArray = [Doctors]()
    
        @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldID: UITextField!
    @IBOutlet weak var textFieldNumber: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var segmentDoctor: UISegmentedControl!
    @IBOutlet weak var issue: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        textFieldID.keyboardType = .numberPad
        textFieldEmail.keyboardType = .emailAddress
        textFieldNumber.keyboardType = .numberPad
        
        
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
        
    } catch {
        print("enable to get data from DB")
    }
}
    @IBAction func addOnPreesed(_ sender: Any) {
        
        if ((textFieldName.text) != nil) {
            
        }
        
        let indexForDoctor = segmentDoctor.selectedSegmentIndex
        if (indexForDoctor == 0) {
            print("Dr Ahmad")
            let pt = Patients(context: context)
            pt.drName = "Dr Ahmad"
            // save in data
//            fetchFromDBpatients()
        }
        else if (indexForDoctor == 1) {
            print("Dr Mohammad")
            let  pt1 = Patients(context: context)
            pt1.drName = "Dr Mohammad"
            // save in data
//            fetchFromDBpatients()
        }
        
        
//        let addPatientsva0 = textFieldName.text!
        let newPatient = Patients(context:context)
        newPatient.pName = textFieldName.text
        newPatient.pId = textFieldID.text
        newPatient.email = textFieldEmail.text
        newPatient.phoneNumber = textFieldNumber.text
        newPatient.issue = issue.text
//        newPatient.drName = segmentDoctor
        do {
            try! context.save()
        }
            fetchFromDBpatients()
        print("it is in dataBase")
        
        print(newPatient.pName)
        self.navigationController?.popViewController(animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let patientD = storyboard?.instantiateViewController(withIdentifier: "pPatientDetalsVCId") as! PatientDetals
        
        // send patiant data to PatiantDetails
        if segue.identifier == "s"{
            let patiantD = segue.destination as! PatientDetals
            patiantD.pName =
        }
    }
}
