//
//  ViewController.swift
//  YouTubeone
//
//  Created by MAZHAR SHAIK on 26/05/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ModelDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        model.getVideos()
    }
    //MARK: -Model Delegate Methods
    func videosFetched(_ videos: [Video]) {
        // set the returned videos to our video Property
        
        self.videos = videos
        
        // Refresh TableView
        
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEO_CELL, for: indexPath) as! VideoTableViewCell
        
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
   

}

