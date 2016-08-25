//
//  ErrorStatusView.swift
//  3MobileTV
//
//  Created by MarioHahn on 25/08/16.
//  Copyright © 2016 Hutchison Drei Austria GmbH. All rights reserved.
//

import Foundation
import UIKit

public class ErrorStatusView: UIView, ErrorStatusDisplaying {
    
    public var retry: (()->Void)? {
        didSet{
            guard let _ = retry else { return }
            
            errorActionButton.hidden = false
        }
    }
    
    public var error: NSError? {
        didSet{
            
            guard let error = error else { return }
            
            errorDescriptionLabel.text = error.localizedDescription
        }
    }
    
    let errorTitleLabel: UILabel = {
        $0.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        $0.textColor = UIColor.whiteColor()
        $0.textAlignment = .Center
        
        return $0
    }(UILabel())
    
    let errorDescriptionLabel: UILabel = {
        $0.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption2)
        $0.textColor = UIColor.whiteColor()
        
        return $0
    }(UILabel())
    
    let errorActionButton: UIButton = {
        $0.setTitle("Wiederholen", forState: .Normal)
        $0.hidden = true
        
        return $0
    }(UIButton(type: UIButtonType.System))
    
    let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .Vertical
        $0.spacing = 10
        
        return $0
    }(UIStackView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(errorTitleLabel)
        stackView.addArrangedSubview(errorDescriptionLabel)
        stackView.addArrangedSubview(errorActionButton)
        
        NSLayoutConstraint.activateConstraints([
            stackView.leadingAnchor.constraintEqualToAnchor(leadingAnchor),
            stackView.trailingAnchor.constraintEqualToAnchor(trailingAnchor),
            stackView.topAnchor.constraintEqualToAnchor(topAnchor),
            stackView.bottomAnchor.constraintEqualToAnchor(bottomAnchor)
            ])
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}