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
    @IBOutlet weak var supporters: UISegmentedControl!
    @IBOutlet weak var pwd: UITextField!
    @IBOutlet weak var pwdconfirm: UITextField!
    var birthdayStr:String = "2000-01-08"
    var wheel:Bool = false
    var supporter:Int = 0
    
    @IBAction func submit(_ sender: UIButton) {
        //if(id.text == "" || email.text == "" || birthdayStr == "" || pwd.text == "" || pwdconfirm.text == "" || !wheelchair.isSelected)
        if(id.text == "" || email.text == "" || pwd.text == "" || birthdayStr == "" || pwdconfirm.text == "" || wheelchair.selectedSegmentIndex == -1 || supporters.selectedSegmentIndex == -1)
        {
            let alert = UIAlertController(title: "회원가입 실패", message: "항목을 다 작성하셨는지 확인해주세요", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
        } else{
            
            if(pwd.text != pwdconfirm.text)
            {
                let alert = UIAlertController(title: "회원가입 실패", message: "비밀번호가 일치하는지 확인해주세요", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else{
                if(wheelchair.selectedSegmentIndex == 0)
                {
                    wheel = true
                }
                if(supporters.selectedSegmentIndex == 0)
                {
                    supporter = 1
                }
                Server.manager.signup(email: email.text!, nickname: id.text!, password: pwdconfirm.text!, bday: "2000-01-08 06:00:00.000000-08:00", wheelchair: wheel, supporters: supporter) { result in
                    
                    var isDuplicated:Bool = false
                    if let nicknameResult:String = (result.value(forKey: "nickname") as? [String])?[0]{
                        if(nicknameResult == "cango user with this nickname already exists."){
                            let alert = UIAlertController(title: "회원가입 실패", message: "닉네임 중복", preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            isDuplicated = true
                        }
                    }
                    if let emailResult:String = (result.value(forKey: "email") as? [String])?[0]{
                        if(emailResult == "cango user with this email address already exists."){
                            let alert = UIAlertController(title: "회원가입 실패", message: "이메일 중복", preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            isDuplicated = true
                        }
                    }
                    if( !isDuplicated){
                        self.dismiss(animated: true, completion: nil)
                        
                    }
                }
            }
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
