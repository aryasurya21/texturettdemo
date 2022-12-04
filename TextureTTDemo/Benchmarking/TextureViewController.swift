//
//  TextureViewController.swift
//  TextureBenchmarking
//
//  Created by ByteDance on 18/11/22.
//

import Foundation
import AsyncDisplayKit

internal final class TextureViewController: ASDKViewController<ASDisplayNode>, ASCollectionDataSource, ASCollectionDelegate {
    
    private var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    private let collectionNode: ASCollectionNode
    
    override internal init() {
        collectionNode = ASCollectionNode(collectionViewLayout: flowLayout)
        
        super.init(node: collectionNode)
        
        collectionNode.delegate = self
        collectionNode.dataSource = self
    }
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        node.view.backgroundColor = .white
        
        let size = floor(collectionNode.frame.width / 4)
        flowLayout.itemSize = CGSize(width: size, height: size)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
    }
    
    internal func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }
    
    internal func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return 3000
    }
    
    internal func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return { () -> ASCellNode in
            let cellNode = TextureCollectionViewCell()
            cellNode.neverShowPlaceholders = true
            cellNode.imageView.image = ImageDelayer().getDelayedImage()
            return cellNode
        }
    }
}

internal final class TextureCollectionViewCell: ASCellNode {
    
    internal let imageView = ASImageNode()
    
    override internal init() {
        super.init()
        imageView.contentMode = .scaleAspectFill
        addSubnode(imageView)
    }
    
    override internal func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASWrapperLayoutSpec(layoutElement: imageView)
    }
}
