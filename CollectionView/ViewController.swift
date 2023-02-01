//
//  ViewController.swift
//  CollectionView
//
//  Created by Aknar Assanov on 31.01.2023.
//

import UIKit
import SnapKit

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var smallCollectionView: UICollectionView = {
        let smallLayout = UICollectionViewFlowLayout()
        smallLayout.scrollDirection = .horizontal
        smallLayout.itemSize = CGSize(width: 100, height: 100)
        let smallCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: smallLayout)
        smallCollectionView.dataSource = self
        smallCollectionView.delegate = self
        smallCollectionView.register(SmallCell.self, forCellWithReuseIdentifier: SmallCell.smallCellIdentifier)
        smallCollectionView.backgroundColor = .white
        return smallCollectionView
    }()
    
    private lazy var bigCollectionView: UICollectionView = {
        let bigLayout = UICollectionViewFlowLayout()
        bigLayout.scrollDirection = .horizontal
        bigLayout.itemSize = CGSize(width: 300, height: 300)
        let bigCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: bigLayout)
        bigCollectionView.dataSource = self
        bigCollectionView.delegate = self
        bigCollectionView.register(BigCell.self, forCellWithReuseIdentifier: BigCell.bigCellIdentifier)
        bigCollectionView.backgroundColor = .white
        return bigCollectionView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Example Label"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        
        setupViews()
        setupConstraints()
        
    }
}

//MARK: - Table view data source methods
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == smallCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallCell.smallCellIdentifier, for: indexPath) as! SmallCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigCell.bigCellIdentifier, for: indexPath) as! BigCell
            return cell
        }
    }
}
//MARK: - Setup views and constraints methods

private extension ViewController {
    
    func setupViews() {
        view.addSubview(label)
        view.addSubview(smallCollectionView)
        view.addSubview(bigCollectionView)
    }
    
    func setupConstraints() {
        smallCollectionView.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(150)
        }
        
        bigCollectionView.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(smallCollectionView.snp.bottom).offset(20)
            make.height.equalTo(400)
        }
        
        label.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(bigCollectionView.snp.bottom).offset(20)
        }
    }
}
