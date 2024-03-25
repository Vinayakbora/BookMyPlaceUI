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
    
    private var requestType: RequestType = .get
    private var httpBody: [String:Any] = [:]
    
    
    init(requestType: RequestType) {
        self.requestType = requestType
    }
    
    init(requestType: RequestType, httpBody: [String:Any]) {
        self.requestType = requestType
        self.httpBody = httpBody
    }
    
    func callNetworkMethod(for url: URL, with parameters: Codable? = nil, completionHandler: @escaping((Data?, URLResponse?, Error?) -> ())) async {
        
        switch requestType {
        case .get:
            await callGetMethod(with: url) { data, response, error in
                completionHandler(data, response, error)
            }
        default:
            callNetworkMethodWithParameters(for: url, with: parameters) { data, response, error in
                completionHandler(data, response, error)
            }
        }
    }
    
    private func callGetMethod(with url: URL, completionHandler: @escaping((Data?, URLResponse?, Error?) -> ())) async {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            completionHandler(data, response, nil)
        } catch {
            completionHandler(nil, nil, error)
        }
    }
    
    private func callNetworkMethodWithParameters(for url: URL, with parameters: Codable?, completionHandler: @escaping((Data?, URLResponse?, Error?) -> ())) {
        
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue
        guard let parameters = parameters, let data = try? JSONEncoder().encode(parameters) else {return}
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completionHandler(data, response, error)
        }
        task.resume()
    }
}


enum RequestType: String{
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
}



