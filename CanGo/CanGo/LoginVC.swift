//
//  LoginVC.swift
//  CanGo
//
//  Created by Brian Bae on 2016. 12. 30..
//  Copyright © 2016년 Brian Bae. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    var kakaoBtn:UIButton? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.KakaoBtn = KOLoginButton()
        self.kakaoBtn = KOLoginButton(frame: CGRect(x: 43, y: 526, width: 288, height: 61))
        //self.kakaoBtn?.frame = CGRect(15, 54, 300, 500)
        self.kakaoBtn?.backgroundColor = UIColor.black
        
        self.kakaoBtn?.addTarget(self, action: #selector(kakaoClicked), for: .touchUpInside)
        self.view.addSubview(self.kakaoBtn!)
        
        
        // Do any additional setup after loading the view.
    }
    
    func kakaoClicked(){
        print("kakao clicked");
        /*if KOSession.shared().isOpen(){
         KOSession.shared().close()
         }*/
        KOSession.shared().open { (error) in
            if KOSession.shared().isOpen(){
                print("done")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var ID: UITextField!
    
    @IBOutlet weak var PWD: UITextField!
    
    @IBAction func LogIn(_ sender: UIButton) {
        let id = ID.text
        let pwd = PWD.text
        Server.manager.login(email: id!, pwd: pwd!, completion: {
            result in
            if(result["result"] as! Bool)
            {
                print("login success")
                self.present(MainViewController(), animated: true, completion: nil)
            }else{
                print("login fail")
                let alert = UIAlertController(title: "로그인 실패", message: "다시 시도해주세요", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.ID.text = ""
                self.PWD.text = ""
            }
        })
    }
    
    
    
    //@IBOutlet weak var KakaoBtn: UIButton!
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
