//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Cansu Özdizlekli on 4/20/23.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
