//
//  NetworkHelper.swift
//  BookMyPlace
//
//  Created by Akash Gurnale2 on 24/03/24.
//

import Foundation

enum NetworkError: Error {
    case invalidParameters
}


class NetworkHelper {
    
    static let baseUrl = "http://127.0.0.1:8081/api/v1/"
        
    func callNetworkMethod(for url: URL, with parameters: Codable? = nil, requestType: RequestType, completionHandler: @escaping((Data?, URLResponse?, Error?) -> ())) async {
        callNetworkMethodWithParameters(for: url, with: parameters, requestType: requestType) { data, response, error in
            completionHandler(data, response, error)
        }
    }
    
    private func callNetworkMethodWithParameters(for url: URL, with parameters: Codable?,  requestType: RequestType, completionHandler: @escaping((Data?, URLResponse?, Error?) -> ())) {
        
        let token = UserDefaults.standard.value(forKey: "token") as? String
        
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue
        if requestType == .post || requestType == .put {
            guard let parameters = parameters, let data = try? JSONEncoder().encode(parameters) else { return }
            request.httpBody = data
            print(data)
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("keep-alive", forHTTPHeaderField: "Connection")
        request.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwYXJhZ180MiIsImlhdCI6MTcxMTk0MzA1MiwiZXhwIjoxNzExOTQ2NjUyfQ.g8IFpKTgh97H3y3FO8Edx7jwYophQTEDdH_XqEG2A-0", forHTTPHeaderField: "Authorization")
//        if token != nil && token != "" {
//            request.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwYXJhZ180MiIsImlhdCI6MTcxMTk0MzA1MiwiZXhwIjoxNzExOTQ2NjUyfQ.g8IFpKTgh97H3y3FO8Edx7jwYophQTEDdH_XqEG2A-0", forHTTPHeaderField: "Authorization")
//        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completionHandler(data, response, error)
        }
        print(request)
        task.resume()
    }
    
}


enum RequestType: String{
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
}



