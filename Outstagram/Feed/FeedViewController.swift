//
//  FeedViewController.swift
//  Outstagram
//
//  Created by YUJIN KWON on 2022/10/27.
//

import SnapKit
import UIKit

class FeedViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.dataSource = self
        
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedTableViewCell")
        
        return tableView
    }()

    private lazy var imagePickerController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        
        return imagePickerController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpNavigationBar()
        setUpTableView()
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell
        cell?.selectionStyle = .none
        cell?.setUp()
        
        return cell ?? UITableViewCell()
    }
}

extension FeedViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectedImage: UIImage?
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectedImage = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage = originalImage
        }
        
        print(selectedImage)
        
        picker.dismiss(animated: true) { [weak self] in
            let uploadViewController = UploadViewController()
            let navigationController = UINavigationController(rootViewController: uploadViewController)
            navigationController.modalPresentationStyle = .fullScreen
            
            self?.present(navigationController, animated: true)
        }
    }
}

private extension FeedViewController {
    
    func setUpNavigationBar() {
        navigationItem.title = "Outstagram"
        
        let uploadButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(uploadButtonPressed))
        navigationItem.rightBarButtonItem = uploadButton
    }
    
    @objc func uploadButtonPressed() {
        present(imagePickerController, animated: true)
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
