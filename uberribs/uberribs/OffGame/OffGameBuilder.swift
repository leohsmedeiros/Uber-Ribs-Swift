//
//  OffGameBuilder.swift
//  uberribs
//
//  Created by Leonardo Medeiros on 20/11/2018.
//  Copyright © 2018 irvem. All rights reserved.
//

import RIBs

protocol OffGameDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class OffGameComponent: Component<OffGameDependency> {
    
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder
protocol OffGameBuildable: Buildable {
    func build(withListener listener: OffGameListener) -> OffGameRouting
}

final class OffGameBuilder: Builder<OffGameDependency>, OffGameBuildable {
    
    override init(dependency: OffGameDependency) {
        super.init(dependency: dependency)
    }
    
    func build(withListener listener: OffGameListener) -> OffGameRouting {
        _ = OffGameComponent(dependency: dependency)
        let viewController = OffGameViewController()
        let interactor = OffGameInteractor(presenter: viewController)
        interactor.listener = listener
        return OffGameRouter(interactor: interactor, viewController: viewController)
    }
}

