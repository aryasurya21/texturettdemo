//
//  BenchmarkViewController.swift
//  TextureTTDemo
//
//  Created by ByteDance on 4/12/22.
//

import Foundation
import UIKit

public final class BenchmarkViewController: UIViewController {
    
    private lazy var textureButton: UIButton = {
        let button = UIButton()
        button.setTitle("Texture", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(navigateTexture), for: .touchUpInside)
        return button
    }()
    
    private lazy var uikitButton: UIButton = {
        let button = UIButton()
        button.setTitle("UIKit", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(navigateToUIKit), for: .touchUpInside)
        return button
    }()
    
    @objc
    internal func navigateTexture(){
        let controller = TextureViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc
    internal func navigateToUIKit(){
        let controller = UIKitViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required internal init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.addArrangedSubview(self.textureButton)
        stack.addArrangedSubview(self.uikitButton)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
}
