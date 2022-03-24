//
//  SongTableViewCell.swift
//  4060E055-Music
//
//  Created by guest1 on 2018/10/31.
//  Copyright © 2018年 dreamplatz. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //printLog(self, funcName: #function, logString: "")
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
