//
//  RepositoriessAssembler.swift
//  el-test
//
//  Created by Евгений Бижанов on 12/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

import Swinject

final class RepositoriessAssembler: Assembly {
    
    func assemble(container: Container) {
        
        container.register(RepositoriesRequestable.self) { r in
            return RequestFactoryHelper.makeFactory(RequestManager.self, resolver: r)
        }.inObjectScope(.container)
        
        container.register(RepositoriesInput.self) { r, output in
            return RepositoriesPresenter(
                output: output,
                requestManager: r.resolve(RepositoriesRequestable.self)
            )
        }
    }
}
