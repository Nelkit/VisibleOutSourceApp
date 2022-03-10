//
//  CommentView.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 9/3/22.
//

import UIKit

class CommentView: UIViewController {
    var postId: Int?
    private var commentViewModel : CommentViewModel!
    private var dataSource : TableViewDataSource<CommentCell,Comment>!
    
    @IBOutlet weak var commentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        setupUI()
        setupViewModel()
    }
    
    func setupUI(){
        // Set Up search bar configuration
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.searchTextField.backgroundColor = UIColor.white
        searchController.searchBar.tintColor = .white
        searchController.searchBar.placeholder = "Buscar Comentarios"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        
        // Set Up table view configuration
        commentTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        commentTableView.register(UINib(nibName: CommentCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CommentCell.reuseIdentifier)
        commentTableView.setLoadingView()
    }
    
    func setupViewModel(){
        self.commentViewModel =  CommentViewModel()
        if let postId = postId {
            self.commentViewModel.getCommentsByPost(postId: postId)
        }
        self.commentViewModel.bindCommentViewModelToView = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        guard let viewModel = self.commentViewModel else { return }
        guard let posts = viewModel.comments else { return }
        
        self.dataSource = TableViewDataSource(cellIdentifier: CommentCell.reuseIdentifier, items: posts, configureCell: { (row, cell, comment) in
            cell.comment = comment
            cell.index = row
        })
        
        DispatchQueue.main.async {
            self.commentTableView.dataSource = self.dataSource
            self.commentTableView.delegate = self.dataSource

            self.commentTableView.reloadData()
            self.commentTableView.removeLoadingView()
        }
    }
}

// MARK: Search delegate events
extension CommentView:UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, text.count > 3 else {
            commentViewModel.setOriginalComments()
            return
        }
        commentViewModel.searchComment(text: text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        commentViewModel.setOriginalComments()
    }
}
