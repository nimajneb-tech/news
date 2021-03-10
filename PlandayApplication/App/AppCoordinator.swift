//
//  AppCoordinator.swift
//  PlandayApplication
//
//  Created by Benjamin on 09/03/2021.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow){
        self.window = window
    }
    
    func start() {
        let vc = HomeViewController()
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
}
