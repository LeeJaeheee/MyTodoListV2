//
//  SplashViewController.swift
//  MyTodoList
//
//  Created by 이재희 on 2023/08/25.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gif = UIImage.gifImageWithName("fudolist")
        imageView.image = gif
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.performSegue(withIdentifier: "navSegue", sender: nil)
        }
    }
    
}
