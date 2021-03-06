import RIBs
import RxSwift
import UIKit
import SnapKit


//  The LoggedOutViewController uses LoggedOutPresentableListener to communicate with its interactor following the same dependency inversion principle.

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    // MARK: - Private
    weak var listener: LoggedOutPresentableListener?
    @IBOutlet weak var tvPlayer1: UITextField!
    @IBOutlet weak var tvPlayer2: UITextField!
    @IBOutlet weak var btnConfirm: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let playerFields = buildPlayerFields()
        buildLoginButton(withPlayer1Field: playerFields.player1Field, player2Field: playerFields.player2Field)
    }
    
    
    
    private func buildPlayerFields() -> (player1Field: UITextField, player2Field: UITextField) {
        
        return (tvPlayer1, tvPlayer2)
    }
    
    
    private func buildLoginButton(withPlayer1Field player1Field: UITextField, player2Field: UITextField) {
        btnConfirm.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    @objc private func didTapLoginButton() {
        listener?.login(withPlayer1Name: tvPlayer1.text, player2Name: tvPlayer2.text)
    }

    private let disposeBag = DisposeBag()
}

