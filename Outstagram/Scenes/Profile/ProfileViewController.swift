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
    
    private lazy var profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 40.0
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.quaternaryLabel.cgColor
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.text = "torinunna"
        label.font = .systemFont(ofSize: 14.0, weight: .semibold)
        
        return label
    }()
    
    private lazy var bioLabel: UILabel = {
        let label = UILabel()
         label.text = "Hi"
         label.font = .systemFont(ofSize: 14.0, weight: .medium)
         label.numberOfLines = 0
         
         return label
    }()
    
    private lazy var followButton: UIButton = {
       let button = UIButton()
        button.setTitle("follow", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 3.0
        
        return button
    }()
    
    private lazy var messageButton: UIButton = {
       let button = UIButton()
        button.setTitle("message", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .semibold)
        button.backgroundColor = .white
        button.layer.cornerRadius = 3.0
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.tertiaryLabel.cgColor
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationItem()
        setUpLayout()
    }
    
}

private extension ProfileViewController {
    func setUpNavigationItem() {
        navigationItem.title = "torinunna"
        
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setUpLayout() {
        let buttonStackView = UIStackView(arrangedSubviews: [followButton, messageButton])
        buttonStackView.spacing = 4.0
        buttonStackView.distribution = .fillEqually
        
        [
            profileImageView, nameLabel, bioLabel, buttonStackView
        ].forEach { view.addSubview($0) }
        
        let inset: CGFloat = 8.0
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
            $0.leading.equalToSuperview().inset(inset)
            $0.width.equalTo(80.0)
            $0.height.equalTo(profileImageView.snp.width)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(12.0)
            $0.leading.equalTo(profileImageView.snp.leading)
            $0.trailing.equalToSuperview().inset(inset)
        }
        
        bioLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6.0)
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.trailing.equalTo(nameLabel.snp.trailing)
        }
    
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(bioLabel.snp.bottom).offset(12.0)
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.trailing.equalTo(nameLabel.snp.trailing)
        }
        
    }
    
}
