//
//  SecondViewController.swift
//  TestPassData
//
//  Created by Hoàng Đức on 02/12/2022.
//

import UIKit

protocol SendTextDelegate {
    func sendText(text: String)
}

class SecondViewController: UIViewController {
    
    var delegate: SendTextDelegate?
    
    let textField: UITextField = {
        let field = UITextField(frame: .init(x: 100, y: 300, width: 200, height: 50))
        field.layer.borderWidth = 3
        return field
    }()
    
    let delegateButton: UIButton = {
        let button = UIButton(frame: .init(x: 100, y: 360, width: 200, height: 50))
        button.setTitle("Back Delegate", for: .normal)
        button.layer.borderWidth = 2
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    let closureButton: UIButton = {
        let button = UIButton(frame: .init(x: 100, y: 420, width: 200, height: 50))
        button.setTitle("Back Closure", for: .normal)
        button.layer.borderWidth = 2
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    var handelBack: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(delegateButton)
        view.addSubview(closureButton)
        
        delegateButton.addTarget(self, action: #selector(didTapDelegateButton), for: .touchUpInside)
        closureButton.addTarget(self, action: #selector(didTapClosureButton), for: .touchUpInside)

    }
    
    @objc func didTapDelegateButton() {
        dismiss(animated: true)
        delegate?.sendText(text: textField.text!)
    }
    
    @objc func didTapClosureButton() {
        dismiss(animated: true)
        handelBack?(textField.text ?? "")
    }
    
}
