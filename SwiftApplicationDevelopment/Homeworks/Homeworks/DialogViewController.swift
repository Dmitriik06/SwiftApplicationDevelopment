//
//  DialogViewController.swift
//  Homeworks
//
//  Created by Дмитрий Кузнецов on 15.06.2023.
//

import UIKit

class DialogViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: "cell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    

}
