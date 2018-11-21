import RIBs

final class TicTacToeRouter: ViewableRouter<TicTacToeInteractable, TicTacToeViewControllable>, TicTacToeRouting {
    
    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: TicTacToeInteractable, viewController: TicTacToeViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

