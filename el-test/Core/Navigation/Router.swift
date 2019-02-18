//
//  Router.swift
//  el-test
//
//  Created by Евгений Бижанов on 18/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

import UIKit

class Router: NSObject {
    
    weak var controller: UIViewController!
    
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
        
        controller?.performSegue(withIdentifier: segue, sender: performAction)
    }
    
    func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?) {
        
        guard let action = sender as? ((UIViewController) -> Void) else { return }
        action(segue.destination)
    }
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
}
