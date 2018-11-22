import RIBs

final class TicTacToeComponent: Component<TicTacToeDependency> {
    fileprivate var player1Name: String {
        return dependency.player1Name
    }
    
    fileprivate var player2Name: String {
        return dependency.player2Name
    }
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

final class TicTacToeBuilder: Builder<TicTacToeDependency>, TicTacToeBuildable {
    
    override init(dependency: TicTacToeDependency) {
        super.init(dependency: dependency)
    }
    
    func build(withListener listener: TicTacToeListener) -> TicTacToeRouting {
        let component = TicTacToeComponent(dependency: dependency)
        let viewController = TicTacToeViewController(player1Name: component.player1Name, player2Name: component.player2Name)
        let interactor = TicTacToeInteractor(presenter: viewController)
        interactor.listener = listener
        return TicTacToeRouter(interactor: interactor, viewController: viewController)
    }
}
