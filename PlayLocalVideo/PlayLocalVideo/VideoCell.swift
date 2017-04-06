//
//  videoCell.swift
//  PlayLocalVideo
//
//  Created by 刘梦迪 on 2017/4/6.
//  Copyright © 2017年 mengdi. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let title: String
    let source: String
}

class VideoCell: UITableViewCell {
    
    @IBOutlet weak var videoScreenshot: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoSourceLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBAction func playBtnClicked(_ sender: UIButton) {
        
        
    }
}
