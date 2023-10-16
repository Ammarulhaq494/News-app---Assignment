//
//  newsCell.swift
//  News App - Avrioc Assignment
//
//  Created by Ammar Ul Haq on 14/10/2023.
//

import UIKit

class newsCell: UITableViewCell {
    @IBOutlet weak var imgBanner: UIImageView!
    
    @IBOutlet weak var lblHeadline: UILabel!
    @IBOutlet weak var lblAuthorName: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!

    var news: Artical?
    {
        didSet
        {
            productDetailConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imgBanner.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailConfiguration()
    {
        guard let news else { return }
        lblHeadline.text = news.title
        lblAuthorName.text = news.byline
        lblDate.text = news.published_date
        imgBanner.setImage(with: news.media![0].mediaMetaData![2].url!)
        self.selectionStyle = .none
        
    }

}
