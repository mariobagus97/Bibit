//
//  Container.swift
//  Crypto
//
//  Created by Muhammad Ario Bagus on 28/04/21.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class Container {

    let container = Swinject.Container()
    
    init() {
        self.registerServices()
        self.registerRepositories()
        container.autoregister(WatchListViewModel.self, initializer: WatchListViewModel.init)
        container.autoregister(NewsListViewModel.self, initializer: NewsListViewModel.init)
    }
    
    
    func getViewModel<T:BaseViewModel>(viewModel:T.Type) -> T? {
        
        if let vm = get(type: viewModel) {
            return vm
        }
        register(type: viewModel.self)
        return get(type: viewModel.self)
    }
    
    func register<T:NSObject>(type:T.Type) {
        container.autoregister(T.self, initializer: type.init)
    }
    
    func get<T:NSObject>(type:T.Type) -> T? {
        return container.resolve(type)
    }
    
    func registerRepositories() {
        container.autoregister(ICryptoRepository.self, initializer: CryptoRepository.init)
    }
    
    func registerServices() {
        container.autoregister(CryptoService.self, initializer: CryptoService.init)
    }
    
}

