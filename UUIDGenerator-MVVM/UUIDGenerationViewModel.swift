//
//  UUIDGenerationViewModel.swift
//  UUIDGenerator-MVVM
//
//  Created by mhlee on 2018. 5. 9..
//  Copyright © 2018년 mhlee. All rights reserved.
//

import Foundation
import RxSwift

protocol UUIDGenerationViewModelInput {
  func generateUUID()
}

protocol UUIDGenerationViewModelOutput {
  var uuidObservable: Observable<String> { get }
}

//protocol UUIDGenerationViewModelInterface {
//  var inputs: ViewModelInput { get }
//  var outputs: ViewModelOutput { get }
//}

class UUIDGenerationViewModel {

  let uuidModel: UUIDModel
  
  init() {
    uuidModel = UUIDModel()
  }
}

extension UUIDGenerationViewModel: UUIDGenerationViewModelInput {
  func generateUUID() {
    let uuid = UUID().uuidString
    uuidModel.updateUUID(uuid)
  }
}

extension UUIDGenerationViewModel: UUIDGenerationViewModelOutput {
  var uuidObservable: Observable<String> { return uuidModel.uuid.asObservable() }
}

//extension UUIDGenerationViewModel: ViewModelInterface {
//  var inputs: ViewModelInput { return self }
//  var outputs: ViewModelOutput { return self }
//}
