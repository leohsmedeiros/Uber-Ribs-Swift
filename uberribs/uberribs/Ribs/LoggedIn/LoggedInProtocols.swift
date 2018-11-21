import Foundation
import RIBs


protocol LoggedInViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}
protocol LoggedInRouting: Routing {
    func cleanupViews()
    func routeToTicTacToe()
    func routeToOffGame()
}
protocol LoggedInInteractable: Interactable, OffGameListener, TicTacToeListener {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}
protocol LoggedInBuildable: Buildable {
    func build(withListener listener: LoggedInListener) -> LoggedInRouting
}


// TODO: Declare methods the interactor can invoke to communicate with other RIBs.
protocol LoggedInDependency: Dependency {
    var loggedInViewController: LoggedInViewControllable { get }
}
protocol LoggedInListener: class {}


/*
    TRANSITIONS
*/

/// The dependencies needed from the parent scope of LoggedIn to provide for the OffGame scope.
// TODO: Update LoggedInDependency protocol to inherit this protocol.
protocol LoggedInDependencyOffGame: Dependency {
    // TODO: Declare dependencies needed from the parent scope of LoggedIn to provide dependencies
    // for the OffGame scope.
}
extension LoggedInComponent: OffGameDependency {
    // TODO: Implement properties to provide for OffGame scope.
}


/// The dependencies needed from the parent scope of LoggedIn to provide for the TicTacToe scope.
// TODO: Update LoggedInDependency protocol to inherit this protocol.
protocol LoggedInDependencyTicTacToe: Dependency {
    // TODO: Declare dependencies needed from the parent scope of LoggedIn to provide dependencies
    // for the TicTacToe scope.
}
extension LoggedInComponent: TicTacToeDependency {
    // TODO: Implement properties to provide for TicTacToe scope.
}
