//
//  ViewController.swift
//  YouTubeone
//
//  Created by MAZHAR SHAIK on 26/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideos()
    }


}

