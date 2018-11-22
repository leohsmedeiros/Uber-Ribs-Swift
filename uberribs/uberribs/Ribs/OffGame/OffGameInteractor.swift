import RIBs
import RxSwift

final class OffGameInteractor: PresentableInteractor<OffGamePresentable>, OffGameInteractable, OffGamePresentableListener {
    
    weak var router: OffGameRouting?
    
    weak var listener: OffGameListener?
    
    private let scoreStream: ScoreStream
    
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: OffGamePresentable, scoreStream: ScoreStream) {
        self.scoreStream = scoreStream
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
        updateScore()
        // TODO: Implement business logic here.
    }
    
    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    // MARK: - OffGamePresentableListener
    func startGame() {
        listener?.startTicTacToe()
    }
    
    private func updateScore() {
        scoreStream.score
            .subscribe(
                onNext: { (score: Score) in
                    self.presenter.set(score: score)
                }
            )
            .disposeOnDeactivate(interactor: self)
    }
}
