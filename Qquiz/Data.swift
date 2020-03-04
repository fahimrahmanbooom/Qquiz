
import UIKit

struct Data : Codable {
	let question : String?
	let optionOne : String?
	let optionTwo : String?
	let correctanswer : String?

	enum CodingKeys: String, CodingKey {

		case question = "question"
		case optionOne = "optionOne"
		case optionTwo = "optionTwo"
		case correctanswer = "correctanswer"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		question = try values.decodeIfPresent(String.self, forKey: .question)
		optionOne = try values.decodeIfPresent(String.self, forKey: .optionOne)
		optionTwo = try values.decodeIfPresent(String.self, forKey: .optionTwo)
		correctanswer = try values.decodeIfPresent(String.self, forKey: .correctanswer)
	}
}
