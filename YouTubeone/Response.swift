//
//  Response.swift
//  YouTubeone
//
//  Created by MAZHAR SHAIK on 27/05/21.
//

import Foundation

struct Response:Decodable {
    var items:[Video]?
    
    enum Codkingkeys: String,CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: Codkingkeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
