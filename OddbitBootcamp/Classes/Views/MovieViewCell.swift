//
//  MovieViewCell.swift
//  OddbitBootcamp
//
//  Created by Tugus Jonas on 3/9/17.
//  Copyright © 2017 AXDIOSDeveloper. All rights reserved.
//

import UIKit

class MovieViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImageView: UIImageView! {
        didSet{
            movieImageView.image = UIImage(named: "image")
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
}
