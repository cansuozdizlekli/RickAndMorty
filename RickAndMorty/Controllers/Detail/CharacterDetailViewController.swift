//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Cansu Özdizlekli on 4/20/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    @IBOutlet weak var charImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var episodesLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var specyLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    var selectedCharacter: CharacterResult!
    
    private let backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 5, y: 65, width: 50, height: 50))
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "arrow.backward",withConfiguration: UIImage.SymbolConfiguration(pointSize: 17)), for: UIControl.State.normal)
        button.tintColor = .black
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.4
        button.layer.cornerRadius = 25
        return button
    }()
    
    @IBOutlet weak var createdAtLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }


    private func initUI(){
        var episodeNumString : String = ""
        print(selectedCharacter.episode)
        selectedCharacter.episode.forEach { episodeUrl in
            let components = episodeUrl.components(separatedBy:"https://rickandmortyapi.com/api/episode/")
            print(components)
            components.forEach { id in
                if id != ""{
                    print(id)
                    episodeNumString = episodeNumString + id + ","
                }
                
            }
        }
        episodeNumString.removeLast()
        nameLabel.text = selectedCharacter.name
        createdLabel.text = selectedCharacter.created
        episodesLabel.text = episodeNumString
        locationLabel.text = selectedCharacter.location.name
        originLabel.text = selectedCharacter.origin.name
        genderLabel.text = selectedCharacter.gender.rawValue
        specyLabel.text = selectedCharacter.species.rawValue
        statusLabel.text = selectedCharacter.status.rawValue
        charImageView.sd_setImage(with: URL(string: selectedCharacter.image))
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
    }

    @objc private func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
