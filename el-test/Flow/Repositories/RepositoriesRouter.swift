//
//  RepositoriesRouter.swift
//  el-test
//
//  Created by Евгений Бижанов on 18/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

import UIKit

final class RepositoriesRouter: Router {
    
    /// Navigate to Repository detail view controller
    ///
    /// - Parameter repo: `Repository` object to pass it by view model
    func toDetailView(of repo: Repository) {
        perform(segue: "RepoDetailSegue") { (controller: RepositoryViewController) in
            controller.model = repo
        }
    }
}
