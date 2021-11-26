//
//  ShowPatientDetails.swift
//  DentalClinic
//
//  Created by khalid ali on 21/04/1443 AH.
//

import UIKit

class ShowPatientDetails: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    var cruntindex = 0
    
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
        
        return cell
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "trancfer", sender: self)
        cruntindex = indexPath.row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexP = collectionView.indexPathsForVisibleItems
        let details = segue.destination as! PatientDetals
//        details.LabelName.text = patientArray[indexP].pName
        
    }
    
    
    
    
    func fetchFromDBpatients() {
    let request = Patients.fetchRequest()

    do {
        patientArray =  try! context.fetch(request)
        
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
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
