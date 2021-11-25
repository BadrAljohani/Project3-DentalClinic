//
//  SelectTheDoctor.swift
//  DentalClinic
//
//  Created by khalid ali on 19/04/1443 AH.
//

import UIKit

class SelectTheDoctor: UIViewController {
    @IBOutlet weak var drAhmadImage: UIImageView!
    @IBOutlet weak var drMohammadImage: UIImageView!
    
    @IBAction func selectTheDrAhmad(_ sender: UITapGestureRecognizer) {
        let makeAppintment = storyboard?.instantiateViewController(withIdentifier: "Conect") as! ViewController
        present(makeAppintment, animated: true, completion: nil)
        
    }
    
    @IBAction func selectTheDrMohammad(_ sender: UITapGestureRecognizer) {
        let makeAppintment2 = storyboard?.instantiateViewController(withIdentifier: "Conect") as! ViewController
        present(makeAppintment2, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drAhmadImage.isUserInteractionEnabled = true
        drMohammadImage.isUserInteractionEnabled = true
        let drAhmad = UITapGestureRecognizer(target: self, action: #selector(selectTheDrAhmad(_:)))
        let drMohammad = UITapGestureRecognizer.init(target: self, action: #selector(selectTheDrMohammad(_:)))
        
    }
    
    
    
    
    
    
}
