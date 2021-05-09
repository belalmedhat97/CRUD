//
//  CRUDResponse.swift
//  CRUD
//
//  Created by belal medhat on 09/05/2021.
//

import Foundation
struct CreateSuccessResponse:Codable{
  
    var objectId:String?
    var createdAt:String?
    
}
struct CreateFailureResponse:Codable {
    
    var code:Int?
    var error:String?
  }

