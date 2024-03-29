//
//  ExperienceLetterViewController.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/18.
//

import UIKit

final class ExperienceLetterViewController: UIViewController {
    
    // MARK: - Properties
    
    private let giftViewModel: ExperienceGiftViewModel
    
    // MARK: - UI Components
    
    private let experienceLetterView = ExperienceLetterView()

    // MARK: - Life Cycles
    
    init(viewModel: ExperienceGiftViewModel) {
        self.giftViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        
        view = experienceLetterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAddTarget()
        setDelegate()
        setGesture()
    }
}

extension ExperienceLetterViewController {
    
    func setUI() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func setAddTarget() {
        experienceLetterView.giftButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setDelegate() {
        experienceLetterView.recipientNameTextField.delegate = self
        experienceLetterView.senderTextField.delegate = self
        experienceLetterView.phoneFirstText.delegate = self
        experienceLetterView.phoneMidText.delegate = self
        experienceLetterView.phoneEndText.delegate = self
        experienceLetterView.navigationBar.delegate = self
    }
    
    @objc
    func buttonTapped() {
        giftViewModel.giftLetterInfo(letter: experienceLetterView.letterTextView.text ?? "")
        giftViewModel.postReservationUser()
        
        let nav = CompleteViewController()
        nav.fromExperience = true
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        if experienceLetterView.phoneMidText.textFieldStatus == .correct
            && experienceLetterView.phoneEndText.textFieldStatus == .correct {
            giftViewModel.giftPhoneInfo(phone: "010\(experienceLetterView.phoneMidText.text ?? "")\(experienceLetterView.phoneEndText.text ?? "")")
        }
        view.endEditing(true)
    }
    
    func validateTextField(textField: UITextField, isValid: Bool) {
        if isValid {
            if let customTextField = textField as? CustomTextField {
                customTextField.textFieldStatus = .correct
            }
        } else {
            if let customTextField = textField as? CustomTextField {
                customTextField.textFieldStatus = .normal
            }
        }
    }
}


extension ExperienceLetterViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        switch textField {
        case experienceLetterView.recipientNameTextField,experienceLetterView.senderTextField:
            validateTextField(textField: textField, isValid: newText.isOnlyKorean())
        case experienceLetterView.phoneFirstText:
            if newText.count > 3 {
                return false
            }
            validateTextField(textField: textField, isValid: newText == "010")
        case experienceLetterView.phoneMidText, experienceLetterView.phoneEndText:
            if newText.count > 4 {
                return false
            }
            validateTextField(textField: textField, isValid: newText.isValidPhoneNumber())
        default:
            break
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let currentText = textField.text ?? ""
        if currentText.isEmpty {
            if let customTextField = textField as? CustomTextField {
                customTextField.textFieldStatus = .normal
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if experienceLetterView.phoneMidText.textFieldStatus == .correct 
            && experienceLetterView.phoneEndText.textFieldStatus == .correct {
            giftViewModel.giftPhoneInfo(phone: "010\(experienceLetterView.phoneMidText.text ?? "")\(experienceLetterView.phoneEndText.text ?? "")")
        }
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
}

extension ExperienceLetterViewController: NavigationBarProtocol {
    
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
