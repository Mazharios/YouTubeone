//
//  Video.swift
//  YouTubeone
//
//  Created by MAZHAR SHAIK on 26/05/21.
//

import Foundation

struct Video: Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys:String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //parse Title
        
        title = try snippetContainer.decode(String.self, forKey: .title)
        
        //parse description
        
        description =  try snippetContainer.decode(String.self, forKey: .description)
        
        //Parse Publish date
        
        published =  try snippetContainer.decode(Date.self, forKey: .published)
        
        //Parse Thumbnail
        
       let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
         let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //Parse VideoId
        
       let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        videoId  = try resourceIdContainer.decode(String.self, forKey:.videoId)
    }
}
