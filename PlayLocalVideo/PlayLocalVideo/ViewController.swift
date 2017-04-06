//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by 刘梦迪 on 2017/4/6.
//  Copyright © 2017年 mengdi. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var videoTableView: UITableView!
    
    lazy var playViewController = AVPlayerViewController()
    lazy var playerView = AVPlayer()
    
    
    var data = [
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func playVideo(_ sender:UIButton!) {
        
        let Index = sender.tag - 1000
        let videoSource = data[Index]
        print(videoSource.source)
        
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        playViewController.player = playerView
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for:indexPath) as! VideoCell
        let videoItem = data[indexPath.row]
        
        cell.videoScreenshot.image = UIImage(named: videoItem.image)
        cell.videoTitleLabel.text = videoItem.title
        cell.videoSourceLabel.text = videoItem.source
        cell.playBtn.tag = 1000 + indexPath.row
        cell.playBtn.addTarget(self, action: #selector(playVideo), for: UIControlEvents.touchUpInside)
        
        return cell
    }
    
}

