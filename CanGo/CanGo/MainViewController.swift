//
//  MainViewController.swift
//  
//
//  Created by Brian Bae on 2016. 12. 31..
//
//

import UIKit

class MainViewController: UIViewController,MTMapViewDelegate, UISearchBarDelegate{
    
    lazy var mapView: MTMapView = MTMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
    
    var leftbutton:UIButton = UIButton(frame: CGRect(x: -3, y: 8, width: 66, height: 52))
    var searchbar:UISearchBar = UISearchBar(frame: CGRect(x: 63, y: 12, width: 309, height: 44))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.delegate = self
        mapView.addPOIItems([custom_item()])
        leftbutton.setImage(UIImage(named: "app_002_3_1 copy"), for: .normal)
        searchbar.placeholder = "장소검색"
        searchbar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        
//        UITextField *txfSearchField = [searchbar valueForKey:@"_searchField"];
//        [txfSearchField setBackgroundColor:[UIColor whiteColor]];
//        [txfSearchField setLeftView:UITextFieldViewModeNever];
//        [txfSearchField setBorderStyle:UITextBorderStyleRoundedRect];
//        txfSearchField.layer.borderWidth = 8.0f;
//        txfSearchField.layer.cornerRadius = 10.0f;
//        txfSearchField.layer.borderColor = [UIColor clearColor].CGColor;
        
        
        
        mapView.daumMapApiKey = "2dd20729644a15718c16758fa84963e8"
        mapView.delegate = self
        mapView.baseMapType = .standard
        self.view.addSubview(mapView)
        self.view.addSubview(leftbutton)
        self.view.addSubview(searchbar)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        Server.manager.search(place: searchBar.text!, completion: {
            result in
            print(result)
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
            
            let item = MTMapPOIItem()
            item.itemName = "asdf"
            item.customImageName = "c_pin"
            item.markerType = .customImage
            item.mapPoint = MTMapPoint(geoCoord: .init(latitude: 37.5654338, longitude: 126.976664))
            item.showAnimationType = .noAnimation
            item.customImageAnchorPointOffset = .init(offsetX: 30, offsetY: 0)    // 마커 위치 조정
            
            
            
        })
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
