//
//  TextureViewController.swift
//  TextureBenchmarking
//
//  Created by ByteDance on 18/11/22.
//

import Foundation
import AsyncDisplayKit

internal final class TextureViewController: ASDKViewController<ASCollectionNode>, ASCollectionDataSource, ASCollectionDelegate {
    
    let flowLayout: UICollectionViewFlowLayout
    let collectionNode: ASCollectionNode
    
    override internal init() {
        flowLayout = UICollectionViewFlowLayout()
        collectionNode = ASCollectionNode(collectionViewLayout: flowLayout)
        
        super.init(node: collectionNode)
        
        collectionNode.delegate = self
        collectionNode.dataSource = self
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = floor(collectionNode.frame.width / 4)
        flowLayout.itemSize = CGSize(width: size, height: size)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
    }
    
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return 3000
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return { () -> ASCellNode in
            let cellNode = TextureCollectionViewCell()
            cellNode.imageView.image = ImageDelayer().getDelayedImage()
            return cellNode
        }
    }
}

final class TextureCollectionViewCell: ASCellNode {
    
    let imageView = ASImageNode()
    
    override init() {
        super.init()
        imageView.contentMode = .scaleAspectFill
        addSubnode(imageView)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASWrapperLayoutSpec(layoutElement: imageView)
    }
}
