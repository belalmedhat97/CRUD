//
//  UpdateResponse.swift
//  CRUD
//
//  Created by belal medhat on 09/05/2021.
//

import Foundation
struct UpdateSuccessResponse:Codable {
    var updatedAt:String?
}
struct UpdateFailureResponse:Codable {

    var code:Int?
    var error:String?
  }
