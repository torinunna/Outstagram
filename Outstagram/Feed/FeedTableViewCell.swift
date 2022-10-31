//
//  FeedTableViewCell.swift
//  Outstagram
//
//  Created by YUJIN KWON on 2022/10/27.
//

import SnapKit
import UIKit

final class FeedTableViewCell: UITableViewCell {
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        
        return imageView
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "heart")
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "message")
        return button
    }()
    
    private lazy var directMessageButton: UIButton = {
        let button = UIButton()
            button.setImage(systemName: "paperplane")
        return button
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "bookmark")
        return button
    }()
    
    private lazy var likesCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.text = "Liked by Torinunna and others"
        
        return label
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.numberOfLines = 5
        label.text = "Success is not final; failure is not fatal: It is the courage to continue that counts. — Winston S. Churchill"
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 11.0, weight: .medium)
        label.text = "1일 전"
        
        return label
    }()
   
    func setUp() {
        [
            postImageView,
            likeButton,
            commentButton,
            directMessageButton,
            bookmarkButton,
            likesCountLabel,
            contentsLabel,
            dateLabel
        ].forEach { addSubview($0) }
        
        postImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(postImageView.snp.width)
        }
        
        let buttonWidth: CGFloat = 24.0
        let buttonInset: CGFloat = 16.0
        
        likeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(postImageView.snp.bottom).offset(buttonInset)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        commentButton.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.trailing).offset(12.0)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        directMessageButton.snp.makeConstraints {
            $0.leading.equalTo(commentButton.snp.trailing).offset(12.0)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        likesCountLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(likeButton.snp.bottom).offset(14.0)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(likesCountLabel.snp.bottom).offset(8.0)
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(8.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }
        
    }
}
