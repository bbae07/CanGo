//
//  SignUpVC.swift
//  CanGo
//
//  Created by Brian Bae on 2016. 12. 31..
//  Copyright © 2016년 Brian Bae. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var id: UITextField!
    @IBAction func dupcheck(_ sender: UIButton) {
        
    }
    @IBOutlet weak var email: UITextField!
    @IBAction func birthday(_ sender: UIButton) {
    }
    @IBOutlet weak var wheelchair: UISegmentedControl!
    @IBOutlet weak var pwd: UITextField!
    @IBOutlet weak var pwdconfirm: UITextField!
    
    @IBAction func submit(_ sender: UIButton) {
        
        
    }
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
