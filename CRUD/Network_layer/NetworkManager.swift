//
//  NetworkManager.swift
//  CRUD
//
//  Created by belal medhat on 08/05/2021.
//

import Foundation

//  Use Generics to Accept any Paramters and decode it
class Network{
    static func Request<T:Codable,E:Codable>(URL:URLRequest, completion: @escaping (CustomResults<T,E,Error>) -> Void){
        
        let session = URLSession(configuration: .default)
        
        let RequesterTask = session.dataTask(with: URL) { (data, response, error) in
            guard error == nil else {return}
            if let HTTPResponse = response as? HTTPURLResponse {
                
                switch HTTPResponse.statusCode {
                case 200..<300: // indicate in case of request success response
                    if let URLData = data {
                    do {
                    let ResponseResult = try JSONDecoder().decode(T.self, from: URLData)
                        completion(.success(ResponseResult))
                    }catch{
                        completion(.failureError(error))
                    }
                    }
                case 400...500:  // indicate in case of request failure response
                    if let URLDataError = data {
                        do{
                    let ErrorResponseResult = try JSONDecoder().decode(E.self, from: URLDataError)
                        completion(.failure(ErrorResponseResult))
                    }catch{
                        completion(.failureError(error))
                    
                }
            }
                default:
                    print("")
                }
          
        }
        }
        RequesterTask.resume()
    }
    
}
