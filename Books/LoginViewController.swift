//
//  LoginViewController.swift
//  Books
//
//  Created by SDS-018 on 2017. 4. 27..
//  Copyright © 2017년 SDS-018. All rights reserved.
//

import UIKit

protocol LoginProtocol {
    func completedLogin(name: String)
        //-> <#return type#> {
    //<#function body#>
    //}
}


class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameTextField: UITextField!
    
    
    @IBAction func confirmLogin(_ sender: Any) {
        if let del = delegate, let name = nameTextField.text{
            del.completedLogin(name: name)
        }
        
        
    }
    
    
    //var delegate: MainTableViewController? = nil
    
    var delegate: LoginProtocol? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //nameTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
