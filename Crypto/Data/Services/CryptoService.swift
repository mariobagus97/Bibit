//
//  CryptoService.swift
//  Crypto
//
//  Created by Muhammad Ario Bagus on 28/04/21.
//

import Foundation
import RxSwift


class CryptoService  {
    
    func GetCryptoList() -> Single<WatchListResponse>  {
        
        return UrlBuilder<WatchListResponse>()
            .SetUrl(urlSegment: "/top/totaltoptiervolfull")
            .AddParameter(key: "limit", value: 50)
            .AddParameter(key: "tsym", value: "USD")
            .Execute(httpMethod: .get)
            .asSingle()
    }
    
    func GetCryptoNews(category : String) -> Single<NewsListResponse>  {
        return UrlBuilder<NewsListResponse>()
            .SetUrl(urlSegment: "/v2/news/")
            .AddParameter(key: "categories", value: category)
            .Execute(httpMethod: .get)
            .asSingle()
    }
    
    
}
