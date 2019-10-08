//
//  SignUpViewController.swift
//  DemoLoginFirebase
//
//  Created by Rangga Djatikusuma Lukman on 08/10/19.
//  Copyright © 2019 Codekinian. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var namaLengkapTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confPasswordTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var messageErrorLabel: UILabel!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElement()
    }
    
    func setUpElement() {
        messageErrorLabel.alpha = 0
        
        Utilities.styleTextField(namaLengkapTextField)
        Utilities.styleTextField(usernameTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleTextField(confPasswordTextField)
        Utilities.styleTextField(phoneTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // Untuk memvalidasi data inputan yang diisi oleh user
    func validateFields() -> String? {
        
        // cek inputan tidak ada yang kosong
        if namaLengkapTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            phoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Mohon lengkapi data"
        }
        
        // password secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleaneConfPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password lemah
            return "Pastikan kata sandi lebih dari 8 karakter, memiliki karakter unik, dan memiliki angka"
        }
        
        // compare password dengan confpassword
        if cleanedPassword != cleaneConfPassword {
            // password tidak sama
            return "Kata sandi dan Konfirmasi kata sandi tidak sesuai"
        }
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        // Validate
        let error = validateFields()
        if error != nil {
            // terdapat kesalahan
            showError(error!)
        }else{
            let fullName = namaLengkapTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let userName = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let phoneNumber = phoneTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let emailAddress = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Save User
            Auth.auth().createUser(withEmail: emailAddress, password: password) { (res, err) in
                
                //check error
                if err != nil {
                    self.showError("Gagal mendaftarkan akun")
                }else{
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: [
                        "fullname": fullName,
                        "username": userName,
                        "phone": phoneNumber,
                        "email": emailAddress,
                        "uid": res!.user.uid
                    ]) { (error) in
                        
                        if error != nil {
                            self.showError("Data gagal disimpan")
                        }
                    }
                }
            }
            
            // Redirect to home
            self.redirectToHome()
        }
    }
    
    
    // menampilkan error
    func showError(_ message: String) {
        messageErrorLabel.text = message
        messageErrorLabel.alpha = 1
    }
    
    func redirectToHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
