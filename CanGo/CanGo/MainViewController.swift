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

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.daumMapApiKey = "2dd20729644a15718c16758fa84963e8"
        mapView.delegate = self
        mapView.baseMapType = .standard
        self.view.addSubview(mapView)
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
