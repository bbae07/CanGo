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
    @IBOutlet weak var email: UITextField!
    @IBAction func birthday(_ sender: UIButton) {
    }
    @IBOutlet weak var wheelchair: UISegmentedControl!
    @IBOutlet weak var pwd: UITextField!
    @IBOutlet weak var pwdconfirm: UITextField!
    var birthdayStr:String = "2000-01-08"
    var wheel:Bool = false
    
    @IBAction func submit(_ sender: UIButton) {
        if(id.text == "" || email.text == "" || birthdayStr == "" || pwd.text == "" || pwdconfirm.text == "" || !wheelchair.isSelected)
        {
            if(pwd.text != pwdconfirm.text)
            {
                let alert = UIAlertController(title: "회원가입 실패", message: "비밀번호가 일치하는지 확인해주세요", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
            } else{
                if(wheelchair.selectedSegmentIndex == 0)
                {
                    wheel = true
                }
                
                Server.manager.signup(email: email.text!, nickname: id.text!, password: pwdconfirm.text!, bday: "2000-01-08", wheelchair: wheel) { result in
                    if(result.value(forKey: "nickname") as! String == "cango user with this nickname already exists." )
                    {
                        let alert = UIAlertController(title: "회원가입 실패", message: "닉네임 중복", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
                    }
                    else if(result.value(forKey: "email") as! String == "cango user with this email address already exists.")
                    {
                        let alert = UIAlertController(title: "회원가입 실패", message: "이메일 중복", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
                    } else
                    {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
            
            
        } else{
            let alert = UIAlertController(title: "회원가입 실패", message: "항목을 다 작성하셨는지 확인해주세요", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
        }
        
        wheel = false
        
        
        
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
