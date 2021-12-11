//
//  SelectTheDoctor.swift
//  DentalClinic
//
//  Created by khalid ali on 19/04/1443 AH.
//

import UIKit

class SelectTheDoctor: UIViewController {
    @IBOutlet weak var drAhmadImage: UIImageView!
    var docName = "ahmad"
    @IBOutlet weak var segment: UISegmentedControl!
    @IBAction func selectTheDrAhmad(_ sender: UITapGestureRecognizer) {
        let makeAppintment = storyboard?.instantiateViewController(withIdentifier: "Conect") as! ViewController
        makeAppintment.docName = docName
        present(makeAppintment, animated: true, completion: nil)
        
    }
    @IBAction func segmentAction(_ sender: Any) {
        if segment.selectedSegmentIndex == 0{
            drAhmadImage.image = UIImage(named: "Dr.Ahmad")
            docName = "ahmad"
            
        }else{
            drAhmadImage.image = UIImage(named: "Dr.Mohammed")
            docName = "mohamed"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drAhmadImage.isUserInteractionEnabled = true
        
        let drAhmad = UITapGestureRecognizer(target: self, action: #selector(selectTheDrAhmad(_:)))
        
    }
}
