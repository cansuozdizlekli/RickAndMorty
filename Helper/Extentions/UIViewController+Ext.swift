//
//  UIViewController+Ext.swift
//  RickAndMorty
//
//  Created by Cansu Özdizlekli on 4/21/23.
//

import UIKit

extension UIViewController {
    
    func presentVC(to vc: UIViewController, transitionStyle: UIModalTransitionStyle = .crossDissolve, presentationStyle: UIModalPresentationStyle = .fullScreen) {
        vc.modalPresentationStyle = presentationStyle
        vc.modalTransitionStyle = transitionStyle
        self.present(vc, animated: true)
    }
}
