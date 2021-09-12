//
//  ServiceManager.swift
//  MVVM_SwiftUI
//
//  Created by MANOJ SOLANKI on 12/09/21.
//

import Foundation

enum HTTPError : Error{
    case requestTimeOut
    case jsonError
    case networkError
}

enum ServiceResponse<T,error:Error> {
    case success(T)
    case failure(error)
}

class ServiceManager {
    
    private var dataTask : URLSessionDataTask?
    
    func requestServer(
        requestURL: String,
        withParameters: [AnyHashable:Any]?,
        
        addCompletion complitionsBlock :
            
            //Function type named as complitionsBlock that takes service response as a parameter of type ServiceResponse<Data,HTTPError> and returns void
            
            @escaping (_ serviceResponse: ServiceResponse<Data,HTTPError>) -> Void
        
    ) {
        
        var urlRequest = URLRequest(url: URL(string: (requestURL))!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        dataTask = session.dataTask(with: urlRequest as URLRequest) { (data, response, error) -> Void  in
            if error != nil{
                complitionsBlock(.failure(.networkError))
            }else
            {
                if data != nil{
                    complitionsBlock(.success(data!))
                }else{
                    complitionsBlock(.failure(.jsonError))
                }
            }
        }
        dataTask!.resume()
    }
}
