//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Cansu Özdizlekli on 4/20/23.
//

import UIKit
import SDWebImage

class CharacterTableViewCell: UITableViewCell {

    var cellItem: CharacterResult! {
        didSet {
            self.charImageView.sd_setImage(with: URL(string: cellItem.image))
            self.charNameLabel.text = cellItem?.name
            if cellItem.gender == "Female"{
                self.charGenderImageview.image = UIImage(named: "female-icon")
            }
            else if cellItem.gender == "Male"{
                self.charGenderImageview.image = UIImage(named: "male-icon")
            }
            else {
                self.charGenderImageview.image = UIImage(named: "genderless-icon")
            }
           
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var charImageView: UIImageView!
    @IBOutlet weak var charNameLabel: UILabel!
    @IBOutlet weak var charGenderImageview: UIImageView!
    
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        
//        // Configure the view for the selected state
//    }
    
    
}
