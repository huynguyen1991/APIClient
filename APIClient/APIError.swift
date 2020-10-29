import Foundation
import Alamofire
/// Dumb error to model simple errors
/// In a real implementation this should be more exhaustive
public enum APIError: Error {
    case server(status: Int?, message: String?)
    case http(error: AFError)
}
