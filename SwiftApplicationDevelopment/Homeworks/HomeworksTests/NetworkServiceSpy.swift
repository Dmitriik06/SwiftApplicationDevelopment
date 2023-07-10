//
//  NetworkServiceSpy.swift
//  HomeworksTests
//
//  Created by Дмитрий Кузнецов on 10.07.2023.
//

import Foundation

@testable import Homeworks

class NetworkServiceSpy: NetworkServiceProtocol {
    
    private(set) var isNetworkServiceCalled: Bool = false
    
    func getAuthorizeRequest() -> URLRequest {
        isNetworkServiceCalled = true
        return URLRequest(url: URL(string: "/blank.html")!)
    }
    
}
