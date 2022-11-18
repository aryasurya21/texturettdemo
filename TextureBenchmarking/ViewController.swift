//
//  ViewController.swift
//  TextureBenchmarking
//
//  Created by ByteDance on 18/11/22.
//

import UIKit
import AsyncDisplayKit

internal final class ViewController: ASDKViewController<ASDisplayNode> {
    
    private lazy var textureButton: ASButtonNode = {
        let button = ASButtonNode()
        button.setTitle("Texture", with: nil, with: nil, for: .normal)
        button.addTarget(self, action: #selector(navigateTexture), forControlEvents: .touchUpInside)
        return button
    }()
    
    private lazy var uikitButton: ASButtonNode = {
        let button = ASButtonNode()
        button.setTitle("UIKit", with: nil, with: nil, for: .normal)
        button.addTarget(self, action: #selector(uikit), forControlEvents: .touchUpInside)
        return button
    }()
    
    @objc
    internal func navigateTexture(){
        let controller = TextureViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc
    internal func uikit(){
        let controller = UIKitViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override internal init() {
        super.init(node: ASDisplayNode())
        self.node.backgroundColor = UIColor.white
        node.automaticallyManagesSubnodes = true
        node.layoutSpecBlock = { [weak self] _, _ -> ASLayoutSpec in
            guard let self = self else { return ASLayoutSpec()}
            
            let stack = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .center, alignItems: .center, children: [
                self.textureButton,
                self.uikitButton
            ])
            return ASWrapperLayoutSpec(layoutElement: stack)
        }
    }
    
    required internal init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

