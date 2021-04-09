//
//  LottieTabbarViewController.swift
//  lottieExam
//
//  Created by Sung Min Park on 2021/03/13.
//

import UIKit
import Lottie

class LottieTabbarController: UITabBarController {
    var lottieTabBar:LottieTabBar = LottieTabBar()
    
    //MARK: - Initializer
    convenience init() {
        self.init(barStyle: .default)
    }
    
    init(barStyle:UIBarStyle) {
        lottieTabBar.barStyle = barStyle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - os function
    override func viewDidLoad() {
        super.viewDidLoad()
        lottieTabBar.delegate = self
        self.setValue(lottieTabBar, forKey: "tabBar")
    }

    override func viewWillLayoutSubviews() {
        tabBar.layoutIfNeeded()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        
        guard let existViewControllers = viewControllers else {
            return
        }

        //Check force 
        let lottieTabBarItemViewControllers = existViewControllers.filter { (iter) -> Bool in
            if iter.tabBarItem == nil {
                return false
            }
            return iter.tabBarItem is LottieTabBarItem
        }
        super.setViewControllers(lottieTabBarItemViewControllers, animated: animated)
    }
}

extension LottieTabbarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let lottieTabBar = tabBar as? LottieTabBar else {
            return
        }
        lottieTabBar.didSelect(item: item)
    }
}
