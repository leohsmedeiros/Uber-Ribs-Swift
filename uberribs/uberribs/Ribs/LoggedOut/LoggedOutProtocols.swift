import Foundation
import RIBs


// TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
protocol LoggedOutRouting: ViewableRouting {}
protocol LoggedOutInteractable: Interactable {
    var router: LoggedOutRouting? { get set }
    var listener: LoggedOutListener? { get set }
}
protocol LoggedOutBuildable: Buildable {
    func build(withListener listener: LoggedOutListener) -> LoggedOutRouting
}
// TODO: Declare methods the router invokes to manipulate the view hierarchy.
protocol LoggedOutViewControllable: ViewControllable {}



// TODO: Declare the set of dependencies required by this RIB, but cannot be
// created by this RIB.
protocol LoggedOutDependency: Dependency {}
// TODO: Declare methods the interactor can invoke the presenter to present data.
protocol LoggedOutPresentable: Presentable {
    var listener: LoggedOutPresentableListener? { get set }
}
protocol LoggedOutListener: class {
    func didLogin(withPlayer1Name player1Name: String, player2Name: String)
}
// TODO: Declare properties and methods that the view controller can invoke to perform
// business logic, such as signIn(). This protocol is implemented by the corresponding
// interactor class.
protocol LoggedOutPresentableListener: class {
    func login(withPlayer1Name player1Name: String?, player2Name: String?)
}

