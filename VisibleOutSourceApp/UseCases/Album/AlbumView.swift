//
//  AlbumView.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 9/3/22.
//

import UIKit

class AlbumView: UIViewController {
    var postId: Int?
    private var albumViewModel : AlbumViewModel!
    private var dataSource : CollectionViewDataSource<PhotoCell,Photo>!
    
    @IBOutlet weak var albumCollectionView: UICollectionView!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
    }
    
    
    func setupUI(){
        // Set Up collection view configuration
        albumCollectionView.register(UINib(nibName: PhotoCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: PhotoCell.reuseIdentifier)
        albumCollectionView.setLoadingView()
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        layout.sectionInset = UIEdgeInsets(top: 20, left: 15, bottom: 10, right: 15)
        albumCollectionView.collectionViewLayout = layout
    }

    func setupViewModel(){
        self.albumViewModel =  AlbumViewModel()
        if let postId = postId {
            self.albumViewModel.getAlbumByPost(postId: postId)
        }
        self.albumViewModel.bindAlbumViewModelToView = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        guard let viewModel = self.albumViewModel else { return }
        guard let photos = viewModel.photos else { return }
        
        self.dataSource = CollectionViewDataSource(cellIdentifier: PhotoCell.reuseIdentifier, items: photos, configureCell: { (row, cell, photo) in
            cell.photo = photo
        })

        DispatchQueue.main.async {
            self.albumCollectionView.dataSource = self.dataSource
            self.albumCollectionView.delegate = self.dataSource

            self.albumCollectionView.reloadData()
            self.albumCollectionView.removeLoadingView()
        }
    }
    
    
}
