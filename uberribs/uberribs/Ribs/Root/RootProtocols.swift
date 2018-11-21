import Foundation
import RIBs

protocol RootRouting: ViewableRouting {
    func routeToLoggedIn(withPlayer1Name player1Name: String, player2Name: String)
}
protocol RootInteractable: Interactable, LoggedOutListener, LoggedInListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}
protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}
protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}


// TODO: Declare the set of dependencies required by this RIB, but cannot be created by this RIB.
protocol RootDependency: Dependency {}
// TODO: Declare methods the interactor can invoke the presenter to present data.
protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
}
// TODO: Declare methods the interactor can invoke to communicate with other RIBs.
protocol RootListener: class {}
// TODO: Declare properties and methods that the view controller can invoke to perform
// business logic, such as signIn(). This protocol is implemented by the corresponding
// interactor class.
protocol RootPresentableListener: class {}


/*
    TRANSITION
*/

/// The dependencies needed from the parent scope of Root to provide for the LoggedIn scope.
// TODO: Update RootDependency protocol to inherit this protocol.
// TODO: Declare dependencies needed from the parent scope of Root to provide dependencies
// for the LoggedIn scope.
protocol RootDependencyLoggedIn: Dependency {}
extension RootComponent: LoggedInDependency {
    var loggedInViewController: LoggedInViewControllable {
        return rootViewController
    }
}

/// The dependencies needed from the parent scope of Root to provide for the LoggedOut scope.
// TODO: Update RootDependency protocol to inherit this protocol.
// TODO: Declare dependencies needed from the parent scope of Root to provide dependencies
// for the LoggedOut scope.
protocol RootDependencyLoggedOut: Dependency {}
extension RootComponent: LoggedOutDependency {}
