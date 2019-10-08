//
//  ViewController.swift
//  DemoLoginFirebase
//
//  Created by Rangga Djatikusuma Lukman on 08/10/19.
//  Copyright © 2019 Codekinian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElement()
    }
    
    func setUpElement() {
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }


}

