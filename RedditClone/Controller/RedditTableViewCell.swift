//
//  RedditTableViewCell.swift
//  RedditClone
//
//  Created by Türker on 12.10.2021.
//

import UIKit

class RedditTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titlePost: UILabel!
    @IBOutlet private weak var authorName: UILabel!
    @IBOutlet private weak var thumbnail: UIImageView!
    @IBOutlet private weak var selfText: UILabel!
    @IBOutlet private weak var selftextView: UIView!
    @IBOutlet private weak var topicLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selftextView.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureTableViewOutlets(with model: Results) {
        selftextView.isHidden = model.dataReddit.thumbnail == "self" ? false : true
        titlePost.text = model.dataReddit.title
        authorName.text = "by r/\(model.dataReddit.authorName ?? "")"
        thumbnail.fetchImage(from: "\(model.dataReddit.thumbnail ?? "")")
        selfText.text = model.dataReddit.selftext
        topicLabel.text = "r/\(model.dataReddit.subreddit ?? "")"
        descriptionLabel.text = model.dataReddit.allAwardings.first?.descriptionModel ?? ""
    }
}
