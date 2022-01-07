//
//  MainViewController.swift
//  firebase-authentication
//
//  Created by Sarath P on 07/01/22.
//

import UIKit
import FirebaseAuth
class MainViewController: UIViewController {

    @IBOutlet weak var welcomeText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        welcomeText.text = user?.uid
        
    }
    
    @IBAction func signOutButtonClicked(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
                } catch
                    let signOutError as NSError {
                      print("Error signing out: %@", signOutError)
                    }
                
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
