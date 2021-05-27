//
//  VideoTableViewCell.swift
//  YouTubeone
//
//  Created by MAZHAR SHAIK on 27/05/21.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        self.video = v
        
        guard self.video != nil else {
            return
        }
        // set the title
        
        self.titleLabel.text = video?.title
          
        // set date label
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // set the Thumbnail
        
        guard self.video!.thumbnail != "" else {
            return
        }
        // Check cache before downloading data
        
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail){
            // Set the Thumbnail imageview
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        //Download the  thumbnail data
    
        let url = URL(string: self.video!.thumbnail)
        
        // Get the Shared  URL Session object
        
        let session = URLSession.shared
        
        // create a data Task
        
        let datatask = session.dataTask(with: url!) { data, response, error in
            
            if error == nil && data != nil{
                
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data!)
                
                // Check that the downloaded url matches the video thumbnail url that this cell is Currently set to display.
                
                if url!.absoluteString != self.video?.thumbnail{
                    // video cycle has been recycled for another video and no longer matches the thumbnail that was download.
                    return
                }
                
                // Create the image object
                
                let image = UIImage(data: data!)
                
                // set the imagevView
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        // start DataTask
        datatask.resume()
    }

}
