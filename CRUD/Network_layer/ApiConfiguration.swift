//
//  ApiConfiguration.swift
//  CRUD
//
//  Created by belal medhat on 08/05/2021.
//

import Foundation

// MARK: -  URL Components with Protocols
protocol APIConfiguration {
    var baseURL: String { get }
    var path: String { get }
    var parameters: RequestParams { get }
    var method: HTTPMethod { get }
    var Header:[String:String] { get }
}
// MARK: - cofigure urlRequest all components body ,header ,method etc...
extension APIConfiguration {
public var urlRequest: URLRequest {
    guard let url = URL(string: baseURL) else {
    fatalError("URL could not be built")
    }
    var request = URLRequest(url: url.appendingPathComponent(path))

    
    request.httpMethod = method.rawValue
    request.allHTTPHeaderFields = Header
    print(request.allHTTPHeaderFields)
    print(request)
    switch parameters {

            case .body(let params):
                request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])

               case .url(let params):
                       let queryParams = params.map { pair  in
                           return URLQueryItem(name: pair.key, value: "\(pair.value)")
                       }
                       var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
                       components?.queryItems = queryParams
                       request.url = components?.url
                print(queryParams)
                print(components)
               case .NoParamter:
                   request.httpBody = nil

               }

                return request
    }
}
