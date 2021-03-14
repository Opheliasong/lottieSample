//
//  ViewController.swift
//  lottieExam
//
//  Created by Sung Min Park on 2021/03/11.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    var isLike:Bool = false
    var twitterButton:AnimatedButton?

    fileprivate func makeTwitterLikeButton() {
        // Do any additional setup after loading the view.
        
        twitterButton = AnimatedButton()
        twitterButton!.translatesAutoresizingMaskIntoConstraints = false
        twitterButton!.animation = Animation.named("TwitterHeartButton")
        twitterButton!.animationView.animationSpeed = 2
        twitterButton!.animationView.logHierarchyKeypaths()
        twitterButton!.clipsToBounds = false
        twitterButton!.addTarget(self, action: #selector(onLike), for: .touchUpInside)
        view.addSubview(twitterButton!)
        twitterButton!.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 12).isActive = true
        twitterButton!.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTwitterLikeButton()
    }

    @objc
    func onLike() {
        isLike = !isLike
        if isLike {
            // 지정된 마커 프레임으로 제어 가능
            twitterButton?.animationView.play(toMarker: "touchEndUp")
        } else {
            // Stop을 하면 최초 프레임으로 바뀐다
            twitterButton?.animationView.stop()
        }
    }
}

