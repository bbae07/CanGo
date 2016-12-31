//
//  Server.swift
//  CanGo
//
//  Created by Brian Bae on 2016. 12. 31..
//  Copyright © 2016년 Brian Bae. All rights reserved.
//

import Foundation
import Alamofire


class Server{
    static let manager = Server()
    
    func login(email: String, pwd: String, completion: @escaping (NSDictionary) -> Void){
        let param:Parameters = ["email":email,"password":pwd]
        Alamofire.request("http://169.56.70.181/auth/login/", method: .post, parameters: param, encoding: URLEncoding.default).responseJSON { response in

                if let result = (response.result.value as! NSDictionary)["auth_token"]{
                    //로그인성공
                    UserDefaults.standard.set(result, forKey: "token")
                    UserDefaults.standard.synchronize()
                    completion(["result": true])
                }else{
                    //로그인실패
                    completion(["result": false])
                }
        }
    }
}
