//
//  VideoDetaTableViewController.swift
//  4060E055-VideoPoayer(6)
//
//  Created by guest1 on 2018/12/5.
//  Copyright © 2018年 Animal. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
class VideoDetaViewController: UIViewController {

    @IBOutlet weak var videoImage: UIImageView!
    
    @IBOutlet weak var VideoLable: UILabel!
    
    var player = AVPlayer()
    var playItem: AVPlayerItem?
    var playerController = AVPlayerViewController()
    
    var videoItem = [String:String]()
    var videoPreview: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoImage.image = videoPreview
        VideoLable.text = videoItem["content"]
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func playVideo(_ sender: UIButton){
        DispatchQueue.main.async {
            let videoPath = Bundle.main.path(forResource: self.videoItem["imageName"], ofType: "mp4")
            let videoURL = URL(fileURLWithPath: videoPath!)
            
            self.playItem = AVPlayerItem(url: videoURL)
            self.player = AVPlayer(playerItem: self.playItem)
            self.playerController.player = self.player
            self.present(self.playerController, animated:  false){() -> Void in
                self.playerController.player?.play()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
