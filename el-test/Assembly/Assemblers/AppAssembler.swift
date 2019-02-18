//
//  AppAssembler.swift
//  el-test
//
//  Created by Евгений Бижанов on 05/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

import Swinject

final class AppAssembler: Assembly {
    
    func assemble(container: Container) {
        
        container.register(DispatchQueue.self) { _ in
            DispatchQueue.global(qos: .userInteractive)
        }
    }
}
