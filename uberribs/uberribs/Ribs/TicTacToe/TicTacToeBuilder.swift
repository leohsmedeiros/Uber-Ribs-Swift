import RIBs

final class TicTacToeComponent: Component<TicTacToeDependency> {
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

final class TicTacToeBuilder: Builder<TicTacToeDependency>, TicTacToeBuildable {
    
    override init(dependency: TicTacToeDependency) {
        super.init(dependency: dependency)
    }
    
    func build(withListener listener: TicTacToeListener) -> TicTacToeRouting {
        _ = TicTacToeComponent(dependency: dependency)
        let viewController = TicTacToeViewController()
        let interactor = TicTacToeInteractor(presenter: viewController)
        interactor.listener = listener
        return TicTacToeRouter(interactor: interactor, viewController: viewController)
    }
}
