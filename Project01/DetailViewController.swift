//
//  DetailViewController.swift
//  Project01
//
//  Created by Joao Gripp on 04/08/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    let imageView = UIImageView()
    var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }

        
    }
    
    override func loadView() {
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        view = imageView
    }
    

    

}
