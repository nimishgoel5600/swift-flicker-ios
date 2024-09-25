//
//  Flickr.swift
//  Test Demo
//
//

import Foundation

struct Media: Decodable {
    let m: URL
}

struct FlickerItem: Decodable, Identifiable {
    var id = UUID() // Adding an id for Identifiable protocol
    let title: String
    let link: URL
    let media: Media
    let date_taken: String
    let description: String
    let published: String
    let author: String
    let author_id: String
    let tags: String
    enum CodingKeys: String, CodingKey {
        case title
        case link
        case media
        case date_taken
        case description
        case published
        case author
        case author_id
        case tags
    }
}

struct FlickrResponse: Decodable {
    let title: String
    let link: URL
    let description: String
    let modified: String
    let generator: URL
    let items: [FlickerItem]
}
/*{
  "title": "Uploads from everyone",
  "link": "https://www.flickr.com/photos/",
  "description": "",
  "modified": "2024-07-04T14:11:47Z",
  "generator": "https://www.flickr.com",
  "items": [
    {
      "title": "Reacher",
      "link": "https://www.flickr.com/photos/_bubby_/53833805202/",
      "media": {
        "m": "https://live.staticflickr.com/65535/53833805202_f0e201313a_m.jpg"
      },
      "date_taken": "2024-07-03T19:20:07-08:00",
      "description": "",
      "published": "2024-07-04T14:11:47Z",
      "author": "",
      "author_id": "12198857@N00",
      "tags": ""
    }
}
*/
