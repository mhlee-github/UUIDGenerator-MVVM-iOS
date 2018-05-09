//
//  UUIDModel.swift
//  UUIDGenerator-MVVM
//
//  Created by mhlee on 2018. 5. 9..
//  Copyright © 2018년 mhlee. All rights reserved.
//

import Foundation
import RxSwift

class UUIDModel {
  lazy var uuid: Variable<String> = {
    let uuid = Variable("")
    return uuid
  }()
  
  func updateUUID(_ uuid: String) {
    self.uuid.value = uuid
  }
}
