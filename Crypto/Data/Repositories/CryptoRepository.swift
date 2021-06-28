//
//  CryptoRepository.swift
//  Crypto
//
//  Created by Muhammad Ario Bagus on 28/04/21.
//

import Foundation
import RxSwift

protocol ICryptoRepository {
    func GetListCrypto() -> Single<[Crypto]>
    func GetNewsCrypto(category : String) -> Single<[News]>
}

class CryptoRepository: ICryptoRepository  {
    
    private let cryptoService : CryptoService
    init(cryptoService : CryptoService) {
        self.cryptoService = cryptoService
    }
    
    func GetListCrypto() -> Single<[Crypto]> {
        return cryptoService.GetCryptoList().map({$0.toEntity()})
    }
    
    func GetNewsCrypto(category : String) -> Single<[News]> {
        return cryptoService.GetCryptoNews(category: category).map({$0.toEntity()})
    }
    
}
