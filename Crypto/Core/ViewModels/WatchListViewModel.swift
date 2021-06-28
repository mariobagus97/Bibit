//
//  WatchListViewModel.swift
//  Crypto
//
//  Created by Muhammad Ario Bagus on 28/04/21.
//

import Foundation
import RxSwift
import RxCocoa

class WatchListViewModel: BaseViewModel {
    
    private var repo: ICryptoRepository
    init(repo : ICryptoRepository) {
        self.repo = repo
    }
    var desc = PublishSubject<String>()
    
    public let ListCrypto = BehaviorRelay<[Crypto]>(value: [Crypto]())
    
    func getListCrypto() {
        repo.GetListCrypto()
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: { (value) in
                self.ListCrypto.accept(value)
            }, onFailure: { (error) in
                self.alertError.onNext(error.localizedDescription)
            })
    }
   

}
