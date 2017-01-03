//
//  TestViewController.swift
//  CanGo
//
//  Created by 이경문 on 2017. 1. 2..
//  Copyright © 2017년 Brian Bae. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet var profileImage:UIImageView!
    @IBOutlet var image1:UIImageView!
    @IBOutlet var image2:UIImageView!
    @IBOutlet var image3:UIImageView!
    @IBOutlet var image4:UIImageView!
    @IBOutlet var image5:UIImageView!
    @IBOutlet var image6:UIImageView!
    @IBOutlet var image7:UIImageView!
    @IBOutlet var image8:UIImageView!


    @IBOutlet var symbolScrollView:UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        profileImage.image = UIImage(named: "app_0_4_1")
        profileImage.contentMode = .scaleAspectFit

        let list:[UIImageView] = [image1,image2,image3,image4,image5,image6,image7,image8]

        for member in list{
            member.image = UIImage(named:"app_0_4_1")
        }


        for index in 0 ... 20{
            let test:UIImageView = UIImageView()
            test.frame.size = list[0].frame.size
            test.image = UIImage(named:"app_0_4_1")
            test.frame = CGRect(x: CGFloat(index)*test.frame.size.width, y: CGFloat(0), width: test.frame.size.width, height: test.frame.size.height)
            symbolScrollView.addSubview(test)
        }

        symbolScrollView.contentSize = CGSize(width:21*list[0].frame.size.width, height:list[0].frame.size.height)
        symbolScrollView.backgroundColor = UIColor.green
        symbolScrollView.isScrollEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
