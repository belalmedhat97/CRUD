//
//  Constant.swift
//  CRUD
//
//  Created by belal medhat on 08/05/2021.
//

import Foundation

struct Endpoints {
static let baseURL = "https://parseapi.back4app.com/classes/CRUD_OPERATION"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case YourParseApplicationID = "X-Parse-Application-Id"
    case XParseRESTAPIKey = "X-Parse-REST-API-Key"
    
}
enum AppData :String {
    case YourParseApplicationID = "iiizG725sScJI1BYTn12RzFtcpDqP1sj9BdpLoQz"
    case XParseRESTAPIKey = "f9gg3kDDX0CUrvMt3dX2Gf7whxm91OIrhSOXyZn0"
}

enum ContentType: String {
    case json = "Application/json"
    case formEncode = "application/x-www-form-urlencoded"
}

enum RequestParams {
    case body(_:[String:Any])
    case url(_:[String:Any])
    case NoParamter
}
// Using this custom results to decode when error json came ,cause it has different reponse body different from success
enum CustomResults<T,E,Error>{

    case success(T)
    case failure(E)
    case failureError(Error)
}
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    // implement more when needed: post, put, delete, patch, etc.
}
