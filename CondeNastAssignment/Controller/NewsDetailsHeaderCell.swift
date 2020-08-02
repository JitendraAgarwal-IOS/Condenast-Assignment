//
//  NewsDetailsHeaderCell.swift
//  CondeNastAssignment
//
//  Created by Jitendra Kumar Agarwal on 3/08/19.
//  Copyright © 2019 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class NewsDetailsHeaderCell: BaseTableViewCell {
    
    @IBOutlet weak var labelHeader: UILabel!
    @IBOutlet weak var imgNewsImage: UIImageView!
    @IBOutlet weak var labelNewsDate: UILabel!
    @IBOutlet weak var labelNewsID: UILabel!
    @IBOutlet weak var labelNewDetails: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override var datasource: AnyObject? {
        didSet {
            
            guard datasource != nil else {
                return
            }
            let data =  datasource as! Articles
                    self.labelHeader.text =  (String.isSafeString(data.title as AnyObject?)) ? data.title : ""
                    self.labelNewsID.text =  (String.isSafeString(data.source?.name as AnyObject?)) ? data.source?.name: ""
                    self.labelNewDetails.text =  (String.isSafeString(data.description as AnyObject?)) ? data.description: ""
                      self.labelNewsDate.text =  (String.isSafeString(data.publishedAt as AnyObject?)) ? Date().getFormattedDate(data.publishedAt!) : ""
                      if let imageNewUrl = data.urlToImage  {
                          self.imgNewsImage.sd_setImage(with: URL(string: imageNewUrl), placeholderImage: UIImage(named: "news-default"))
                      }
                  
                   }

            
        }
    }

