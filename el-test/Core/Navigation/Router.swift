//
//  Router.swift
//  el-test
//
//  Created by Евгений Бижанов on 18/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

import UIKit

/// Base navigation pattern router class
class Router: NSObject {
    
    // MARK: - Models
    // MARK: - Services
    // MARK: - Properties
    
    weak var controller: UIViewController!
    
    
    // MARK: - Fields
    // MARK: - Functions
    
    /// Performs segue on behalf of the owning controller
    ///
    /// - Parameter segue: Segue identifier
    /// - Parameter performAction: Action that should be executed during preparing to transitioning
    func perform<Controller: UIViewController>(
        segue: String,
        performAction: ((Controller) -> Void)? = nil) {
        
        let performAction = performAction.map { action in
        { (controller: UIViewController) in
            
            guard let controller = controller as? Controller else {
                assertionFailure("Ожидался \(Controller.self)")
                return
            }
            
            action(controller)
            }
        }
        
        controller.performSegue(withIdentifier: segue, sender: performAction)
    }
    
    /// Preparing destination view controller to load
    ///
    /// - Parameter segue: Segue
    /// - Parameter sender: Object passed by perform action
    func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?) {
        
        guard let action = sender as? ((UIViewController) -> Void) else { return }
        action(segue.destination)
    }
    
    
    // MARK: - Initializers
    
    init(controller: UIViewController) {
        self.controller = controller
    }
}
