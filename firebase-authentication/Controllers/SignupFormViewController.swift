//
//  SignupFormViewController.swift
//  firebase-authentication
//
//  Created by Sarath P on 07/01/22.
//

import UIKit
import Material
import FirebaseAuth
import Firebase
import FirebaseFirestore
class SignupFormViewController: UIViewController {

    @IBOutlet weak var firstNameLabel: TextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var secondNameLabel: TextField!
    @IBOutlet weak var emailLabel: TextField!
    @IBOutlet weak var signupButton: Button!
    @IBOutlet weak var passwordLabel: TextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0
        signupButton.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }
    
    func validateFields() -> String? {
        if firstNameLabel.text?.trimmingCharacters(in: .whitespaces) == "" || secondNameLabel.text?.trimmingCharacters(in: .whitespaces) == "" || emailLabel.text?.trimmingCharacters(in: .whitespaces) == "" ||
            passwordLabel.text?.trimmingCharacters(in: .whitespaces) == ""{
            return "Please fill in all fields."
        }
        return nil
    }
    @IBAction func signupButtonTapped(_ sender: Any) {
        let error = validateFields()
        if error != nil {
            errorLabel.text = error!
            errorLabel.alpha = 1
        } else {
            let firstname = firstNameLabel.text!.trimmingCharacters(in: .whitespaces)
            let lastName = secondNameLabel.text!.trimmingCharacters(in: .whitespaces)
            let email = emailLabel.text!.trimmingCharacters(in: .whitespaces)
            let password = passwordLabel.text!.trimmingCharacters(in: .whitespaces)
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    print("error on creating user")
                } else {
                    //user created success.
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstName": firstname, "lastName": lastName, "uid": result!.user.uid]) { (error) in
                        if error != nil {
                            print("error on result")
                        }
                    }
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
