
import UIKit
//import CoreData

class PatientDetals: UIViewController {
    
    var patient11 = [Patients]()
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var pName:String = ""
    var pId:String = ""
    var email:String = ""
    var phoneNuber:String = ""
    var issue:String = ""
    var status : String = ""
    var isComplete : String = "Complete"
    var isDoctorName : String = ""
    
    @IBOutlet weak var switsh: UISwitch!
    @IBOutlet weak var statusLable: UILabel!
    
    @IBAction func DoctorSubmit(_ sender: UIButton) {
        let request = Patients.fetchRequest()
        
        request.predicate = NSPredicate (format: "pId==\(self.pId)")
     
        do {
            self.patient11 = try self.context.fetch(request)
            self.patient11.first?.consult = prescription.text
            // add record in DB name complete
            self.patient11.first?.complete = isComplete
            self.navigationController?.popViewController(animated: true)
        } catch {
            print ("Unable to fetch data from DB")
        }
        
        
    }
        
    
    @IBAction func complete(_ sender: Any) {
        
                if (switsh.isOn){
                    statusLable.text = "Complete"
                    isComplete = "Complete"
                } else {
                    statusLable.text = "Not Complete"
                    isComplete = "Not Complete"
                }
        
    }

    @IBOutlet weak var prescription: UITextView!
    @IBOutlet weak var LableComlanin: UILabel!
    @IBOutlet weak var LableEmail: UILabel!
    @IBOutlet weak var Labelphone: UILabel!
    @IBOutlet weak var LableID: UILabel!
    @IBOutlet weak var LabelName: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFromDBpatients()
//        fillDetails()
        
        LabelName.text = pName
        LableID.text = pId
        Labelphone.text = phoneNuber
        LableEmail.text = email
        LableComlanin.text = issue
        
        
        // Do any additional setup after loading the view.
    }
    
    // Labelphone.text = ppp
    
    @IBAction func buttonUpdate(_ sender: UIButton) {
        let alert = UIAlertController(title: "Edit Email", message: nil, preferredStyle: .alert)
        alert.addTextField()
        
        let textBox = alert.textFields![0]
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { action in
            
            let request = Patients.fetchRequest()
            
            request.predicate = NSPredicate (format: "pId==\(self.pId)")
         
            do {
                self.patient11 = try self.context.fetch(request)
                self.patient11.first?.email = textBox.text
                self.LableEmail.text = textBox.text
            } catch {
                print ("Unable to fetch data from DB")
            }
            
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        //
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func buttonUpdate2(_ sender: UIButton) {
        let alert = UIAlertController(title: "Edit phone", message: nil, preferredStyle: .alert)
        alert.addTextField()
        
        let textBox = alert.textFields![0]
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { action in
            
            let request = Patients.fetchRequest()
            
           request.predicate = NSPredicate (format: "pId==\(self.pId)")
         
            do {
                self.patient11 = try self.context.fetch(request)
                self.patient11.first?.phoneNumber = textBox.text
                self.Labelphone.text = textBox.text
            } catch {
                print ("Unable to fetch data from DB")
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        //
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    

    func fetchFromDBpatients() {
        
        let request = Patients.fetchRequest()
        do {
            patient11 =  try! context.fetch(request)
            
        } catch {
            print("enable to get data from DB")
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
