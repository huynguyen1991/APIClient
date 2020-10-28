import Foundation

/// Top level response for every request to the Marvel API
/// Everything in the API seems to be optional, so we cannot rely on having values here
public struct APIResponse<Response: Decodable>: Decodable {
	/// Whether it was ok or not
	public let code: Int?
	/// Message that usually gives more information about some error
	public let message: String?
	/// Requested data
	public let data: Response?
}
