//
//  LoggedInRouter.swift
//  uberribs
//
//  Created by Leonardo Medeiros on 20/11/2018.
//  Copyright © 2018 irvem. All rights reserved.
//

import RIBs

protocol LoggedInInteractable: Interactable {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
    
}

final class LoggedInRouter: Router<LoggedInInteractable>, LoggedInRouting {

    // TODO: Constructor inject child builder protocols to allow building children.

    init(interactor: LoggedInInteractable,
         viewController: LoggedInViewControllable) {
        self.viewController = viewController
        super.init(interactor: interactor)
        interactor.router = self
    }

    // MARK: - LoggedInRouting
    func cleanupViews() {
        if let currentChild = currentChild {
            viewController.dismiss(viewController: currentChild.viewControllable)
        }
    }
    
    // MARK: - Private
    private let viewController: LoggedInViewControllable
//    private let offGameBuilder: OffGameBuildable
//    private let ticTacToeBuilder: TicTacToeBuildable
    
    private var currentChild: ViewableRouting?
    
    
//    private func attachOffGame() {
//        let offGame = offGameBuilder.build(withListener: interactor)
//        self.currentChild = offGame
//        attachChild(offGame)
//        viewController.present(viewController: offGame.viewControllable)
//    }
//
//    private func detachCurrentChild() {
//        if let currentChild = currentChild {
//            detachChild(currentChild)
//            viewController.dismiss(viewController: currentChild.viewControllable)
//        }
//    }
    
//    init(interactor: LoggedInInteractable,
//         viewController: LoggedInViewControllable,
//         offGameBuilder: OffGameBuildable,
//         ticTacToeBuilder: TicTacToeBuildable) {
//        self.viewController = viewController
//        self.offGameBuilder = offGameBuilder
//        self.ticTacToeBuilder = ticTacToeBuilder
//        super.init(interactor: interactor)
//        interactor.router = self
//    }
    

}
