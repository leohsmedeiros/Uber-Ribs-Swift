//
//  LoggedInBuilder.swift
//  uberribs
//
//  Created by Leonardo Medeiros on 20/11/2018.
//  Copyright © 2018 irvem. All rights reserved.
//

import RIBs

protocol LoggedInDependency: Dependency {
    var loggedInViewController: LoggedInViewControllable { get }
}

final class LoggedInComponent: Component<LoggedInDependency> {
    
    fileprivate var loggedInViewController: LoggedInViewControllable {
        return dependency.loggedInViewController
    }
}

// MARK: - Builder
protocol LoggedInBuildable: Buildable {
    func build(withListener listener: LoggedInListener) -> LoggedInRouting
}

final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {
    
    override init(dependency: LoggedInDependency) {
        super.init(dependency: dependency)
    }
    
    func build(withListener listener: LoggedInListener) -> LoggedInRouting {
        let component = LoggedInComponent(dependency: dependency)
        let interactor = LoggedInInteractor()
        interactor.listener = listener
        
        let offGameBuilder = OffGameBuilder(dependency: component as OffGameDependency)
        let ticTacToeBuilder = TicTacToeBuilder(dependency: component)
        return LoggedInRouter(interactor: interactor,
                              viewController: component.loggedInViewController,
                              offGameBuilder: offGameBuilder,
                              ticTacToeBuilder: ticTacToeBuilder)
    }
}
