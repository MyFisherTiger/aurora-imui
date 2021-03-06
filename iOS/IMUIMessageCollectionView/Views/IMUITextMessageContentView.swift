//
//  IMUITextMessageContentView.swift
//  sample
//
//  Created by oshumini on 2017/6/11.
//  Copyright © 2017年 HXHG. All rights reserved.
//

import UIKit

@objc open class IMUITextMessageContentView: UIView, IMUIMessageContentViewProtocol {
  @objc open static var outGoingTextColor = UIColor(netHex: 0x7587A8)
  @objc open static var inComingTextColor = UIColor.white
  
  @objc open static var outGoingTextFont = UIFont.systemFont(ofSize: 18)
  @objc open static var inComingTextFont = UIFont.systemFont(ofSize: 18)
  @objc open static var outGoingTextLineHeight: CGFloat = 2.0
  @objc open static var inComingTextLineHeight: CGFloat = 2.0
  
  var textMessageLable = IMUITextView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(textMessageLable)
    textMessageLable.numberOfLines = 0
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func layoutContentView(message: IMUIMessageModelProtocol) {
    
    textMessageLable.frame = CGRect(origin: CGPoint.zero, size: message.layout.bubbleContentSize)
    
    self.layoutToText(with: message.text(), isOutGoing: message.isOutGoing)
  }
  
  func layoutToText(with text: String, isOutGoing: Bool) {
    let attributedString = NSMutableAttributedString(string: text)
    let mutableParagraphStyle = NSMutableParagraphStyle()
    
    
    if isOutGoing {
      mutableParagraphStyle.lineSpacing = IMUITextMessageContentView.outGoingTextLineHeight
      attributedString.addAttributes([
        NSAttributedStringKey.font: IMUITextMessageContentView.outGoingTextFont,
        NSAttributedStringKey.paragraphStyle: mutableParagraphStyle,
        NSAttributedStringKey.foregroundColor: IMUITextMessageContentView.outGoingTextColor
        ], range: NSMakeRange(0, text.count))
    } else {
      mutableParagraphStyle.lineSpacing = IMUITextMessageContentView.inComingTextLineHeight
      attributedString.addAttributes([
        NSAttributedStringKey.font: IMUITextMessageContentView.inComingTextFont,
        NSAttributedStringKey.paragraphStyle: mutableParagraphStyle,
        NSAttributedStringKey.foregroundColor: IMUITextMessageContentView.inComingTextColor
        ], range: NSMakeRange(0, text.count))
    }
    textMessageLable.attributedText = attributedString
  }
}
