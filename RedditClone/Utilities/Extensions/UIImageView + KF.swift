//
//  UIImageView + KF.swift
//  RedditClone
//
//  Created by Türker on 12.10.2021.
//

import Foundation
import Kingfisher

extension UIImageView {
    func fetchImage(from urlString: String) {
        if let url = URL(string: urlString) {
            self.kf.setImage(with: url)
        }
    }
}
