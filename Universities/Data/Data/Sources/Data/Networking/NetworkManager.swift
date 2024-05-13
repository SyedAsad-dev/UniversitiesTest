//
//  NetworkManager.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//


import Foundation
import Protocols
import Utils
/// The request method you like to use
enum HttpMethod: String {
    case get
    var method: String { rawValue.uppercased() }
}

/// This is our network class, it will handle all our requests
extension Fetchable {

    /// Request data from an endpoint
    /// - Parameters:
    ///   - url: the URL
    ///   - httpMethod: The HTTP Method to use, either get or post in this case
    ///   - completion: The completion closure, returning a Result of either the generic type or an error
    func fetch<T: Decodable>(fromURL url: URLRequest, completion: @escaping ((Result<T, NetworkError>) -> Void)) {

        // Because URLSession returns on the queue it creates for the request, we need to make sure we return on one and the same queue.
        // You can do this by either create a queue in your class (NetworkManager) which you return on, or return on the main queue.
        let completionOnMain: (Result<T, NetworkError>) -> Void = { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }

        // Create the request. On the request you can define if it is a GET or POST request, add body and more.
//        var request = URLRequest(url: url)
//        request.httpMethod = httpMethod.method

        let urlSession = URLSession.shared.dataTask(with: url) { data, response, error in
            // First check if we got an error, if so we are not interested in the response or data.
            // Remember, and 404, 500, 501 http error code does not result in an error in URLSession, it
            // will only return an error here in case of e.g. Network timeout.
            if let error = error {
                completionOnMain(.failure(.badRequest(error.localizedDescription)))
                return
            }

            // Lets check the status code, we are only interested in results between 200 and 300 in statuscode. If the statuscode is anything
            // else we want to return the error with the statuscode that was returned. In this case, we do not care about the data.
            guard let urlResponse = response as? HTTPURLResponse else { return completionOnMain(.failure(.invalidResponse)) }
            if !(200..<300).contains(urlResponse.statusCode) {
                return completionOnMain(.failure(.invalidStatusCode(urlResponse.statusCode)))
            }

            // Now that all our prerequisites are fullfilled, we can take our data and try to translate it to our generic type of T.
            guard let data = data else { return }
           
            do {
                let users: T = try JSONDecoder().decode(T.self, from: data)
                completionOnMain(.success(users))
            } catch  {
                completionOnMain(.failure(.failedToParseData))
            }
        }

        // Start the request
        urlSession.resume()
    }
}


