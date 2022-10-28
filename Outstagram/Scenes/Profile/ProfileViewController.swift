//
//  ProfileViewController.swift
//  Outstagram
//
//  Created by YUJIN KWON on 2022/10/28.
//

import SnapKit
import Foundation
import UIKit

final class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationItem()
    }
    
}

private extension ProfileViewController {
    func setUpNavigationItem() {
        navigationItem.title = "torinunna"
        
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
}
