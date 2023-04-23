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
    var navVC: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if (UserDefaults.standard.value(forKey: "isFirstTime") != nil) == true {
            splashLabel.text = "Welcome!"
            print("isfirst")
        }
        else {
            splashLabel.text = "Hello!"
            print("isfirst t")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.presentVC(to: self.mainVC)
        }
    }
    
}
