//
//  LoggedOutRouter.swift
//  uberribs
//
//  Created by Leonardo Medeiros on 19/11/2018.
//  Copyright © 2018 irvem. All rights reserved.
//

import RIBs

protocol LoggedOutInteractable: Interactable {
    var router: LoggedOutRouting? { get set }
    var listener: LoggedOutListener? { get set }
}

protocol LoggedOutViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

//  The LoggedOutRouter declares what it needs from the LoggedOutInteractable to communicate with its interactor. It uses the LoggedOutViewControllable to communicate with the view controller.

final class LoggedOutRouter: ViewableRouter<LoggedOutInteractable, LoggedOutViewControllable>, LoggedOutRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: LoggedOutInteractable, viewController: LoggedOutViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
