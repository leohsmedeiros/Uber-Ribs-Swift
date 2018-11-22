import RIBs

final class OffGameComponent: Component<OffGameDependency> {
    fileprivate var player1Name: String {
        return dependency.player1Name
    }
    
    fileprivate var player2Name: String {
        return dependency.player2Name
    }
    fileprivate var scoreStream: ScoreStream {
        return dependency.scoreStream
    }
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

final class OffGameBuilder: Builder<OffGameDependency>, OffGameBuildable {
    
    override init(dependency: OffGameDependency) {
        super.init(dependency: dependency)
    }
    
    func build(withListener listener: OffGameListener) -> OffGameRouting {
        let component = OffGameComponent(dependency: dependency)
        let viewController = OffGameViewController(player1Name: component.player1Name, player2Name: component.player2Name)
        let interactor = OffGameInteractor(presenter: viewController, scoreStream: component.scoreStream)
        
        interactor.listener = listener
        return OffGameRouter(interactor: interactor, viewController: viewController)
    }
}

