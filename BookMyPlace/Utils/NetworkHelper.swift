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
    
        
    func callNetworkMethod(for url: URL, with parameters: Codable? = nil, requestType: RequestType, completionHandler: @escaping((Data?, URLResponse?, Error?) -> ())) async {
        callNetworkMethodWithParameters(for: url, with: parameters, requestType: requestType) { data, response, error in
            completionHandler(data, response, error)
        }
    }
    
    private func callNetworkMethodWithParameters(for url: URL, with parameters: Codable?,  requestType: RequestType, completionHandler: @escaping((Data?, URLResponse?, Error?) -> ())) {
        
        let token = UserDefaults.standard.value(forKey: "token") as? String
        
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue
        if requestType == .post {
            guard let parameters = parameters, let data = try? JSONEncoder().encode(parameters) else { return }
            request.httpBody = data
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("keep-alive", forHTTPHeaderField: "Connection")
        if token != nil && token != "" {
            request.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        }
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



