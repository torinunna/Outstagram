//
//  UploadViewController.swift
//  Outstagram
//
//  Created by YUJIN KWON on 2022/10/31.
//

import SnapKit
import UIKit

final class UploadViewController: UIViewController {
    
    private let uploadImage: UIImage
    
    private let imageView = UIImageView()
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.text = "Write a caption..."
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 15.0)
        textView.delegate = self
        return textView
    }()
    
    init(uploadImage: UIImage) {
        self.uploadImage = uploadImage
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setUpNavigationItem()
        setUpLayout()
        
        imageView.image = uploadImage
    }
}

extension UploadViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        
        textView.text = nil
        textView.textColor = .label
    }
}

private extension UploadViewController {
    func setUpNavigationItem() {
        navigationItem.title = "New post"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftButtonPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(rightButtonPressed))
    }
    
    @objc func leftButtonPressed() {
        dismiss(animated: true)
    }
    
    @objc func rightButtonPressed() {
//        save method
        dismiss(animated: true)
    }
    
    func setUpLayout() {
        [imageView, textView].forEach { view.addSubview($0) }
        
        let imageViewInset: CGFloat = 16.0
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
                .inset(imageViewInset)
            $0.leading.equalToSuperview().inset(imageViewInset)
            $0.width.equalTo(100.0)
            $0.height.equalTo(imageView.snp.width)
        }
        
        textView.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing)
                .offset(imageViewInset)
            $0.trailing.equalToSuperview().inset(imageViewInset)
            $0.top.equalTo(imageView.snp.top)
            $0.bottom.equalTo(imageView.snp.bottom)
        }
    }
}

