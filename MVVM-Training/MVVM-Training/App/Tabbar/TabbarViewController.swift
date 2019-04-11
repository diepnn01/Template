//
//  TabbarViewController.swift
//  MVVM-Training
//
//  Created by Diep Nguyen on 12/6/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import UIKit

public class TabbarViewController: UITabBarController, UITabBarControllerDelegate {

    var storyBoard: UIStoryboard?
    var arrayVc: [UIViewController]?
    var itemController: TabbarItem!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        arrayVc = []
        arrayVc?.append(setViewControllerForTabBarItem(itemType: .Movies))
        arrayVc?.append(setViewControllerForTabBarItem(itemType: .TvShows))
        viewControllers = arrayVc
    }
    
    public func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

private extension TabbarViewController{
    
    func setViewControllerForTabBarItem(itemType: TabBarItems)-> UIViewController {
        itemController =  TabbarItem(itemType: itemType)
        
        let imageDisable = UIImage(named: itemController.imageDisabled )!.withRenderingMode(.alwaysOriginal)
        
        let imageEnable = UIImage(named:itemController.imageEnbled)?.withRenderingMode(.alwaysTemplate)
        itemController.controller.tabBarItem.selectedImage.
        
        itemController.controller.tabBarItem = UITabBarItem(title: itemType.rawValue, image: imageDisable, selectedImage: )
        let viewController = UINavigationController(rootViewController: itemController.controller)
        return viewController
    }
}
