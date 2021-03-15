//
//  LottieTabBarItem.swift
//  lottieExam
//
//  Created by Sung Min Park on 2021/03/15.
//

import UIKit
import Lottie

class LottieTabBarItem: UITabBarItem {
    let lottieAnimation:Animation
    internal init(lottieAnimation: Animation) {
        self.lottieAnimation = lottieAnimation
    }
    required init?(coder: NSCoder) {
//        lottieAnimation = Animation.
    }
}
