import RIBs

final class LoggedInComponent: Component<LoggedInDependency> {
    fileprivate var loggedInViewController: LoggedInViewControllable {
        return dependency.loggedInViewController
    }
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
