//
//  FooterForPresentCards.swift
//  Cloudpayments
//
//  Created by Cloudpayments on 06.07.2023.
//

import UIKit

final class FooterForPresentCard: UIView {
    
    @IBOutlet private weak var savingButton: UIButton!
    @IBOutlet private weak var receiptButton: Button!
    @IBOutlet private weak var defaultInformationButton: UIButton!
    @IBOutlet private weak var forcedInformationButton: UIButton!
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet private weak var emailInputView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: TextField!
    
    @IBOutlet weak var attentionView: UIView!
    @IBOutlet weak var attentionImage: UIImageView!
    @IBOutlet private weak var paymentEmailLabel: UILabel!
    
    var isHiddenCardView: Bool {
        get { return savingButton.isHidden }
        set {
            savingButton.superview?.isHidden = newValue
            receiptButton.superview?.isHidden = newValue
            forcedInformationButton.superview?.isHidden = newValue
        }
    }
    
    var isHiddenAttentionView: Bool {
        get { return attentionView.isHidden }
        set {
            attentionView.isHidden = newValue
        }
    }
    
    //email view
    var emailBorderColor: UIColor {
        get { return .clear }
        set { emailInputView.layer.borderColor = newValue.cgColor }
    }
    
    var isSelectedReceipt: Bool {
        get { return receiptButton.isSelected }
        set {
            receiptButton.isSelected = newValue
        }
    }
    
    var isSelectedSave: Bool? {
        get {
            guard let isOnHidden = savingButton.superview?.isHidden, !isOnHidden else { return nil}
            return savingButton.isSelected
        }
        set {
            guard let newValue = newValue else { return }
            return savingButton.isSelected = newValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addXib()
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addXib()
        setup()
    }
    
    private func setup() {
        let spasing: CGFloat = 10
        
        [savingButton, receiptButton].forEach {
            let unselected = UIImage.iconUnselected
            let selected = UIImage.iconSelected
            
            $0.setImage(unselected, for: .normal)
            $0.setImage(selected, for: .selected)
            $0.titleEdgeInsets = .init(top: 0, left: spasing, bottom: 0, right: -spasing)
            $0.contentEdgeInsets.right = spasing
            $0.contentHorizontalAlignment = .center
            $0.contentVerticalAlignment = .center
        }
        
        [defaultInformationButton, forcedInformationButton].forEach {
            let attention = UIImage.icn_attention
            
            $0?.setImage(attention, for: .normal)
        }
        
        attentionImage.image = UIImage.icn_attention
        attentionImage.colorRenderForImage = UIColor(red: 0.95, green: 0.79, blue: 0.04, alpha: 1)
        savingButton.superview?.isHidden = true
        forcedInformationButton.superview?.isHidden = true
    }

    func addTarget(_ target: Any, action: Selector, type: TypeButton) {
        switch type {
        case .info:
            defaultInformationButton.addTarget(target, action: action, for: .touchUpInside)
            forcedInformationButton.addTarget(target, action: action, for: .touchUpInside)
        case .receipt:
            receiptButton.addTarget(target, action: action, for: .touchUpInside)
        case .saving:
            savingButton.addTarget(target, action: action, for: .touchUpInside)
        }
    }
    
    func setup(_ status: SaveCardState) {
        switch status {
        case .isOnCheckbox:
            isSelectedSave = true
            savingButton.superview?.isHidden = false
            savingButton.superview?.isHidden = false
            forcedInformationButton.superview?.isHidden = true
        case .isOnHint:
            savingButton.superview?.isHidden = true
            forcedInformationButton.superview?.isHidden = false
        case .none:
            savingButton.superview?.isHidden = true
            forcedInformationButton.superview?.isHidden = true
        }
    }
}

extension FooterForPresentCard {
    enum TypeButton {
        case saving
        case receipt
        case info
    }
}
