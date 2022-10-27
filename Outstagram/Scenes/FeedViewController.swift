//
//  FeedViewController.swift
//  Outstagram
//
//  Created by YUJIN KWON on 2022/10/27.
//

import SnapKit
import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpNavigationBar()
    }
}


private extension FeedViewController {
    func setUpNavigationBar() {
        
        navigationItem.title = "Outstagram"
        
        let uploadButton = UIBarButtonItem(
            image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = uploadButton
    }
}
