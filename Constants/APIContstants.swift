//
//  APIContstants.swift
//  SchoolSystem
//
//  Created by Chika Ohaya on 2/13/23.
//


import Foundation

enum APIConstants {
    static let baseUrl = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
}
enum HTTPScheme: String {
    case http = "http"
    case https = "https"
}
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case update = "UPDATE"
    case delete = "DELETE"
    case put = "PUT"
    }
