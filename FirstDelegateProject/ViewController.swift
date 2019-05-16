//
//  ViewController.swift
//  FirstDelegateProject
//
//  Created by Haris Shobaruddin Roabbni on 16/05/19.
//  Copyright © 2019 Haris Shobaruddin Robbani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputName.delegate = self
        inputPhone.delegate = self
    }
    
    @IBAction func registerAction(_ sender: Any) {
        if inputName.text == "" || inputPhone.text == "" {
            let alertMsg = UIAlertController(title: "Warning!", message: "Harap isi semua field !", preferredStyle: .alert)
            alertMsg.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alertActions) in
                alertMsg.dismiss(animated: true, completion: nil)
            }))
            present(alertMsg, animated: true, completion: nil)
        }else{
            performSegue(withIdentifier: "toConfirmPage", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RegistrationViewController{
            destination.fullName = inputName.text
        }
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == inputName {
            inputPhone.becomeFirstResponder()
        }
        
        if textField == inputPhone {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == inputPhone {
            let characterAllowed = CharacterSet(charactersIn: "+1234567890")
            let characterInput = CharacterSet(charactersIn: string)
            return characterAllowed.isSuperset(of: characterInput)
        }
        return true
    }
}

