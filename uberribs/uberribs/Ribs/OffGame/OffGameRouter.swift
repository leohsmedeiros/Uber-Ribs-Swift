import RIBs

final class OffGameRouter: ViewableRouter<OffGameInteractable, OffGameViewControllable>, OffGameRouting {
    
    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: OffGameInteractable, viewController: OffGameViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

