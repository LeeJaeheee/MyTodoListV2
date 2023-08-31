//
//  ViewController.swift
//  MyTodoList
//
//  Created by 이재희 on 2023/08/10.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var todoButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var giftboxView: LottieAnimationView!
    @IBOutlet weak var mainImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoButton.circleButton = true
        doneButton.circleButton = true
        
        URLManager.shared.getImage(from: URLManager.shared.url) { image in
            DispatchQueue.main.async {
                if let image = image {
                    self.mainImageView.image = image
                } else {
                    print("fail")
                }
            }
        }

        let animationView = LottieAnimationView(name: "lN7uSuXCEQ")
        animationView.contentMode = .scaleAspectFill
        giftboxView.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: giftboxView.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: giftboxView.centerYAnchor, constant: 15),
            animationView.widthAnchor.constraint(equalTo: giftboxView.widthAnchor, multiplier: 1.8),
            animationView.heightAnchor.constraint(equalTo: giftboxView.heightAnchor, multiplier: 1.8)
        ])
        animationView.loopMode = .loop
        animationView.play()
    }

    
}

