//
//  ResultViewController.swift
//  CarthageBuildTest
//
//  Created by Jaime Park on 9/24/20.
//  Copyright © 2020 Jaime Park. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var number: String?
    var name: String?
    var expiration: String?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var expiryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Name: \(name ?? "")"
        numberLabel.text = "Number: \(number ?? "")"
        expiryLabel.text = "Expiration: \(expiration ?? "")"
        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonPress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
