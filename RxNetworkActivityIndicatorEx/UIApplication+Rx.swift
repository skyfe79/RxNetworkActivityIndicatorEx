//
//  UIApplication+Rx.swift
//  RxNetworkActivityIndicatorEx
//
//  Created by burt on 2016. 2. 1..
//  Copyright © 2016년 BurtK. All rights reserved.
//

//  @see https://github.com/MadsBogeskov/RxSwift/commit/bda14c48c78713e5d4177653a00ee96dfd07a3cd
import Foundation

#if os(iOS) || os(tvOS)
    import UIKit
    
#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif

extension UIApplication {
    
    public var rx_networkActivityIndicatorVisible: AnyObserver<Bool> {
        return AnyObserver { event in
            MainScheduler.ensureExecutingOnScheduler()
            switch event {
            case .Next(let value):
                self.networkActivityIndicatorVisible = value
            case .Error:
                self.networkActivityIndicatorVisible = false
                break
            case .Completed:
                break
            }
        }
    }
    
    
}

#endif