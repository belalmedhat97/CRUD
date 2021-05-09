//
//  DeleteResponse.swift
//  CRUD
//
//  Created by belal medhat on 09/05/2021.
//

import Foundation
struct DeleteSuccessResponse:Codable {
    
}
struct DeleteFailureResponse:Codable {
   
    var code:Int?
    var error:String?
}
