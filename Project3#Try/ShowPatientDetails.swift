//
//  ShowPatientDetails.swift
//  DentalClinic
//
//  Created by khalid ali on 21/04/1443 AH.
//

import UIKit

class ShowPatientDetails: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    var cruntindex = 0
    var doctorName11 = ""
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
     var patientArray = [Patients]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        patientArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.patientName.text = patientArray[indexPath.row].pName
        cell.patientID.text = patientArray[indexPath.row].pId
        cell.phoneNumber.text = patientArray[indexPath.row].phoneNumber
        cell.patientEmail.text = patientArray[indexPath.row].email
        cell.DoctorName.text = patientArray[indexPath.row].drName
        cell.buttonDelete.tag = indexPath.row
        cell.buttonDelete.addTarget(self, action: #selector(delete1), for: .touchUpInside)
        return cell
    }
    
    @objc func delete1(sender:UIButton) {
        let itemToDelete = patientArray[sender.tag]
        self.context.delete(itemToDelete)
        do { try!
            self.context.save()
            self.fetchFromDBpatients()
        }
    }

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = patientArray[indexPath.row]
        
        
        
        let trancfer = storyboard?.instantiateViewController(withIdentifier: "PatientDetals") as! PatientDetals
        trancfer.pName = item.pName ?? ""
        trancfer.pId = item.pId ?? ""
        trancfer.email = item.email ?? ""
        trancfer.phoneNuber = item.phoneNumber ?? ""
        trancfer.issue = item.issue ?? ""

        
        navigationController?.pushViewController(trancfer, animated: true)
    }
    
   
    
    
    
    
    
    
    
    func fetchFromDBpatients() {
    let request = Patients.fetchRequest()

    do {
        patientArray =  try! context.fetch(request)
        collectionView.reloadData()
    } catch {
        print("enable to get data from DB")
    }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        fetchFromDBpatients()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchFromDBpatients()
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
