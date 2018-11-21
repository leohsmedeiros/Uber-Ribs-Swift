import RIBs

//  The LoggedOutRouter declares what it needs from the LoggedOutInteractable to communicate with its interactor. It uses the LoggedOutViewControllable to communicate with the view controller.

final class LoggedOutRouter: ViewableRouter<LoggedOutInteractable, LoggedOutViewControllable>, LoggedOutRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: LoggedOutInteractable, viewController: LoggedOutViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
