//
//  SignUpViewController.swift
//  DemoLoginFirebase
//
//  Created by Rangga Djatikusuma Lukman on 08/10/19.
//  Copyright © 2019 Codekinian. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var namaLengkapTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confPasswordTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var messageErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
