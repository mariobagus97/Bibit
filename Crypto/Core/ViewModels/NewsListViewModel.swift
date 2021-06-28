//
//  NewsListViewModel.swift
//  Crypto
//
//  Created by Muhammad Ario Bagus on 29/04/21.
//


import Foundation
import RxSwift

class NewsListViewModel: BaseViewModel {
    
    private var repo: ICryptoRepository
    init(repo : ICryptoRepository) {
        self.repo = repo
    }
    
    public let NewsList = BehaviorSubject<[News]>(value: [News]())
    
    func GetNewsList(category : String) {
        repo.GetNewsCrypto(category: category)
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: { (value) in
                self.NewsList.onNext(value)
            }, onFailure: { (error) in
//                print(error.localizedDescription)
            }, onDisposed: {
                
            })
    }
   

}

