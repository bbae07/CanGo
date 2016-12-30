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
        self.kakaoBtn = KOLoginButton(frame: CGRect(x: 20, y: 20, width: 200, height: 60))
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
    }
    
    
    @IBAction func KakaoLogIn(_ sender: UIButton) {
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
