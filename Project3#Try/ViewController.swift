

import UIKit
import CoreData


class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var isDoctorsAdded = false
    var docName = ""
    var isDoctorsA = "0"
    var patientArray = [Patients]()
//    var doctorsArray = [Doctors]()
    
        @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldID: UITextField!
    @IBOutlet weak var textFieldNumber: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var lbldecotor: UILabel!
    
    @IBOutlet weak var issue: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        textFieldID.keyboardType = .numberPad
        textFieldEmail.keyboardType = .emailAddress
        textFieldNumber.keyboardType = .numberPad
        lbldecotor.text = docName
        
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
    
    @IBAction func btndissmes(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addOnPreesed(_ sender: Any) {
        
        if ((textFieldName.text) != nil) {

        }
  
        
//        let addPatientsva0 = textFieldName.text!
        let newPatient = Patients(context:context)
        newPatient.pName = textFieldName.text
        newPatient.pId = textFieldID.text
        newPatient.email = textFieldEmail.text
        newPatient.phoneNumber = textFieldNumber.text
        newPatient.issue = issue.text
        newPatient.drName = docName        
        do {
            try! context.save()
        }
            fetchFromDBpatients()
        print("it is in dataBase")
        
        print(newPatient.pName)
        
        self.dismiss(animated: true)
           
        
        dismiss(animated: true, completion: nil)
    }
    
    

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let patientD = storyboard?.instantiateViewController(withIdentifier: "pPatientDetalsVCId") as! PatientDetals
        
        // send patiant data to PatiantDetails
//        if segue.identifier == "s"{
//            let patiantD = segue.destination as! PatientDetals
          //  patiantD.pName =
        }
    

