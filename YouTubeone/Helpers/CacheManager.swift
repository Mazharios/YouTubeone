//
//  CacheManager.swift
//  YouTubeone
//
//  Created by MAZHAR SHAIK on 27/05/21.
//

import Foundation

class CacheManager {
    static var cache = [String:Data]()
    static func setVideoCache(_ url:String, _ data:Data?){
        // Store the image data and use the url as the key
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data?{
        // try to get the date for the specifed url
        return cache[url]
    }
}
