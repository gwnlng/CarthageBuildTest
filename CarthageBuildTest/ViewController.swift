//
//  ViewController.swift
//  CarthageBuildTest
//
//  Created by Jaime Park on 2/12/20.
//  Copyright © 2020 Jaime Park. All rights reserved.
//

import UIKit
import ScanViewController

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openLegacyCardScanButtonPress(_ sender: Any) {
        guard let vc = ScanViewController.createViewController(withDelegate: self) else { return }
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func openSimpleCardScanButtonPress(_ sender: Any) {
        let vc = SimpleScanViewController.createViewController()
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
}

extension ViewController: ScanDelegate {
    func userDidCancel(_ scanViewController: ScanViewController) {
        print("Legacy: User Did Cancel")
        dismiss(animated: true, completion: nil)
    }
    
    func userDidScanCard(_ scanViewController: ScanViewController, creditCard: CreditCard) {
        print("Legacy: User Did Scan Card")
        dismiss(animated: true, completion: nil)
        
        guard let resultVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {
            return
        }
        resultVc.name = creditCard.name
        resultVc.number = creditCard.number
        resultVc.expiration = creditCard.expiryForDisplay()
        
        present(resultVc, animated: true, completion: nil)
    }
    
    func userDidSkip(_ scanViewController: ScanViewController) {
        print("Legacy: User Did Skip")
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: SimpleScanDelegate {
    func userDidCancelSimple(_ scanViewController: SimpleScanViewController) {
        print("Simple: User Did Cancel")
        dismiss(animated: true, completion: nil)
    }
    
    func userDidScanCardSimple(_ scanViewController: SimpleScanViewController, creditCard: CreditCard) {
        print("Simple: User Did Scan Card")
        dismiss(animated: true, completion: nil)
        
        guard let resultVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {
            return
        }
        resultVc.name = creditCard.name
        resultVc.number = creditCard.number
        resultVc.expiration = creditCard.expiryForDisplay()
        
        present(resultVc, animated: true, completion: nil)
    }
}
