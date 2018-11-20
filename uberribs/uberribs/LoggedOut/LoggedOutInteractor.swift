//
//  LoggedOutInteractor.swift
//  uberribs
//
//  Created by Leonardo Medeiros on 19/11/2018.
//  Copyright © 2018 irvem. All rights reserved.
//

import RIBs
import RxSwift

//  protocol to communicate with its router.
protocol LoggedOutRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

//  is the same concept that allows the interactor to communicate with the view controller
protocol LoggedOutPresentable: Presentable {
    var listener: LoggedOutPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol LoggedOutListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}


//  The LoggedOutInteractor uses the LoggedOutRouting protocol to communicate with its router. This is based on the dependency inversion principle where the interactor declares what it needs, and some other unit, in this case, the LoggedOutRouter, provides the implementation. Similar to the buildable protocol, this allows the interactor to be unit-tested. LoggedOutPresentable is the same concept that allows the interactor to communicate with the view controller.

final class LoggedOutInteractor: PresentableInteractor<LoggedOutPresentable>, LoggedOutInteractable, LoggedOutPresentableListener {

    weak var router: LoggedOutRouting?
    weak var listener: LoggedOutListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: LoggedOutPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    
    func login(withPlayer1Name player1Name: String?, player2Name: String?) {
        let player1NameWithDefault = playerName(player1Name, withDefaultName: "Player 1")
        let player2NameWithDefault = playerName(player2Name, withDefaultName: "Player 2")
        
        print("\(player1NameWithDefault) vs \(player2NameWithDefault)")
    }
    
    private func playerName(_ name: String?, withDefaultName defaultName: String) -> String {
        if let name = name {
            return name.isEmpty ? defaultName : name
        } else {
            return defaultName
        }
    }
    
}
