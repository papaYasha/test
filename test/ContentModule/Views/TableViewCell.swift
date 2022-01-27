//
//  TableViewCell.swift
//  test
//
//  Created by Macbook on 27.01.22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    var indexPath: IndexPath?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        indexPath = nil
        iconImageView.image = UIImage(named: K.imageName)
    }
}
