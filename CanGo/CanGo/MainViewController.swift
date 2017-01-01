//
//  MainViewController.swift
//  CanGo
//
//  Created by 이경문 on 2016. 12. 31..
//  Copyright © 2016년 Brian Bae. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,MTMapViewDelegate {

    lazy var mapView: MTMapView = MTMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))

    var search:UISearchBar = UISearchBar(frame: CGRect(x: 50, y: 50, width: 300, height: 40))

    override func viewDidLoad() {
        super.viewDidLoad()
        

        mapView.daumMapApiKey = "2dd20729644a15718c16758fa84963e8"
        mapView.delegate = self
        mapView.baseMapType = .standard
        mapView.addPOIItems([custom_item()])
        self.view.addSubview(mapView)

        /*
        search.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        search.tintColor = UIColor.gray
        self.view.addSubview(search)
        */
    }

    func default_item() -> MTMapPOIItem{
         let item = MTMapPOIItem()
         item.itemName = "asdf"
         item.markerType = .redPin
         item.markerSelectedType = .redPin
         item.mapPoint = MTMapPoint(geoCoord: .init(latitude: 37.5654338, longitude: 126.976664))
         item.showAnimationType = .noAnimation
         item.customImageAnchorPointOffset = .init(offsetX: 30, offsetY: 0)    // 마커 위치 조정
         return item
    }

    func custom_item() -> MTMapPOIItem{


        let poiItem = MTMapPOIItem()
        poiItem.itemName = "이름"
        poiItem.markerType = .customImage
        poiItem.customImageName = "app6_7"
        //poiItem.markerSelectedType = .customImage                   //선택 되었을 때 마커 타입
        //poiItem.customSelectedImage = UIImage(named: "app6_6")    //선택 되었을 때 마커 이미지 지정
        poiItem.mapPoint = MTMapPoint(geoCoord: .init(latitude: 37.5654338, longitude: 126.976664))
        poiItem.showAnimationType = .noAnimation
        poiItem.customImageAnchorPointOffset = .init(offsetX: 0, offsetY: 0)
        
        return poiItem
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
