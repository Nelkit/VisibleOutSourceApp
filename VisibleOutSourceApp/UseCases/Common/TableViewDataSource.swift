//
//  PostTableViewDataSource.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 8/3/22.
//

import Foundation
import UIKit

class TableViewDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource, UITableViewDelegate{
    
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (Int,CELL, T) -> () = {_,_,_ in }
    
    
    init(cellIdentifier : String, items : [T], configureCell : @escaping (Int,CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        
        let item = self.items[indexPath.row]
        self.configureCell(indexPath.row, cell, item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
