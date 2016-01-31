//
//  ViewController.swift
//  RxNetworkActivityIndicatorEx
//
//  Created by burt on 2016. 2. 1..
//  Copyright © 2016년 BurtK. All rights reserved.
//

import UIKit
import RxSwift

// intervalObservable >- subject >- networkActivityIndicatorVisible
class ViewController: UIViewController {
    
    var subject : PublishSubject<Bool> = PublishSubject()
    
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        subject
            .asObservable()
            .bindTo(UIApplication.sharedApplication().rx_networkActivityIndicatorVisible)
            .addDisposableTo(disposeBag)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    
        let intervalObservable = Observable<Int>.interval(0.3, scheduler: MainScheduler.instance)
            .map { v -> Bool in
                print(v)
                if v < 50 {
                    return true
                } else {
                    return false
                }
            }
        
        intervalObservable
            .bindTo(subject)
            .addDisposableTo(disposeBag)

        /**
         * It is also possible
        intervalObservable
            .bindTo(UIApplication.sharedApplication().rx_networkActivityIndicatorVisible)
            .addDisposableTo(disposeBag)
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

