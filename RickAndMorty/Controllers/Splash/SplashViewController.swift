//
//  SplashViewController.swift
//  RickAndMorty
//
//  Created by Cansu Özdizlekli on 4/21/23.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var splashLabel: UILabel!
    let mainVC = MainViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if (UserDefaults.standard.value(forKey: "isFirstTime") != nil) == true {
            splashLabel.text = "Welcome!"
        }
        else {
            splashLabel.text = "Hello!"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.presentVC(to: self.mainVC)
        }
    }
    
}
