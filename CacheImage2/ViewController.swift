//
//  ViewController.swift
//  CacheImage2
//
//  Created by admin on 3/28/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        cacheImage()
        spinner.startAnimating()
    }
    
    
    func cacheImage() {
        let imageStringUrl: String = "https://i.quantrimang.com/photos/image/2018/01/10/hinh-nen-4k-8.jpg"
        guard let imageUrl = URL(string: imageStringUrl) else { return }
        
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageUrl) else {
                return
            }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.imageView.image = image
                self.spinner.isHidden = true
            }
        }
        
        
    }
}

