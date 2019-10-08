//
//  LoginViewController.swift
//  DemoLoginFirebase
//
//  Created by Rangga Djatikusuma Lukman on 08/10/19.
//  Copyright © 2019 Codekinian. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var identityTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var messageErrorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElement()
    }
    
    func setUpElement() {
        messageErrorLabel.alpha = 0
        
        Utilities.styleTextField(identityTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func loginTapped(_ sender: Any) {
        // Validate
        
        // data clean
        let identity = identityTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signin
        Auth.auth().signIn(withEmail: identity, password: password) { (res, err) in
            if err != nil {
                self.showError(err!.localizedDescription)
            }else{
                self.redirectToHome()
            }
        }
    }
    
    func redirectToHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    func showError(_ message: String) {
        messageErrorLabel.alpha = 1
        messageErrorLabel.text = message
    }
}
