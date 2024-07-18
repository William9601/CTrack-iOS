//
//  File.swift
//  
//
//  Created by William von Arend on 17/07/2024.
//

import Foundation
import Combine

public protocol NetworkingManagerProtocol {
    static func download(url: URL) -> AnyPublisher<Data, Error>
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data
    
    static func handleCompletion(completion: Subscribers.Completion<Error>)
}
