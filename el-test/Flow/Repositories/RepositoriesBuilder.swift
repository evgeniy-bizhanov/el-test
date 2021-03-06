//
//  RepositoriesBuilder.swift
//  el-test
//
//  Created by Евгений Бижанов on 17/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

import Swinject

final class RepositoriesBuilder: AbstractModuleBuilder {
    
    @IBOutlet weak var viewController: RepositoriesViewController!
    
    override func resolve(resolver: Resolver) {
        viewController.input = resolver.resolve(RepositoriesInput.self, argument: viewController as RepositoriesOutput?)
        viewController.router = resolver.resolve(RepositoriesRouter.self, argument: viewController as UIViewController)
    }
}
