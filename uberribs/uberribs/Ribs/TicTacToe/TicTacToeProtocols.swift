import Foundation
import RIBs


// TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
protocol TicTacToeRouting: ViewableRouting {}
protocol TicTacToeInteractable: Interactable {
    var router: TicTacToeRouting? { get set }
    var listener: TicTacToeListener? { get set }
}
protocol TicTacToeBuildable: Buildable {
    func build(withListener listener: TicTacToeListener) -> TicTacToeRouting
}
// TODO: Declare methods the router invokes to manipulate the view hierarchy.
protocol TicTacToeViewControllable: ViewControllable {}


// TODO: Declare the set of dependencies required by this RIB, but cannot be created by this RIB.
protocol TicTacToeDependency: Dependency {}
protocol TicTacToePresentable: Presentable {
    var listener: TicTacToePresentableListener? { get set }
    func setCell(atRow row: Int, col: Int, withPlayerType playerType: PlayerType)
    func announce(winner: PlayerType?, withCompletionHandler handler: @escaping () -> ())
}
protocol TicTacToeListener: class {
    func gameDidEnd(withWinner winner: PlayerType?)
}
protocol TicTacToePresentableListener: class {
    func placeCurrentPlayerMark(atRow row: Int, col: Int)    
}
