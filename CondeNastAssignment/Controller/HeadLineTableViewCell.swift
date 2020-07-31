//
//  HeadLineTableViewCell.swift
//  Byju'sAssignment
//
//  Created by Jitendra Kumar Agarwal on 25/07/19.
//  Copyright © 2019 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit
import SDWebImage
class HeadLineTableViewCell: BaseTableViewCell {

    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var labelHeader: UILabel!
    @IBOutlet weak var imgNewsImage: UIImageView!
    @IBOutlet weak var labelNewsDate: UILabel!
    @IBOutlet weak var labelNewsID: UILabel!
    @IBOutlet weak var labelNewTitle: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBg.layer.cornerRadius = 6.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    override var datasource: AnyObject? {
        didSet {
            
            guard datasource != nil else {
                return
            }
             let data =  datasource as! NewsHeadLines
            self.labelNewTitle.text =  (String.isSafeString(data.newsTitle as AnyObject?)) ? data.newsTitle : ""
            self.labelNewsID.text =  (String.isSafeString(data.name as AnyObject?)) ? data.name : ""
            self.labelNewsDate.text =  (String.isSafeString(data.newsData as AnyObject?)) ? Date().getFormattedDate(data.newsData!) : ""
            if let imageNewUrl = data.newsImage  {
                self.imgNewsImage.sd_setImage(with: URL(string: imageNewUrl), placeholderImage: UIImage(named: "news-default"))
            }
        
         }
    }
    
}
