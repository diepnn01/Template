//
//  ViewController.swift
//  MVVM-Training
//
//  Created by Diep Nguyen on 12/5/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import UIKit
import CoreProject

public class InitialViewController: UIViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()
    }

    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let vc = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "TabbarViewController") as? TabbarViewController {
            UIApplication.shared.delegate?.window!!.rootViewController = vc
        }
        
        let vc = MoviesViewController()
    }
    
    
}

