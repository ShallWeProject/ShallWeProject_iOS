//
//  CustomDropDownButton.swift
//  ShallWe
//
//  Created by KJ on 12/24/23.
//

import UIKit

import Then
import SnapKit

final class CustomDropDownButton: UIButton {
    
    // MARK: - Properties
    
    var type: DropDownTitleType?
    
    // MARK: - Initializer
    
    init(_ type: DropDownTitleType) {
        super.init(frame: .zero)
        self.type = type
        switch type {
        case .popular:
            setTitle("인기순", for: .normal)
        case .recommend:
            setTitle("추천순", for: .normal)
        case .priceMax:
            setTitle("가격높은순", for: .normal)
        case .priceMin:
            setTitle("가격낮은순", for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomDropDownButton {
    
    // MARK: - Methods
    
    func chengaButtonType(_ type: DropDownTitleType) {
        self.type = type
        switch type {
        case .popular:
            setTitle("인기순", for: .normal)
        case .recommend:
            setTitle("추천순", for: .normal)
        case .priceMax:
            setTitle("가격높은순", for: .normal)
        case .priceMin:
            setTitle("가격낮은순", for: .normal)
        }
    }
}
