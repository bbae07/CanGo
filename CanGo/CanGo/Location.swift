//
//  Location.swift
//  CanGo
//
//  Created by Brian Bae on 2017. 1. 1..
//  Copyright © 2017년 Brian Bae. All rights reserved.
//

import Foundation

class Location{
    
    var id:Int = 0
    var category:String = ""
    var created_at:String = ""
    var comment:[String] = []
    var user:String = ""
    var name:String = ""
    var address:String = ""
    var address_new:String = ""
    var phone_number:String = ""
    var latitude:Double = 0
    var longitude:Double = 0
    var c_barrier:Int = 0
    var c_floor:Int = 0
    var c_elevator_exist:Int = 0
    var c_elevator_capacity:Int = 0
    var c_chair_movable:Int = 0
    var c_toilet_available:Int = 0
    var c_handicapped_toilet:Int = 0
    var c_parking_lot_exist:Int = 0
    var c_handicapped_parking_lot:Int = 0
    var extra_info:String = ""
    var p_entrance:String = ""
    var p_interior:String = ""
    var p_extra_pic1:String = ""
    var p_extra_pic2:String = ""
    var p_extra_pic3:String = ""
    
    var p_extra_pic4:String = ""
    var p_extra_pic5:String = ""
    
    init(info:NSDictionary){
        id = info["id"] as! Int
        if let category_temp:String = info["category"] as? String{
            category = category_temp
        }
        created_at = info["created_at"] as! String
        comment = info["comment"] as! [String]
        user = info["user"] as! String
        address = info["address"] as! String
        address_new = info["address_new"] as! String
        phone_number = info["phone_number"] as! String
        latitude = Double(info["latitude"] as! String)!
        longitude = Double(info["longitude"] as! String)!
        c_barrier = info["c_barrier"] as! Int
        c_floor = info["c_floor"] as! Int
        c_elevator_exist = info["c_elevator_exist"] as! Int
        c_elevator_capacity = info["c_elevator_capacity"] as! Int
        c_chair_movable = info["c_chair_movable"] as! Int
        c_toilet_available = info["c_toilet_available"] as! Int
        c_handicapped_toilet = info["c_handicapped_toilet"] as! Int
        c_parking_lot_exist = info["c_parking_lot_exist"] as! Int
        c_handicapped_parking_lot = info["c_handicapped_parking_lot"] as! Int
        if let extra_info_temp:String = info["extra_info"] as? String{
            extra_info = extra_info_temp
        }
        p_entrance = info["p_entrance"] as! String
        p_interior = info["p_interior"] as! String
        p_extra_pic1 = info["p_extra_pic1"] as! String
        p_extra_pic2 = info["p_extra_pic2"] as! String
        p_extra_pic3 = info["p_extra_pic3"] as! String
        p_extra_pic4 = info["p_extra_pic4"] as! String
        p_extra_pic5 = info["p_extra_pic5"] as! String
    }
    
    
}
