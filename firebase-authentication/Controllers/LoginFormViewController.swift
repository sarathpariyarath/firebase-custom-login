//
//  LoginFormViewController.swift
//  firebase-authentication
//
//  Created by Sarath P on 07/01/22.
//

import UIKit
import Material
import FirebaseAuth
import FirebaseFirestore
class LoginFormViewController: UIViewController {

    @IBOutlet weak var emailLabel: TextField!
    @IBOutlet weak var passwordLabel: TextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: Button!
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0
        loginButton.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }
    func validateFields() -> String? {
        if emailLabel.text?.trimmingCharacters(in: .whitespaces) == "" ||
        passwordLabel.text?.trimmingCharacters(in: .whitespaces) == "" {
        return "Please fill in all fields."
        }
        return nil
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
    let error = validateFields()
        if error != nil {
            errorLabel.text = error!
            errorLabel.alpha = 1
        } else {
            let email = emailLabel.text!.trimmingCharacters(in: .whitespaces)
            let password = passwordLabel.text!.trimmingCharacters(in: .whitespaces)
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    self.errorLabel.text = error?.localizedDescription
                    self.errorLabel.alpha = 1
                } else {
                    self.transitionToHome()
                }
            }
        }
    }
    func transitionToHome() {
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? MainViewController
        view.window?.rootViewController = homeVC
        view.window?.makeKeyAndVisible()
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
