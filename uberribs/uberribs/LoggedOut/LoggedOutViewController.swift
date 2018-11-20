//
//  LoggedOutViewController.swift
//  uberribs
//
//  Created by Leonardo Medeiros on 19/11/2018.
//  Copyright © 2018 irvem. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import SnapKit


protocol LoggedOutPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    
    func login(withPlayer1Name player1Name: String?, player2Name: String?)
}

//  The LoggedOutViewController uses LoggedOutPresentableListener to communicate with its interactor following the same dependency inversion principle.

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let playerFields = buildPlayerFields()
        buildLoginButton(withPlayer1Field: playerFields.player1Field, player2Field: playerFields.player2Field)
    }
    
    // MARK: - Private

    @IBOutlet weak var tvPlayer1: UITextField!
    @IBOutlet weak var tvPlayer2: UITextField!
    @IBOutlet weak var btnConfirm: UIButton!
    
    
    private func buildPlayerFields() -> (player1Field: UITextField, player2Field: UITextField) {
        
        return (tvPlayer1, tvPlayer2)
    }
    
    
    private func buildLoginButton(withPlayer1Field player1Field: UITextField, player2Field: UITextField) {
        btnConfirm.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    @objc private func didTapLoginButton() {
        listener?.login(withPlayer1Name: tvPlayer1.text, player2Name: tvPlayer2.text)
    }

    
}

