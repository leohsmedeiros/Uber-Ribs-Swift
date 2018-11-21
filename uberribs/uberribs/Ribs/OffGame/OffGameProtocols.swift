import Foundation
import RIBs


// TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
protocol OffGameRouting: ViewableRouting {}
protocol OffGameInteractable: Interactable {
    var router: OffGameRouting? { get set }
    var listener: OffGameListener? { get set }
}
protocol OffGameBuildable: Buildable {
    func build(withListener listener: OffGameListener) -> OffGameRouting
}
// TODO: Declare methods the router invokes to manipulate the view hierarchy.
protocol OffGameViewControllable: ViewControllable {}


// TODO: Declare the set of dependencies required by this RIB, but cannot be
// created by this RIB.
protocol OffGameDependency: Dependency {}
// TODO: Declare methods the interactor can invoke the presenter to present data.
protocol OffGamePresentable: Presentable {
    var listener: OffGamePresentableListener? { get set }
}
protocol OffGameListener: class {
    func startTicTacToe()
}
protocol OffGamePresentableListener: class {
    func startGame()
}

