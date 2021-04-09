//
//  LottieTabBar.swift
//  lottieExam
//
//  Created by Sung Min Park on 2021/03/15.
//

import UIKit
import Lottie

class LottieTabBar: UITabBar {
    open override var items: [UITabBarItem]? {
        didSet {
            addItemTabButtons()
            self.layoutIfNeeded()
        }
    }
    
    fileprivate var container:[AnimationView] = [AnimationView]()
    fileprivate var beforeSelectIndex: Int = 0
    
    override func setItems(_ items: [UITabBarItem]?, animated: Bool) {
        super.setItems(items, animated: animated)
        addItemTabButtons()
        self.layoutIfNeeded()
    }
    
    fileprivate func addItemTabButtons() {
        for iter in container {
            iter.removeFromSuperview()
        }
        container.removeAll()
        
        var tabButtons: [UIView] {
            return subviews.filter { (subview) -> Bool in
                if let cls = NSClassFromString("UITabBarButton") {
                    return subview.isKind(of: cls)
                }
                return false
            } .sorted { (lhs, rhs) -> Bool in
                return lhs.frame.origin.x < rhs.frame.origin.x
            }
        }
        for (i, iter) in tabButtons.enumerated() {
            let tabBarItem:LottieTabBarItem = self.items?[i] as! LottieTabBarItem
            let animView = AnimationView.init(animation: tabBarItem.lottieAnimation)
            container.append(animView)
            iter.addSubview(animView)
            animView.isUserInteractionEnabled = false
            animView.frame = CGRect(x: 0, y: 0, width: iter.frame.width, height: iter.frame.height)
        }
    }
    
    func didSelect(item:UITabBarItem) {
        container[beforeSelectIndex].stop()
        guard let findIndex = items?.firstIndex(where: {
            (iter) -> Bool in
            return iter === item
        }) else {
            return
        }
        container[findIndex].play()
        beforeSelectIndex = findIndex
    }
}
