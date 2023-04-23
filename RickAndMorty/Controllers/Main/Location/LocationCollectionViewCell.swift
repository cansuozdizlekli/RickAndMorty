//
//  LocationCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Cansu Özdizlekli on 4/20/23.
//

import UIKit

class LocationCollectionViewCell: UICollectionViewCell {
    
    var cellItem: LocationResult!
    
    private var locationName: UILabel = {
        var label = UILabel()
        label = UILabel(frame: CGRect(x: 5, y: 10, width: 120, height: 100))
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        label.highlightedTextColor = .white
        
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class var identifier: String {
        return String(describing: self)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(locationName)
//        locationName.backgroundColor = .portalGreen
        contentView.clipsToBounds = true
        contentView.frame = CGRect(x: 0, y: 0, width: 50, height: 100)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupItems() {
        self.locationName.text = cellItem.name
    }
    
}
