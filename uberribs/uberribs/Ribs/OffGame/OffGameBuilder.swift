import RIBs

final class OffGameComponent: Component<OffGameDependency> {
    
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

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

