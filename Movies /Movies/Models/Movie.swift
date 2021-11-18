

import Foundation
struct Movie: Codable {
	let voteAverage: Double?
	let overview: String?
	let releaseDate: String?
	let adult: Bool?
	let backdropPath: String?
	let voteCount: Int?
	let genreIds: [Int]?
	let id: Int?
	let originalLanguage: String?
	let originalTitle: String?
	let posterPath: String?
	let title: String?
	let video: Bool?
	let popularity: Double?
	let mediaType: String?
    let name: String?

	enum CodingKeys: String, CodingKey {

		case voteAverage = "vote_average"
		case overview = "overview"
		case releaseDate = "release_date"
		case adult = "adult"
		case backdropPath = "backdrop_path"
		case voteCount = "vote_count"
		case genreIds = "genre_ids"
		case id = "id"
		case originalLanguage = "original_language"
		case originalTitle = "original_title"
		case posterPath = "poster_path"
		case title = "title"
		case video = "video"
		case popularity = "popularity"
		case mediaType = "media_type"
        case name = "name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        voteAverage = try values.decodeIfPresent(Double.self, forKey: .voteAverage)
		overview = try values.decodeIfPresent(String.self, forKey: .overview)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
		adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
		backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
        genreIds = try values.decodeIfPresent([Int].self, forKey: .genreIds)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
        originalLanguage = try values.decodeIfPresent(String.self, forKey: .originalLanguage)
        originalTitle = try values.decodeIfPresent(String.self, forKey: .originalTitle)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		video = try values.decodeIfPresent(Bool.self, forKey: .video)
		popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        mediaType = try values.decodeIfPresent(String.self, forKey: .mediaType)
        name = try values.decodeIfPresent(String.self, forKey: .name)
	}

}
