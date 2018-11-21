//
//  LoggedInInteractor.swift
//  uberribs
//
//  Created by Leonardo Medeiros on 20/11/2018.
//  Copyright © 2018 irvem. All rights reserved.
//

import RIBs
import RxSwift

enum PlayerType: Int {
    case player1 = 1
    case player2
}

protocol LoggedInRouting: Routing {
    func cleanupViews()
    func routeToTicTacToe()
    func routeToOffGame()
}

protocol LoggedInListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class LoggedInInteractor: Interactor, LoggedInInteractable {
    
    weak var router: LoggedInRouting?
    weak var listener: LoggedInListener?
    
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init() {}
    
    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }
    
    override func willResignActive() {
        super.willResignActive()
        
        router?.cleanupViews()
        // TODO: Pause any business logic.
    }
    
    // MARK: - OffGameListener
    func startTicTacToe() {
        router?.routeToTicTacToe()
    }
    
    // MARK: - TicTacToeListener
    func gameDidEnd() {
        router?.routeToOffGame()
    }
}
