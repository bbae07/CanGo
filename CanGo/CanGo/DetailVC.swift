//
//  DetailVC.swift
//  CanGo
//
//  Created by Brian Bae on 2017. 1. 3..
//  Copyright © 2017년 Brian Bae. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var currentlocation:Location? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = currentlocation!.name
        category.text = currentlocation!.category
        address.text = currentlocation!.address
        address_new.text = currentlocation!.address_new
        extra.text = currentlocation!.extra_info
        
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var name:UILabel!
    @IBOutlet var category:UILabel!
    @IBOutlet var address:UILabel!
    @IBOutlet var address_new:UILabel!
    @IBOutlet var extra:UILabel!
    
    @IBOutlet var profilepic:UIImageView!
    @IBOutlet var username:UILabel!
    @IBOutlet var iconscroll:UIScrollView!
    
    @IBOutlet var image1:UIImageView!
    @IBOutlet var image2:UIImageView!
    @IBOutlet var image3:UIImageView!
    @IBOutlet var image4:UIImageView!
    @IBOutlet var image5:UIImageView!
    @IBOutlet var image6:UIImageView!
    @IBOutlet var image7:UIImageView!
    @IBOutlet var image8:UIImageView!
    
    @IBOutlet var images:UIScrollView!
    
    @IBOutlet var comments:UITableView!
    
    
    /*
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
    */
}
