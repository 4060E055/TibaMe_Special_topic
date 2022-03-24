//
//  VideoTableViewCell.swift
//  4060E055-VideoPoayer(6)
//
//  Created by guest1 on 2018/12/5.
//  Copyright © 2018年 Animal. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var videoImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setRoundedView(videoImage)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setRoundedView(_ roundedView:UIView){
        let saveCenter = roundedView.center
        
        
        let newFrame:CGRect = CGRect(origin: CGPoint(x: roundedView.frame.origin.x,y: roundedView.frame.origin.y),  size: CGSize(width: roundedView.frame.size.width, height: roundedView.frame.size.height))
        
        roundedView.layer.cornerRadius = roundedView.frame.height/2
        roundedView.frame = newFrame
        roundedView.center = saveCenter
        roundedView.clipsToBounds = true
        
    }
    
}
