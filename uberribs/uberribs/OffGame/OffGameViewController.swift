//
//  OffGameViewController.swift
//  uberribs
//
//  Created by Leonardo Medeiros on 20/11/2018.
//  Copyright © 2018 irvem. All rights reserved.
//

import RIBs
import RxCocoa
import RxSwift
import SnapKit
import UIKit

protocol OffGamePresentableListener: class {
    func startGame()
}

final class OffGameViewController: UIViewController, OffGamePresentable, OffGameViewControllable {
    
    weak var listener: OffGamePresentableListener?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Method is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.yellow
        buildStartButton()
    }
    
    // MARK: - Private
    private func buildStartButton() {
        let startButton = UIButton()
        view.addSubview(startButton)
        startButton.snp.makeConstraints { (maker: ConstraintMaker) in
            maker.center.equalTo(self.view.snp.center)
            maker.leading.trailing.equalTo(self.view).inset(40)
            maker.height.equalTo(100)
        }
        startButton.setTitle("Start Game", for: .normal)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.backgroundColor = UIColor.black
        startButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.listener?.startGame()
            })
            .disposed(by: disposeBag)
    }
    
    private let disposeBag = DisposeBag()
}

extension PlayerType {
    
    var color: UIColor {
        switch self {
        case .player1:
            return UIColor.red
        case .player2:
            return UIColor.blue
        }
    }
}
