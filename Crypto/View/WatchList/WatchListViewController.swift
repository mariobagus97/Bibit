//
//  WatchListViewController.swift
//  Crypto
//
//  Created by Muhammad Ario Bagus on 28/04/21.
//

import UIKit
import RxCocoa
import RxSwift

class WatchListViewController: BaseViewController<WatchListViewModel> {

    @IBOutlet weak var CryptoTableView: UITableView!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Toplists"
        
        viewModel.getListCrypto()
       
        
        viewModel.ListCrypto.bind(to: CryptoTableView.rx.items(cellIdentifier: "cellId", cellType: WatchListTableViewCell.self)) { (row,item,cell) in
            cell.initialize(item: item)}
            .disposed(by: disposeBag)
       
        CryptoTableView.rx
            .modelSelected(Crypto.self)
            .subscribe(onNext:  { value in
                self.gotoNewsList(category: value.cryptoName)
            })
            .disposed(by: disposeBag)
        
        setupTableView()
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
    }
    
    func gotoNewsList(category : String){
        let vc = NewsListViewController()
        vc.CryptoCategories = category
        present(vc, animated: true, completion: nil)
    }
    
    func setupTableView() {
        CryptoTableView.rowHeight = UITableView.automaticDimension
        CryptoTableView.register(UINib(nibName: "WatchListTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
        
        CryptoTableView.reloadData()
        CryptoTableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        viewModel.getListCrypto()
        refreshControl.endRefreshing()
    }
}
