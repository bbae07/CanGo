//
//  MainViewController.swift
//  
//
//  Created by Brian Bae on 2016. 12. 31..
//
//

import UIKit

class MainViewController: UIViewController,MTMapViewDelegate {
    
    lazy var mapView: MTMapView = MTMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
    
    var leftbutton:UIButton = UIButton(frame: CGRect(x: -3, y: 8, width: 66, height: 52))
    var searchbar:UISearchBar = UISearchBar(frame: CGRect(x: 63, y: 12, width: 309, height: 44))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
