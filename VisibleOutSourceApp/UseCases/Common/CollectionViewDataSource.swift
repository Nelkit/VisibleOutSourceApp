//
//  CollectionViewDataSource.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 9/3/22.
//

import Foundation
import UIKit

class CollectionViewDataSource<CELL : UICollectionViewCell,T> : NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (Int,CELL, T) -> () = {_,_,_ in }
    
    init(cellIdentifier : String, items : [T], configureCell : @escaping (Int,CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CELL
       
       let item = self.items[indexPath.row]
       self.configureCell(indexPath.row, cell, item)
       return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let padding: CGFloat =  50
           let collectionViewSize = collectionView.frame.size.width - padding
           
           return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }

}
