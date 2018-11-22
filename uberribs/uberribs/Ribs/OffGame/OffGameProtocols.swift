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
protocol OffGameDependency: Dependency {
    var player1Name: String { get }
    var player2Name: String { get }
    var scoreStream: ScoreStream { get }
}
// TODO: Declare methods the interactor can invoke the presenter to present data.
protocol OffGamePresentable: Presentable {
    var listener: OffGamePresentableListener? { get set }
    func set(score: Score)
}
protocol OffGameListener: class {
    func startTicTacToe()
}
protocol OffGamePresentableListener: class {
    func startGame()
}

