//
//  ProfileCollectionViewCell.swift
//  Outstagram
//
//  Created by YUJIN KWON on 2022/10/31.
//

import SnapKit
import UIKit

final class ProfileCollectionViewCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    func setUp(with image: UIImage) {
        addSubview(imageView)
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        imageView.backgroundColor = .tertiaryLabel
    }
}
