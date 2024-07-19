//
//  NetworkingManager.swift
//
//
//  Created by William von Arend on 01/07/2024.
//

import Combine
import Foundation

class NetworkingManager: NetworkingManagerProtocol {
    
    static func download(url: URL) -> AnyPublisher<Data, Error> { // By making it static we don't need to initialise the class. We can just call `NetworkingManager.download`
        return URLSession.shared.dataTaskPublisher(for: url) // 3- Get the data from the URL
            .subscribe(on:DispatchQueue.global(qos: .default)) // Download data in a different thread, not on the main thread
            .tryMap({ try handleURLResponse(output: $0, url: url) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher() // Lets us simplify the return type to `AnyPublisher<Data, Error>`
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse, // 4- Check it receives a valid response
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription) // 6- If there's an error it will print it out
        }
    }
}

enum NetworkingError: LocalizedError {
    case badURLResponse(url: URL)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .badURLResponse(url: let url): "Bad response from URL: \(url)"
        case .unknown: "Unknown error occured"
        }
    }
}
