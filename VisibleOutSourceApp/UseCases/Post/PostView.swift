//
//  ViewController.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 8/3/22.
//

import UIKit

class PostView: UIViewController {
    private var postViewModel : PostViewModel!
    private var dataSource : TableViewDataSource<PostCell,Post>!
    
    @IBOutlet weak var postTableView: UITableView!
    
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
        searchController.searchBar.placeholder = "Buscar Post"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        
        // Set Up table view configuration
        postTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        postTableView.register(UINib(nibName: PostCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: PostCell.reuseIdentifier)
        postTableView.setLoadingView()
    }

    
    func setupViewModel(){
        self.postViewModel =  PostViewModel()
        self.postViewModel.bindPostViewModelToView = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        guard let viewModel = self.postViewModel else { return }
        guard let posts = viewModel.posts else { return }
        
        self.dataSource = TableViewDataSource(cellIdentifier: PostCell.reuseIdentifier, items: posts, configureCell: { (row, cell, post) in
            cell.nc = self.navigationController
            cell.post = post
        })
        
        DispatchQueue.main.async {
            self.postTableView.dataSource = self.dataSource
            self.postTableView.delegate = self.dataSource

            self.postTableView.reloadData()
            self.postTableView.removeLoadingView()
        }
    }
}

// MARK: Search delegate events
extension PostView:UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, text.count > 3 else {
            postViewModel.setOriginalPosts()
            return
        }
        postViewModel.searchPost(text: text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        postViewModel.setOriginalPosts()
    }
}


