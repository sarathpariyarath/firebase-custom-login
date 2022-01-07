//
//  ViewController.swift
//  firebase-authentication
//
//  Created by Sarath P on 07/01/22.
//

import UIKit
import Material
class HomeViewController: UIViewController {

    @IBOutlet weak var signupButton: Button!
    @IBOutlet weak var loginButton: Button!
    override func viewDidLoad() {
        super.viewDidLoad()
        signupButton.layer.cornerRadius = 20
        loginButton.layer.cornerRadius = 20
    }


}

