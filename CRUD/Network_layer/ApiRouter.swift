//
//  ApiRouter.swift
//  CRUD
//
//  Created by belal medhat on 08/05/2021.
//

import Foundation
enum CrudAPIRouter: APIConfiguration {
  
    // MARK: - CRUD Cases
    case Create(ID:Int,Name:String) // indicate Create operation
    case Read(ID:Int) // indicate Read operation
    case Update(Name:String) // indicate Update operation
    case Delete // indicate Delete operation
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .Create:
            return .post
        case .Read:
            return .get
        case .Update:
            return .put
        case .Delete:
            return .delete
        }
    }
    
    // MARK: - Headers
    var Header: [String : String] {
        [HTTPHeaderField.YourParseApplicationID.rawValue:AppData.YourParseApplicationID.rawValue,HTTPHeaderField.XParseRESTAPIKey.rawValue:AppData.XParseRESTAPIKey.rawValue,
         HTTPHeaderField.contentType.rawValue:ContentType.json.rawValue]

        
          
      }
    
    
    
    // MARK: - Parameters
     var parameters: RequestParams {
        switch self {
        case .Create(let ID,let Name):
            return .body(["ID":ID,"Name":Name])
        case .Read(let ID):
            return .url(["where":#"{"ID":\#(ID)}"#])
        case .Update(let Name):
            return .body(["Name":Name])
        case .Delete:
            return .NoParamter
        }
    }
    // MARK: - Base URL 
    var baseURL: String {
        return "https://parseapi.back4app.com/classes/CRUD_OPERATION"
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .Update,.Delete:
            return "\(UserDefaults.standard.string(forKey: "objectId") ?? "")" // ## used One
        case .Create(_,_),.Read(_):
            return ""
        }
    }
}
    
