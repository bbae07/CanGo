//
//  Server.swift
//  CanGo
//
//  Created by 이경문 on 2016. 12. 31..
//  Copyright © 2016년 Brian Bae. All rights reserved.
//

import Foundation
import Alamofire


class Server{

    static let manager = Server()

    func login(email:String, pwd:String, completion:@escaping (NSDictionary) -> Void){

        var param:Parameters = ["email":email,"password":pwd]
        //Alamofire.request("http://169.56.70.181/auth/login/", method: .post, parameters: param, encoding: .encodingDefaultJSON, headers: <#T##HTTPHeaders?#>)
        Alamofire.request("http://169.56.70.181/auth/login/", method: .post, parameters:param, encoding:URLEncoding.default).responseJSON { response in

            //<ANY>
            //response.result.value
            if let auth_token = (response.result.value as! NSDictionary)["auth_token"]{
                print("success \(auth_token)")
            }else{
                print("failure")
            }
            completion(["result":true])
        }
    }

}
