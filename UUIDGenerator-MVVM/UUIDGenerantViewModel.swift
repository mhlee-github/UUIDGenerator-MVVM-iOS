//
//  UUIDGenerantViewModel.swift
//  UUIDGenerator-MVVM
//
//  Created by mhlee on 2018. 5. 9..
//  Copyright © 2018년 mhlee. All rights reserved.
//

import Foundation
import RxSwift

protocol UUIDGenerantViewModelInput {
  func generateUUID()
}

protocol UUIDGenerantViewModelOutput {
  var uuidObservable: Observable<String> { get }
}

//protocol UUIDGenerantViewModelInterface {
//  var inputs: ViewModelInput { get }
//  var outputs: ViewModelOutput { get }
//}

class UUIDGenerantViewModel {

  let uuidModel: UUIDModel
  
  init() {
    uuidModel = UUIDModel()
  }
}

extension UUIDGenerantViewModel: UUIDGenerantViewModelInput {
  func generateUUID() {
    let uuid = UUID().uuidString
    uuidModel.updateUUID(uuid)
  }
}

extension UUIDGenerantViewModel: UUIDGenerantViewModelOutput {
  var uuidObservable: Observable<String> { return uuidModel.uuid.asObservable() }
}

//extension UUIDGenerantViewModel: ViewModelInterface {
//  var inputs: ViewModelInput { return self }
//  var outputs: ViewModelOutput { return self }
//}
