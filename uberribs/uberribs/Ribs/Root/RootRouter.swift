import RIBs

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    // MARK: - Private
    private let loggedOutBuilder: LoggedOutBuildable
    private let loggedInBuilder: LoggedInBuildable
    private var loggedOut: ViewableRouting?

    
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         loggedOutBuilder: LoggedOutBuildable,
         loggedInBuilder: LoggedInBuildable) {
        self.loggedOutBuilder = loggedOutBuilder
        self.loggedInBuilder = loggedInBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        
        routeToLoggedOut()
    }
    
    func routeToLoggedIn(withPlayer1Name player1Name: String, player2Name: String) {
        // Detach logged out.
        if let loggedOut = self.loggedOut {
            detachChild(loggedOut)
            viewController.dismiss(viewController: loggedOut.viewControllable)
            self.loggedOut = nil
        }
        
        let loggedIn = loggedInBuilder.build(withListener: interactor)
        attachChild(loggedIn)
    }
    
    private func routeToLoggedOut() {
        let loggedOut = loggedOutBuilder.build(withListener: interactor)
        self.loggedOut = loggedOut
        attachChild(loggedOut)
        viewController.present(viewController: loggedOut.viewControllable)
    }
}
