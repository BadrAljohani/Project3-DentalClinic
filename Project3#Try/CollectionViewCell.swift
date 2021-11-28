//
//  CollectionViewCell.swift
//  DentalClinic
//
//  Created by khalid ali on 21/04/1443 AH.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var patientName: UILabel!
    @IBOutlet weak var patientID: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var patientEmail: UILabel!
    @IBOutlet weak var buttonDelete: UIButton!
    
    @IBOutlet weak var DoctorName: UILabel!
}
