import RIBs

final class LoggedOutComponent: Component<LoggedOutDependency> {
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder
final class LoggedOutBuilder: Builder<LoggedOutDependency>, LoggedOutBuildable {
    
    override init(dependency: LoggedOutDependency) {
        super.init(dependency: dependency)
    }
    
    func build(withListener listener: LoggedOutListener) -> LoggedOutRouting {
        _ = LoggedOutComponent(dependency: dependency)
        let viewController = LoggedOutViewController()
        let interactor = LoggedOutInteractor(presenter: viewController)
        interactor.listener = listener
        return LoggedOutRouter(interactor: interactor, viewController: viewController)
    }
}
