//
//  UIKitViewController.swift
//  TextureBenchmarking
//
//  Created by ByteDance on 18/11/22.
//

import Foundation
import UIKit
import WatchdogInspector

internal final class UIKitViewController: UIViewController {
    
    private var collectionView: UICollectionView? = nil
    private let screen = UIScreen.main.bounds
    
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        let size = floor(screen.width / 4)
        layout.itemSize = CGSize(width: size, height: size)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.register(UIKitCollectionViewCell.self, forCellWithReuseIdentifier: "UIKitCollectionViewCell")
        collectionView?.backgroundColor = UIColor.white
      
        collectionView?.dataSource = self
        collectionView?.delegate = self

        view.addSubview(collectionView ?? UICollectionView())
        self.view = view
    }
}

extension UIKitViewController: UICollectionViewDataSource {
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3000
    }
}

extension UIKitViewController: UICollectionViewDelegate {
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UIKitCollectionViewCell", for: indexPath) as! UIKitCollectionViewCell
        cell.setImage(image: ImageDelayer().getDelayedImage())
        return cell
    }
}

final class UIKitCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = UIImageView()
    
    override internal init(frame: CGRect) {
        self.imageView.frame = CGRect(x: 0, y: 0, width: 103, height: 103)
        super.init(frame: frame)
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
    }
    
    required internal init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setImage(image: UIImage){
        self.imageView.image = image
        self.imageView.setNeedsLayout()
    }
}
