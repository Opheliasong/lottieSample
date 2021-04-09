//
//  LottieTabBarItem.swift
//  lottieExam
//
//  Created by Sung Min Park on 2021/03/15.
//

import UIKit
import Lottie

class LottieTabBarItem: UITabBarItem {
    var lottieAnimation:Animation?
    internal init(lottieAnimation: Animation) {
        self.lottieAnimation = lottieAnimation
        super.init()
    }
    
    required init?(coder: NSCoder) {
        self.lottieAnimation = nil
        super.init(coder: coder)
    }
}
