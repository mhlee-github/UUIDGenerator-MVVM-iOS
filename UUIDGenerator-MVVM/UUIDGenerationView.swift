//
//  UUIDGenerationView.swift
//  UUIDGenerator-MVVM
//
//  Created by mhlee on 2018. 5. 9..
//  Copyright © 2018년 mhlee. All rights reserved.
//

import UIKit
import SnapKit

class UUIDGenerationView: UIView {
  let uuidLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    return label
  }()
  
  let genButton: UIButton = {
    let button = UIButton()
    button.setTitle("gen", for: .normal)
    button.setTitleColor(.black, for: .normal)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setViews()
    layoutViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    setViews()
    layoutViews()
  }
  
  func setViews() {
    backgroundColor = .white
    addSubview(uuidLabel)
    addSubview(genButton)
  }
  
  func layoutViews() {
    uuidLabel.snp.makeConstraints { make in
      make.centerY.equalTo(self)
      make.left.equalTo(self).offset(20)
      make.right.equalTo(self).offset(-20)
    }
    genButton.snp.makeConstraints { make in
      make.top.equalTo(uuidLabel.snp.bottom).offset(10)
      make.left.equalTo(self).offset(20)
      make.right.equalTo(self).offset(-20)
    }
  }
  
}
