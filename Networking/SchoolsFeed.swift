import Foundation
import SwiftUI

enum StatusCodes: Error {
    case success
    case failure
    case invalidURL
    case invalidResponse
    case decodingError
    var localizedDescription: String {
        switch self {
        case .success:
            return "Success"
        case .failure:
            return "Failure"
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response from the server"
        case .decodingError:
            return "Error in decoding the data"
        }
    }
}

    // The  StatusCodes enum now has a more comprehensive list of possible errors that can be thrown, including additional HTTP status codes and a custom error description. IF I had more time I will create views to return the error if there is an internal server using response codes like 500





protocol FetchAPI {
    func getAllSchools() async throws -> [SchoolsDataModel]
    func handleNoInternetConnection()
}

class NetworkManager: FetchAPI, ObservableObject {
    func getAllSchools() async throws -> [SchoolsDataModel] {
        guard let url = URL(string: APIConstants.baseUrl) else {
            throw StatusCodes.invalidURL
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw StatusCodes.invalidResponse
        }
        
        do {
            let schools = try JSONDecoder().decode([SchoolsDataModel].self, from: data)
            return schools
        } catch {
            throw StatusCodes.decodingError
        }
    }
    
    func handleNoInternetConnection() {
        print("No internet connection")
        // Show an alert or a message to the user indicating that there is no internet connection if I had more time I would show an alert for no internet connection
    }
}
