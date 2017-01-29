//
//  FindPwdVC.swift
//  CanGo
//
//  Created by Brian Bae on 2017. 1. 2..
//  Copyright © 2017년 Brian Bae. All rights reserved.
//

import UIKit

class FindPwdVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var endView:UIView!
    @IBAction func back(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var email:UITextField!
    @IBAction func submit(_ sender: UIButton){
        let alert = UIAlertController(title: "이메일 전송", message: "\(email.text!) 로 초기화된 비밀번호가 전송됩니다. \n주소를 수정하시려면 취소 버튼을 눌러주세요.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default) {action in
            self.endView.alpha = 1
            Server.manager.findpwd(email: self.email.text!)
        })
        alert.addAction(UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)

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
