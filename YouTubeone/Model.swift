//
//  Model.swift
//  YouTubeone
//
//  Created by MAZHAR SHAIK on 26/05/21.
//

import Foundation

class Model {
    func getVideos() {
        let url =  URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check Error
            
            if error != nil || data == nil{
                return
            }
            //Parsing the data into video objects
            do{
            let decoder  = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            }catch{
                print(error)
            }
            
    }
        dataTask.resume()
    }
}
