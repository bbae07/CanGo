//
//  DetailVC.swift
//  CanGo
//
//  Created by Brian Bae on 2017. 1. 3..
//  Copyright © 2017년 Brian Bae. All rights reserved.
//

import UIKit
import PopupDialog

class DetailVC: UIViewController,MTMapViewDelegate {
    //MTMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))

    var currentlocation:Location? = nil
    
    @IBOutlet var name:UILabel!
    @IBOutlet var category:UILabel!
    @IBOutlet var address:UILabel!
    @IBOutlet var address_new:UILabel!
    @IBOutlet var extra:UILabel!
    
    @IBOutlet weak var locationTitleView: UIView!
    @IBOutlet weak var locationMapView: MTMapView!
    
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

    @IBOutlet var button1:UIButton!
    @IBOutlet var button2:UIButton!
    @IBOutlet var button3:UIButton!
    @IBOutlet var button4:UIButton!
    @IBOutlet var button5:UIButton!
    @IBOutlet var button6:UIButton!
    @IBOutlet var button7:UIButton!
    @IBOutlet var button8:UIButton!

    @IBOutlet var images:UIScrollView!
    
    @IBOutlet var comments:UITableView!
    

    func editClicked(sender:UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let new_popup:PopUpDialogViewController = storyboard.instantiateViewController(withIdentifier: "POP_UP_DIALOG") as! PopUpDialogViewController
        new_popup.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.present(new_popup, animated: true, completion: nil)
    }
    @IBAction func exit(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.name.text = currentlocation!.name
        category.text = currentlocation!.category
        address.text = currentlocation!.address
        address_new.text = currentlocation!.address_new
        extra.text = currentlocation!.extra_info
        
        
        //구체적인 image control

        let buttonList:[UIButton] = [button1,button2,button3,button4,button5,button6,button7,button8]

        for i in 0..<buttonList.count{
            buttonList[i].tag = i+1
            buttonList[i].addTarget(self, action: #selector(editClicked(sender:)), for: .touchUpInside)
        }
        
        let list:[UIImageView] = [image1,image2,image3,image4,image5,image6,image7,image8]
        
        for i in 0..<list.count{
            switch i {
            case 0:
                list[0].image = UIImage(named: "app_0_12_\(currentlocation!.c_barrier)")
            case 1:
                list[1].image = UIImage(named: "app_0_13_\(currentlocation!.c_floor)")
            case 2:
                if(currentlocation!.c_elevator_exist == 0){
                    list[2].image = UIImage(named: "app_0_14_2")
                }else{
                    list[2].image = UIImage(named: "app_0_14_\(currentlocation!.c_elevator_exist)")
                }
            case 3:
                if(currentlocation!.c_chair_movable == 0){
                    list[3].image = UIImage(named: "app_0_15_2")
                }else{
                    list[3].image = UIImage(named: "app_0_15_\(currentlocation!.c_chair_movable)")
                }
            case 4:
                if(currentlocation!.c_toilet_available == 0){
                    list[4].image = UIImage(named: "app_0_16_2")
                }else{
                    list[4].image = UIImage(named: "app_0_16_\(currentlocation!.c_toilet_available)")
                }
            case 5:
                if(currentlocation!.c_handicapped_toilet == 0){
                    list[5].image = UIImage(named: "app_0_17_2")
                }else{
                    list[5].image = UIImage(named: "app_0_17_\(currentlocation!.c_handicapped_toilet)")
                }
            case 6:
                if(currentlocation!.c_parking_lot_exist == 0){
                    list[6].image = UIImage(named: "app_0_18_2")
                }else{
                    list[6].image = UIImage(named: "app_0_18_\(currentlocation!.c_parking_lot_exist)")
                }
            case 7:
                if(currentlocation!.c_handicapped_parking_lot == 0){
                    list[7].image = UIImage(named: "app_0_19_2")
                }else{
                    list[7].image = UIImage(named: "app_0_19_\(currentlocation!.c_handicapped_parking_lot)")
                }
            default:
                list[i].image = UIImage(named: "app_0_\(i+12)_1")
            }
        }
        
        
//        for i in 0..<list.count{
//            list[i].image = UIImage(named: "app_0_\(i+12)_1")
//        }
        
        for i in 0..<8{
            let small:UIImageView = UIImageView()
            small.frame.size = list[i].frame.size
            small.image = list[i].image
            small.frame = CGRect(x: CGFloat(i)*small.frame.size.width*1.1, y: CGFloat(0), width: small.frame.size.width, height: small.frame.size.height)
            iconscroll.addSubview(small)
        }
        
        iconscroll.contentSize = CGSize(width:12*list[0].frame.size.width, height:list[0].frame.size.height)
        iconscroll.isScrollEnabled = true
        // Do any additional setup after loading the view.
        
        
        
        centerTargetMapView()
        addExtraPictures()
    }
    
    func addExtraPictures(){
        let pictures:[String] = (self.currentlocation?.p_extra_pics)!
        let height = self.images.frame.size.height
        for i in 0..<pictures.count{
            let imageView:UIImageView = UIImageView()
            imageView.frame = CGRect(x:CGFloat(i)*height, y: CGFloat(0), width: height, height:height)
            imageView.image = UIImage(named:pictures[i])
            self.images.addSubview(imageView)
        }
        self.images.contentSize = CGSize(width:CGFloat(pictures.count)*height, height:height)
        self.images.isScrollEnabled = true
    }
    
    func centerTargetMapView(){
        //self.locationMapView = MTMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.locationMapView.daumMapApiKey = "2dd20729644a15718c16758fa84963e8"
        self.locationMapView.delegate = self
        self.locationMapView.baseMapType = .standard
        
        if(self.currentlocation?.c_barrier == 1 || self.currentlocation?.c_barrier == 2)
        {
            let item = MTMapPOIItem()
            item.itemName = self.currentlocation?.name
            item.customImageName = "c_pin"
            item.markerType = .customImage
            item.mapPoint = MTMapPoint(geoCoord: .init(latitude: (self.currentlocation?.latitude)!, longitude: (self.currentlocation?.longitude)!))
            item.showAnimationType = .noAnimation
            item.customImageAnchorPointOffset = .init(offsetX: 30, offsetY: 0)    // 마커 위치 조정
            self.locationMapView.add(item)
        } else if(self.currentlocation?.c_barrier == 3)
        {
            let item = MTMapPOIItem()
            item.itemName = self.currentlocation?.name
            item.customImageName = "w_pin"
            item.markerType = .customImage
            item.mapPoint = MTMapPoint(geoCoord: .init(latitude: (self.currentlocation?.latitude)!, longitude: (self.currentlocation?.longitude)!))
            item.showAnimationType = .noAnimation
            item.customImageAnchorPointOffset = .init(offsetX: 30, offsetY: 0)    // 마커 위치 조정
            self.locationMapView.add(item)
        }
        self.locationMapView.fitAreaToShowAllPOIItems()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    
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
