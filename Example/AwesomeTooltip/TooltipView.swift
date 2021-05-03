//
//  TooltipView.swift
//  AwesomeTooltip_Example
//
//  Created by Санжар Алим on 02.05.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

protocol TooltipViewDelegate: AnyObject {
    func tooltipViewShouldClose(_ tooltipView: TooltipView)
}

final class TooltipView: UIView {
    private static let widthInset: CGFloat = 16
    private static let heightInset: CGFloat = 64
    private static let maxWidth: CGFloat = UIScreen.main.bounds.width - 32
    
    weak var delegate: TooltipViewDelegate?
    
    @IBOutlet private var messageLabel: UILabel!
    @IBOutlet private var doneButton: UIButton!
    
    init() {
        super.init(frame: .zero)
        
        loadFromNib(.main)
        setupFrame()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadFromNib(_ bundle: Bundle?) {
        let className = String(describing: type(of: self))
        guard let view = bundle?.loadNibNamed(className,
                                              owner: self,
                                              options: nil)?.first as? UIView else {
            fatalError("Xib not found: \(self)")
        }
        
        view.frame = bounds
        addSubview(view)
    }
    
    private func setupFrame() {
        let messageSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let messageFrame = "Message".boundingRect(with: messageSize,
                                                        options: .usesLineFragmentOrigin,
                                                        attributes: messageLabel.attributedText?.attributesAtFullRange,
                                                        context: nil)
        
        var viewWidth = messageFrame.width + Self.widthInset
        
        if viewWidth > Self.maxWidth {
            viewWidth = Self.maxWidth
        }
        
        frame = CGRect(x: 0,
                       y: 0,
                       width: viewWidth,
                       height: messageFrame.height + Self.heightInset)
    }
    
    @IBAction private func doneButtonPressed(_ sender: UIButton) {
        delegate?.tooltipViewShouldClose(self)
    }
}

extension NSAttributedString {
    @objc public var attributesAtFullRange: [NSAttributedString.Key: Any] {
        return attributes(at: 0, longestEffectiveRange: nil, in: NSRange(location: 0, length: length))
    }
}
