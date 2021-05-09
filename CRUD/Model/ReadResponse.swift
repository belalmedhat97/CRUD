//
//  ReadResponse.swift
//  CRUD
//
//  Created by belal medhat on 09/05/2021.
//

import Foundation
struct ReadSuccessResponse:Codable {
  
  var results: [ObjectResult]
    
}
struct ObjectResult:Codable {
    var objectId:String?
    var ID:Int?
    var Name:String?
    var createdAt:String?
    var updatedAt:String?
}
    
struct ReadFailureResponse:Codable {

    var code:Int?
    var error:String?
  }

    
    
