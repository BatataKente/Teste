//
//  EditProfileViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

protocol EditProfileViewModelProtocol {
    
    func setHobbiesStack(_ hobbies: [Hobbies], userHobbies: [String])
    func setInterestsStack(_ interests: [Interests], userInterests: [String])
    func setImage(URL: URL?, placeholderImage: UIImage?)
    func setStacks(personalDataStacks: [UIStackView], aboutWorkStacks: [UIStackView])
    func unfreezeButton()
    func freezeButton()
}

class EditProfileViewModel {
    
    var user: UpdateUserParameters = UpdateUserParameters(name: nil, phone_number: nil, email: nil, is_active: nil, is_superuser: nil, occupation: nil, work_model: nil, hobbies: nil, interests: nil, message: nil)
    
    var photo: URL?
    
    var delegate: EditProfileViewModelProtocol?
    
    /// create a Label with default of editing profile View
    /// - Parameters:
    ///   - text: the text of label
    ///   - color: the collor of text(default is Collorsbravve.label.rawValue)
    ///   - font: font(default: FontsBravve.medium.rawValue)
    /// - Returns: the label
    private let sessionManager = SessionManager()
    
    private var password: String {
        guard let uuid = UserDefaults.standard.string(forKey: "userPassword") else {
            print("Unable to get user password")
            return ""
        }
        return uuid
    }
    
    private var uuid: String {
        guard let uuid = UserDefaults.standard.string(forKey: "userUUID") else {
            print("Unable to get user uuid")
            return ""
        }
        return uuid
    }
    
    func convertHobbiesToString(_ hobbies: [Hobbies]?) -> [String] {
        
        var hobbiesNames: [String] = []
        
        guard let hobbies = hobbies else {return []}

        for hobby in hobbies {
            
            guard let hobby = hobby.name else {return []}
            hobbiesNames.append(hobby)
        }
        
        return hobbiesNames
    }
    
    func convertInterestsToString(_ interests: [Interests]?) -> [String] {
        
        var interestsNames: [String] = []
        
        guard let interests = interests else {return []}
        for interest in interests {
            
            guard let interest = interest.name else {return []}
            interestsNames.append(interest)
        }
        
        return interestsNames
    }
    
    func setupHobbiesButtons(_ hobbies: [Hobbies],_ buttons: [UIButton]) -> [UIButton] {
        
        for i in 0...buttons.count-1 {

            let handler = {(action: UIAction) in

                if !buttons[i].isSelected {

                    self.delegate?.unfreezeButton()
                    self.user.hobbies?.append(hobbies[i])

                    buttons[i].configuration?.baseForegroundColor = .white
                    buttons[i].configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                }
                else {

                    self.user.hobbies = self.user.hobbies?.filter{$0.name != hobbies[i].name}

                    buttons[i].configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
                    buttons[i].configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                }

                buttons[i].isSelected = !buttons[i].isSelected
            }
            buttons[i].addAction(UIAction(handler: handler), for: .touchUpInside)
        }
        
        return buttons
    }
    
    func setupInterestsButtons(_ interests: [Interests],_ buttons: [UIButton]) -> [UIButton] {
        
        for i in 0...buttons.count-1 {

            let handler = {(action: UIAction) in

                if !buttons[i].isSelected {

                    self.user.interests?.append(interests[i])

                    buttons[i].configuration?.baseForegroundColor = .white
                    buttons[i].configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                }
                else {

                    self.user.interests = self.user.interests?.filter{$0.name != interests[i].name}

                    buttons[i].configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
                    buttons[i].configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                }
                self.delegate?.unfreezeButton()
                buttons[i].isSelected = !buttons[i].isSelected
            }

            buttons[i].addAction(UIAction(handler: handler), for: .touchUpInside)
        }
        
        return buttons
    }
    
    func refreshUserData() {
        
        sessionManager.getDataArray(uuid: uuid, endpoint: .usersPictures) { (statusCode, error, pictures: [Pictures]?) in
            
                    guard let pictures = pictures else {
                        print(statusCode as Any)
                    return
                }
                
                if !pictures.isEmpty {
                
                    guard let pictureUuid = pictures[0].picture else {
                        print(pictures[0].message as Any)
                    return
                }
                
                    self.sessionManager.getData(uuid: self.uuid, picture: pictureUuid, endpoint: .usersPicture) { (statusCode, error, pictureURL: PictureURL?) in
                    
                    guard let pictureURL = pictureURL?.picture_url else {
                        print(pictureURL?.message as Any)
                        print(statusCode as Any)
                        return
                    }
                    
                    DispatchQueue.main.async {
                        
                        self.delegate?.setImage(URL: URL(string: pictureURL), placeholderImage: UIImage(named: "photo"))
                    }
                }
            }
        }
        
        sessionManager.getData(uuid: uuid, endpoint: .usersUuid){ (statusCode, error, user: UpdateUserParameters?) in

            guard let user = user else {
                print(user?.message as Any)
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
            }
            
            DispatchQueue.main.async {
                
                var personalDataStacks: [UIStackView] = []
                var aboutWorkStacks: [UIStackView] = []
                
                if let phone_number = user.phone_number {
                    let numberStack = self.createStackView(labelText: "Número",
                                                           textFieldText: phone_number,
                                                           textFieldTextColor: .gray)
                    personalDataStacks.append(numberStack)
                }
                
                if let email = user.email {
                    
                    let emailStack = self.createStackView(labelText: "Email",
                                                          textFieldText: email,
                                                          textFieldTextColor: .gray)
                    personalDataStacks.append(emailStack)
                }
                
                if let name = user.name {
                    
                    let nameStack = self.createStackView(labelText: "Nome Completo",
                                                         textFieldText: name,
                                                         buttonImage: UIImage(named: IconsBravve.edit_blue.rawValue),
                                                         textFieldTag: 0)
                    personalDataStacks.append(nameStack)
                }
                
                let passwordStack = self.createStackView(labelText: "Senha",
                                                         textFieldText: self.password,
                                                         isSecureTextEntry: true,
                                                         buttonImage: UIImage(named: IconsBravve.edit_blue.rawValue),
                                                         textFieldTag: 1)
                personalDataStacks.append(passwordStack)
                
                if let occupationName = user.occupation?.name {

                    let officeStack = self.createStackView(labelText: "Área",
                                                           textFieldText: occupationName,
                                                           buttonImage: UIImage(named: IconsBravve.edit_blue.rawValue),
                                                           textFieldTag: 2)
                    aboutWorkStacks.append(officeStack)
                }
                
                if let workModelName = user.work_model?.name {

                    let workRegimeStack = self.createStackView(labelText: "Regime de trabalho",
                                                               textFieldText: workModelName,
                                                               buttonImage: UIImage(named: IconsBravve.edit_blue.rawValue),
                                                               textFieldTag: 3)
                    aboutWorkStacks.append(workRegimeStack)
                }
                
                self.delegate?.setStacks(personalDataStacks: personalDataStacks,
                                         aboutWorkStacks: aboutWorkStacks)
                
                self.sessionManager.getDataArray(endpoint: .usersHobbies) { (statusCode, error, hobbies: [Hobbies]? ) in

                    guard let hobbies = hobbies else {
                        
                        print(statusCode as Any)
                        print(error?.localizedDescription as Any)
                        return
                    }
                    
                    self.delegate?.setHobbiesStack(hobbies,
                                                   userHobbies: self.convertHobbiesToString(user.hobbies))
                }
                
                self.sessionManager.getDataArray(endpoint: .usersInterests) { (statusCode, error, interests: [Interests]? ) in

                    guard let interests = interests else {
                        
                        print(statusCode as Any)
                        print(error?.localizedDescription as Any)
                        return
                    }
                    
                    self.delegate?.setInterestsStack(interests,
                                                     userInterests: self.convertInterestsToString(user.interests))
                }
                
                self.user = user
            }
        }
    }
    
    func putUser() {
        
        sessionManager.putDataWithResponse(uuid: uuid,
                                           endpoint: .usersUuid,
                                           parameters: user) { (statusCode, error, user: UpdateUserParameters?) in
            
            guard let _ = user else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
            }
        }
    }
        
    func createLabel(_ text: String,
                     color: ColorsBravve = .label,
                     _ font: UIFont? = UIFont(name: FontsBravve.medium.rawValue,
                                          size: CGFloat(20).generateSizeForScreen)) -> UILabel {
        
        let label = UILabel()
        
        label.text = text
        label.textColor = UIColor(named: color.rawValue)
        label.textAlignment = .left
        label.font = font
        
        return label
    }
    
    /// Setup Super Stack with default of editing profile View
    /// - Parameters:
    ///   - stack: the stack
    ///   - alignment: the alignment(default is UIKit default stackView alignment)
    func setupStack(_ stack: UIStackView, alignment: UIStackView.Alignment? = nil) {
        
        stack.axis = .vertical
        stack.spacing = CGFloat(15).generateSizeForScreen
        if let alignment = alignment {stack.alignment = alignment}
    }
    
    /// Creates a stackView in default of EditProfileView, with a textField, margins and label
    /// - Parameters:
    ///   - labelText: The label of stack
    ///   - textFieldText: the text of text field, if initialize with a text by default
    ///   - textFieldTextColor: the textFieldTextColor
    ///   - isSecureTextEntry: if text field initialize  with secure entry
    ///   - buttonImage: the button Image(if not have, the button also wont be created)
    /// - Returns: The stackView
    func createStackView(labelText: String,
                         textFieldText: String,
                         textFieldTextColor: UIColor? = UIColor(named: ColorsBravve.label.rawValue),
                         isSecureTextEntry: Bool = false,
                         buttonImage: UIImage? = nil,
                         textFieldTag: Int? = nil) -> UIStackView {
        
        let verticalMargins = CGFloat(12).generateSizeForScreen
        let horizontalMargins = CGFloat(17).generateSizeForScreen
        
        let label = UILabel()
        label.text = labelText
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue,
                            size: CGFloat(11).generateSizeForScreen)
        
        let textField = UITextField()
        textField.text = textFieldText
        textField.textColor = textFieldTextColor
        textField.isEnabled = false
        textField.font = UIFont(name: FontsBravve.medium.rawValue,
                                size: CGFloat(15).generateSizeForScreen)
        textField.isSecureTextEntry = isSecureTextEntry
        if let textFieldTag = textFieldTag {textField.tag = textFieldTag}
        
        let stackView = UIStackView(arrangedSubviews: [label, textField])
        stackView.axis = .vertical
        stackView.spacing = CGFloat(5).generateSizeForScreen
        stackView.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stackView.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: verticalMargins,
                                               left: horizontalMargins,
                                               bottom: verticalMargins,
                                               right: horizontalMargins)
        
        if let buttonImage = buttonImage {
            
            let button = UIButton()
            button.setImage(buttonImage, for: .normal)
            stackView.addSubview(button)
            
            let handler = {(action: UIAction) in
                
                if !textField.isEnabled {
                    
                    stackView.setBottomBorderBlue(color: UIColor.blue.cgColor)
                    
                    self.delegate?.unfreezeButton()
                }
                else {
                    
                    if label.text == "Nome Completo" {self.user.name = textField.text}
//                    else if label.text == "Senha" {self.user.name = textField.text}
                    else if label.text == "Área" {self.user.occupation?.name = textField.text}
                    else if label.text == "Regime de trabalho" {self.user.work_model?.name = textField.text}
                    
                    stackView.setBottomBorderOnlyWithDefault(color: UIColor.black.cgColor)
                }
                
                textField.isEnabled = !textField.isEnabled
            }
            
            button.addAction(UIAction(handler: handler), for: .touchUpInside)
            
            if textField.isSecureTextEntry {
                
                let secureTextEntryHandler = {(action: UIAction) in
                    
                    textField.isSecureTextEntry = !textField.isSecureTextEntry
                }
                
                button.addAction(UIAction(handler: secureTextEntryHandler), for: .touchUpInside)
            }
            
            constraint(the: button, to: stackView, by: [.centerY])
            constraint(the: button, to: stackView, by: [.trailing], CGFloat(-15).generateSizeForScreen)
        }
        
        return stackView
    }
    
    func selectButtons(stacks: [UIStackView],_ items: [String], selectedItems: [String]) {
        
        for i in 0...items.count-1 {

            for interest in selectedItems {

                if interest == items[i] {

                    for stack in stacks {

                        for arrangedSubview in stack.arrangedSubviews {

                            guard let button = arrangedSubview as? UIButton else {return}

                            if button.configuration?.title == interest {

                                button.isSelected = true
                                button.configuration?.baseForegroundColor = .white
                                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func putPhoto() -> Bool {
        
        guard let photo = photo else {return false}

        sessionManager.uploadPictureWithResponse(uuid: uuid,
                                                 endpoint: .usersPictures,
                                                 picture_url: photo) { (statusCode, error, updatedPicture: UploadPicture?) in

            guard let _ = updatedPicture else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
            }
            return
        }
        return true
    }
    
    /// This function create stackViews with buttons, but organize two buttons in every stack created, and one if number of buttons is odd
    /// - Parameters:
    ///   - buttons: the buttons
    ///   - by: number of buttons by line
    /// - Returns: array of stackView
    func createStackViews(_ buttons: [UIButton], by: Int = 3) -> [UIStackView] {
        
        let createStackView = {(_ views: [UIView]) -> UIStackView in
            
            let stackView = UIStackView(arrangedSubviews: views)
            
            stackView.spacing = 4
            stackView.axis = .horizontal
            stackView.distribution = .fillProportionally
            
            return stackView
        }
        
        var stackViews = [UIStackView]()
        
        if buttons.isEmpty {return stackViews}
        else if buttons.count < by {
            
            stackViews.append(createStackView(buttons))
            
            return stackViews
        }
        
        var buttonsSample: [UIButton] = []
        
        for i in 0...buttons.count%by {

            buttonsSample.append(buttons[i])
        }
        
        stackViews.append(createStackView(buttonsSample))
        
        for i in stride(from: buttons.count%by,
                        to: buttons.count - 1,
                        by: by) {
            
            var buttonsSample: [UIButton] = []
            
            for j in 0...by-1 {
                
                buttonsSample.append(buttons[i+j])
            }
            
            stackViews.append(createStackView(buttonsSample))
        }
        
        return stackViews
    }
    
    /// This functions create and add to superview of a view one or multipleconstraints
    /// - Parameters:
    ///   - item: the view
    ///   - to: an element to conect constraints
    ///   - itemAttribute: attribute of view to connect constraints(will be the same of element by default)
    ///   - attributes: the atributes of item to connect constraints
    ///   - relation: relation, the default is .equal
    ///   - multiplier: multiplier, the default is 1
    ///   - constant: constant, the default is 0
    func constraint(the item: UIView,
                    to: Any?,
                    _ itemAttribute: NSLayoutConstraint.Attribute? = nil,
                    by attributes: [NSLayoutConstraint.Attribute],
                    relation: NSLayoutConstraint.Relation? = nil,
                    multiplier: CGFloat? = nil,
                    _ constant: CGFloat? = nil) {
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        for attribute in attributes {
            
            item.superview?.addConstraint(NSLayoutConstraint(item: item,
                                                             attribute: attribute,
                                                             relatedBy: relation ?? .equal,
                                                             toItem: to,
                                                             attribute: itemAttribute ?? attribute,
                                                             multiplier: multiplier ?? 1,
                                                             constant: constant ?? 0))
        }
    }
    
    /// This function remove masks of a view and subviews from it
    /// - Parameter view: the view to remove masks
    func removeMasks(of view: UIView) {
        
        for subview in view.subviews {
            
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
