//
//  UUIDGenerantViewController.swift
//  UUIDGenerator-MVVM
//
//  Created by mhlee on 2018. 5. 9..
//  Copyright © 2018년 mhlee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class UUIDGenerantViewController: UIViewController {
  let disposeBag = DisposeBag()
  
  var uuidGenViewModel: UUIDGenerantViewModel!
  
  var customView: UUIDGenerantView {
    return view as! UUIDGenerantView
  }
  
  override func loadView() {
    view = UUIDGenerantView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    uuidGenViewModel = UUIDGenerantViewModel()
    
    bind()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func bind() {
    customView.genButton.rx.tap.subscribe(onNext: {
      self.uuidGenViewModel.generateUUID()
    }).disposed(by: disposeBag)
    
    uuidGenViewModel.uuidObservable.subscribeOn(MainScheduler.instance).subscribe(onNext: { uuid in
      self.customView.uuidLabel.text = uuid
    }).disposed(by: disposeBag)
    
//    customView.genButton.rx.tap.subscribe(onNext: {
//      self.uuidGenViewModel.inputs.generateUUID()
//    }).disposed(by: disposeBag)
//    
//    uuidGenViewModel.outputs.uuidObservable.subscribeOn(MainScheduler.instance).subscribe(onNext: { uuid in
//      self.customView.uuidLabel.text = uuid
//    }).disposed(by: disposeBag)
  }
  
}

