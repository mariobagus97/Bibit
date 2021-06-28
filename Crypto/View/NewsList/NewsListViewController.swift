//
//  NewsListViewController.swift
//  Crypto
//
//  Created by Muhammad Ario Bagus on 29/04/21.
//

import UIKit
import RxCocoa
import RxSwift

class NewsListViewController: BaseViewController<NewsListViewModel> {
    
    @IBOutlet weak var NewsTableView: UITableView!
    
    var CryptoCategories : String!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.GetNewsList(category: CryptoCategories)
       
        viewModel.NewsList.bind(to: NewsTableView.rx.items(cellIdentifier: "cellId", cellType: NewsListTableViewCell.self)) { (row,item,cell) in
            cell.initialize(item: item)
        }
            .disposed(by: disposeBag)
        setupTableView()
    }
    
    func setupTableView() {
        NewsTableView.rowHeight = UITableView.automaticDimension
        NewsTableView.register(UINib(nibName: "NewsListTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
        
        NewsTableView.reloadData()
    }

}
