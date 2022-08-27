//
//  ViewController.swift
//  AWS-AuthSample
//
//  Created by 木元健太郎 on 2022/08/24.
//

import UIKit
import Amplify

final class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
    }

    
    @objc private func tappedRegisterButton() {
        signIn(username: nameTextField.text, password: passTextField.text)
    }
}

extension ViewController {
private func signIn(username: String?, password: String?) {
        Amplify.Auth.signIn(username: username, password: password, options: .none) { result in
            switch result {
            case.success(let result):
                print(result)
            case.failure(let error):
                print(error)
            }
        }
    }
}
