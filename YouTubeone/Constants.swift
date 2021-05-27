//
//  Constants.swift
//  YouTubeone
//
//  Created by MAZHAR SHAIK on 26/05/21.
//

import Foundation


struct Constants {
    
    static var API_KEY = "AIzaSyDihjnamMoHL8-2DPN_GAE-tpZj4UL7N60"
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL =   "https://youtube.googleapis.com/youtube/v3/playlistItems?part=Snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}

