
//
//  CheckOutScreen.swift
//  Teste
//
//  Created by user217685 on 8/3/22.
//

import UIKit

class BookingDetailsView: UIViewController {
    
    private lazy var bookingDetailsViewModel: BookingDetailsViewModel = {
        
        let bookingDetailsViewModel = BookingDetailsViewModel()
        bookingDetailsViewModel.delegate = self
        
        return bookingDetailsViewModel
    }()
    
    private lazy var tabBar: TabBarClosed = {
        
        let tabBar = TabBarClosed(self)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    private lazy var checkIN: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Check-in", for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        button.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        button.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(buttonCheckInTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var lines: [UIView] = {
        
        let createLine = {() -> UIView in
            
            let line = UIView()
            line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
            line.translatesAutoresizingMaskIntoConstraints = false
            return line
        }
        
        let lines: [UIView] = [createLine(), createLine(), createLine(), createLine(), createLine()]
        
        return lines
    }()
    
    private lazy var titleLabel: UILabel = {
        
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.text = " "
        lb.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        lb.backgroundColor = UIColor(named: ColorsBravve.boxOffice.rawValue)
        lb.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    private lazy var descriptLabel: UILabel = {
        
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 20)
        lb.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    private lazy var reserveCollection: UICollectionView = {
        
        let itemsize = 300
        let layoutCollection = UICollectionViewFlowLayout()
        layoutCollection.scrollDirection = .horizontal
        layoutCollection.itemSize = CGSize(width: itemsize, height: itemsize)
        layoutCollection.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layoutCollection )
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        collection.register(BookingDetailsCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collection.showsHorizontalScrollIndicator = false
        
        return collection
    }()
    
    private lazy var pageControl: UIPageControl = {
        
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        guard let pictures = bookingDetailsViewModel.currentReservation?.picture else { return pageControl }
        pageControl.numberOfPages = pictures.count
        pageControl.backgroundStyle = .prominent
        pageControl.currentPageIndicatorTintColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        pageControl.addTarget(self, action: #selector(pageControlTarget), for: .touchUpInside)
        
        return pageControl
    }()
    
    private lazy var infoLocalLabel: UILabel = {
        
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.bold.rawValue, size: 20)
        lb.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    private lazy var nameLocalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 12)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    private lazy var bdStackDataLabel: UILabel = {
        
        let lb = UILabel()
        lb.text = " "
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        return lb
    }()
    
    private lazy var bdStackViewBookingTypeLabel: UILabel = {
        
        let lb = UILabel()
        lb.text = " "
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        return lb
    }()
    
    private lazy var bookingDetailsDataStackView: UIStackView = {

        let stackView = UIStackView(arrangedSubviews: [bdStackDataLabel, bdStackViewBookingTypeLabel])
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var checkOutStackViewHourLabel: UILabel = {
        
        let lb = UILabel()
        lb.text = " "
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        return lb
    }()
    
    private lazy var checkOutStackView: UIStackView = {
        
        let checkOut = UILabel()
        checkOut.text = "Check-out"
        checkOut.font = UIFont(name: FontsBravve.medium.rawValue, size: 13)
        checkOut.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        let stackView = UIStackView(arrangedSubviews: [checkOut, checkOutStackViewHourLabel])
        stackView.alignment = .trailing
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var checkInStackViewHourLabel: UILabel = {
        
        let lb = UILabel()
        lb.text = " "
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        return lb
    }()
    
    private lazy var checkInStackView: UIStackView = {
        
        let checkIn = UILabel()
        checkIn.text = "Check-in"
        checkIn.font = UIFont(name: FontsBravve.medium.rawValue, size: 13)
        checkIn.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        let stackView = UIStackView(arrangedSubviews: [checkIn, checkInStackViewHourLabel])
        stackView.alignment = .trailing
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var localDetailsStackView: UIStackView = {

        let textColor = UIColor(named: ColorsBravve.textField.rawValue)

        let title = UILabel()
        title.textColor = textColor
        title.text = "Detalhes do local"
        title.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        title.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        let texts = bookingDetailsViewModel.createBusinessHoursArray(businessHours: bookingDetailsViewModel.businessDays)

        bookingDetailsViewModel.items.append(bookingDetailsViewModel.createStackView(bookingDetailsViewModel.seatsQty, UIImage(named: IconsBravve.users.rawValue), textColor: textColor))
        bookingDetailsViewModel.items.append(bookingDetailsViewModel.createStackView(bookingDetailsViewModel.spaceAddress, UIImage(named: IconsBravve.map.rawValue), textColor: textColor))
        
        let stackView = UIStackView(arrangedSubviews: [title] + bookingDetailsViewModel.items)
        
        if !texts.isEmpty {
            
            bookingDetailsViewModel.items.append(bookingDetailsViewModel.createStackView(attributedText: texts[0], UIImage(named: IconsBravve.clockReserv.rawValue), textColor: textColor))
            
            for i in 0...bookingDetailsViewModel.businessDays.count-1 {

                bookingDetailsViewModel.items.append(bookingDetailsViewModel.createStackView(attributedText: texts[i], UIImage(named: IconsBravve.clockReserv.rawValue),
                                             isHidden: true,
                                             textColor: textColor))
            }

            let buttons = bookingDetailsViewModel.createSeeButtonsStackView(3...bookingDetailsViewModel.items.count-1, items: bookingDetailsViewModel.items)
            
            stackView.addArrangedSubview(buttons)
        }
        
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = CGFloat(10).generateSizeForScreen
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var responsableStackView: UIStackView = {
        
        let textColor = UIColor(named: ColorsBravve.textField.rawValue)
        
        let title = UILabel()
        title.textColor = textColor
        title.text = "Responsável"
        title.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        title.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        
        let responsableLabel = UILabel()
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: 12), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: 12), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]

        let atritutedString1 = NSMutableAttributedString(string: "\(bookingDetailsViewModel.spaceContactName)\n", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: bookingDetailsViewModel.spaceContactRole, attributes: attrs2 as [NSAttributedString.Key : Any])

        atritutedString1.append(atritutedString2)
        responsableLabel.attributedText = atritutedString1
        responsableLabel.numberOfLines = 0
        
        let informations = UILabel()
        informations.text = "Estarei disponível para esclarecer suas dúvidas e ajudar no que for possível através dos contatos abaixo."
        informations.numberOfLines = 0
        informations.font = UIFont(name: FontsBravve.light.rawValue, size: 12)
        informations.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        let fullText = "Estarei disponível para esclarecer suas dúvidas e ajudar no que for possível através dos contatos abaixo. Estarei disponível para esclarecer suas dúvidas e ajudar no que for possível através dos contatos abaixo."
        
        let button = bookingDetailsViewModel.createSeeButton(smallText: informations.text ?? "", fullText: fullText, actionLabel: informations)
   
        let stackView = UIStackView(arrangedSubviews: [title, responsableLabel, informations, button] )
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var contactsStackView: UIStackView = {
        
        let textColor = UIColor(named: ColorsBravve.textField.rawValue)
        
        let title = UILabel()
        title.textColor = textColor
        title.text = "Contatos"
        title.font = UIFont(name: FontsBravve.medium.rawValue, size: 12)
        title.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        var contacts = [UIStackView]()
        
        contacts.append(bookingDetailsViewModel.createStackView(bookingDetailsViewModel.spaceContactPhone, UIImage(named: IconsBravve.cellphone.rawValue), textColor: textColor))
        contacts.append(bookingDetailsViewModel.createStackView(bookingDetailsViewModel.spaceContactEmail, UIImage(named: IconsBravve.email.rawValue), textColor: textColor))
        
        let stackView = UIStackView(arrangedSubviews: [title] + contacts)
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var detailLocalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Detalhes da sua reserva"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    private lazy var imageDetail: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.calendar.rawValue)
        
        return image
    }()
    
    private lazy var payFormLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Forma de pagamento"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    private lazy var imagePay: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.receipt.rawValue)
        
        return image
    }()
    
    private lazy var numberPeopleImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.users.rawValue)
        
        return image
    }()
    
    private lazy var creditCard: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Cartão de crédito"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    private lazy var totalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: 13), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: 13), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]
        
        let atritutedString1 = NSMutableAttributedString(string: "Total:", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: " R$ \(bookingDetailsViewModel.paymentAmount)", attributes: attrs2 as [NSAttributedString.Key : Any])
        
        atritutedString1.append(atritutedString2)
        atritutedString2.append(atritutedString1)
        lb.attributedText = atritutedString1
        lb.numberOfLines = 0
        lb.textAlignment = .left
        return lb
    }()
    
    private lazy var creditCardTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.text = " "
        tf.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        tf.backgroundColor = UIColor(named: ColorsBravve.backgroundCard.rawValue)
        tf.isUserInteractionEnabled = false
        return tf
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar Reserva", for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 16)
        button.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        button.layer.cornerRadius = 12
        button.setTitleColor(UIColor(named: ColorsBravve.white_white.rawValue), for: .normal)
        
        button.addTarget(self, action: #selector(cancelBooking), for: .touchUpInside)
                    
        return button
    }()
    
    private let viewInScroll: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.delegate = self
        
        return scroll
    }()
    
    override var prefersStatusBarHidden: Bool {true}
    
    override func loadView() {
        super.loadView()
        
        bookingDetailsViewModel.getReservation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        
        reserveCollection.delegate = self
        reserveCollection.dataSource = self
        
        setupViews()
        setupDefaults()
        setupContraints()
    }
    
    
    /// This function adds view elements
    func setupViews(){
        view.addSubview(checkIN)
        tabBar.selectedItem = tabBar.items?[1]
        view.addSubview(bookingDetailsViewModel.customBar)
        view.addSubview(tabBar)
        view.addSubview(scrollView)
        scrollView.addSubview(viewInScroll)
        viewInScroll.addSubviews([titleLabel, descriptLabel, reserveCollection, pageControl,
                                  infoLocalLabel, nameLocalLabel, detailLocalLabel, imageDetail,
                                  imagePay, payFormLabel, creditCard, creditCardTextField, totalLabel,
                                  bookingDetailsDataStackView, checkInStackView, checkOutStackView,
                                  cancelButton, localDetailsStackView, responsableStackView, contactsStackView] + lines)
    }
    
    /// This function deals with the customBar, its title, its back button and the action it has
    private func setupDefaults(){
        bookingDetailsViewModel.customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Espaço"){
            _ in
            self.dismiss(animated: true)
            
        }
    }
    
    /// This function has all the constraints of the BookingDetails view elements
    func setupContraints(){
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: bookingDetailsViewModel.customBar.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: checkIN.topAnchor),
            
            viewInScroll.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            viewInScroll.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            viewInScroll.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            viewInScroll.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            viewInScroll.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: viewInScroll.topAnchor,constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 24),
                        
            descriptLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 16),
            descriptLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            descriptLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            
            reserveCollection.topAnchor.constraint(equalTo: descriptLabel.bottomAnchor,constant: 16),
            reserveCollection.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor),
            reserveCollection.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor),
            reserveCollection.heightAnchor.constraint(equalToConstant: 300),
            
            pageControl.centerXAnchor.constraint(equalTo: reserveCollection.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: reserveCollection.bottomAnchor, constant: 10),
            pageControl.leadingAnchor.constraint(equalTo: reserveCollection.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: reserveCollection.trailingAnchor),
            
            infoLocalLabel.topAnchor.constraint(equalTo: pageControl.bottomAnchor,constant: 52.5),
            infoLocalLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            nameLocalLabel.topAnchor.constraint(equalTo: infoLocalLabel.bottomAnchor,constant: 7),
            nameLocalLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            detailLocalLabel.topAnchor.constraint(equalTo: nameLocalLabel.bottomAnchor,constant: 32),
            detailLocalLabel.leadingAnchor.constraint(equalTo: imageDetail.trailingAnchor,constant: 9),
            
            bookingDetailsDataStackView.topAnchor.constraint(equalTo: detailLocalLabel.bottomAnchor, constant: CGFloat(27).generateSizeForScreen),
            bookingDetailsDataStackView.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor, constant: CGFloat(20).generateSizeForScreen),

            checkInStackView.topAnchor.constraint(equalTo: bookingDetailsDataStackView.topAnchor),
            checkInStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-108).generateSizeForScreen),

            checkOutStackView.topAnchor.constraint(equalTo: bookingDetailsDataStackView.topAnchor),
            checkOutStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-24).generateSizeForScreen),
                        
            payFormLabel.leadingAnchor.constraint(equalTo: imagePay.trailingAnchor,constant: 9),
            payFormLabel.topAnchor.constraint(equalTo: lines[0].bottomAnchor,constant: 20.5),
            
            imageDetail.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 25),
            imageDetail.centerYAnchor.constraint(equalTo: detailLocalLabel.centerYAnchor),
            
            imagePay.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 25),
            imagePay.topAnchor.constraint(equalTo: lines[0].bottomAnchor,constant: 21),
            
            creditCard.topAnchor.constraint(equalTo: imagePay.bottomAnchor,constant: 26),
            creditCard.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            creditCardTextField.topAnchor.constraint(equalTo: creditCard.bottomAnchor),
            creditCardTextField.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            creditCardTextField.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            creditCardTextField.heightAnchor.constraint(equalToConstant: 67),
            
            totalLabel.topAnchor.constraint(equalTo: creditCardTextField.bottomAnchor,constant: 14),
            totalLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            lines[0].topAnchor.constraint(equalTo: bookingDetailsDataStackView.bottomAnchor,constant: 17),
            lines[0].leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lines[0].trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lines[0].heightAnchor.constraint(equalToConstant: 0.5),
            
            lines[1].topAnchor.constraint(equalTo: totalLabel.bottomAnchor,constant: 17),
            lines[1].leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lines[1].trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lines[1].heightAnchor.constraint(equalToConstant: 0.5),
            
            localDetailsStackView.topAnchor.constraint(equalTo: lines[1].bottomAnchor, constant: 15),
            localDetailsStackView.leadingAnchor.constraint(equalTo: lines[1].leadingAnchor),
            localDetailsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-76).generateSizeForScreen),
            
            lines[2].topAnchor.constraint(equalTo: localDetailsStackView.bottomAnchor,constant: 16),
            lines[2].leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lines[2].trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lines[2].heightAnchor.constraint(equalToConstant: 0.5),
            
            responsableStackView.topAnchor.constraint(equalTo: lines[2].bottomAnchor, constant: 15),
            responsableStackView.leadingAnchor.constraint(equalTo: lines[2].leadingAnchor),
            responsableStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-78).generateSizeForScreen),
            
            lines[3].topAnchor.constraint(equalTo: responsableStackView.bottomAnchor,constant: CGFloat(16).generateSizeForScreen),
            lines[3].leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lines[3].trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lines[3].heightAnchor.constraint(equalToConstant: 0.5),
            
            contactsStackView.topAnchor.constraint(equalTo: lines[3].bottomAnchor, constant: 15),
            contactsStackView.leadingAnchor.constraint(equalTo: lines[3].leadingAnchor),
            contactsStackView.trailingAnchor.constraint(equalTo: lines[3].trailingAnchor),
            
            cancelButton.topAnchor.constraint(equalTo: contactsStackView.bottomAnchor,constant: 21.5),
            cancelButton.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            cancelButton.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            cancelButton.heightAnchor.constraint(equalToConstant: 52),
            cancelButton.bottomAnchor.constraint(equalTo: viewInScroll.bottomAnchor, constant: -40),
            
            checkIN.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
            checkIN.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            checkIN.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            checkIN.heightAnchor.constraint(equalToConstant: 52),
            
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    @objc func pageControlTarget(_ sender: UIPageControl) {
        
        DispatchQueue.main.async {
            
            self.reserveCollection.scrollToItem(at: IndexPath(row: sender.currentPage,
                                                              section: 0),
                                                at: .centeredHorizontally, animated: true)
        }
    }
    
    /// This function creates the checkIN Button alert, as well as the alert message, its response buttons and their action
    @objc func buttonCheckInTap(){
        bookingDetailsViewModel.customAlertOk.showAlert(image: UIImage(named: IconsBravve.questionCircleBlue_1.rawValue), message: "Para realizar o Check-in, é necessário permissão de uso da câmera do celular.", enterAttributed: "Permitir", enterHandler: UIAction(handler: { _ in
            let vc = CheckInQrCodeViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }), cancelAttributed: "Negar", cancelHandler: UIAction(handler: { _ in
            self.bookingDetailsViewModel.customAlertOk.dismissAlert()
        }), on: self)
    }
}

extension BookingDetailsView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let pictures = bookingDetailsViewModel.currentReservation?.picture else { return 0 }

        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? BookingDetailsCollectionViewCell
        
        guard let pictures = bookingDetailsViewModel.currentReservation?.picture else { return UICollectionViewCell() }
        guard let picture = pictures[indexPath.row].url else { return UICollectionViewCell() }
        

        cell?.imageView.sd_setImage(with: URL(string: picture))
        
        guard let allowWorkpass = bookingDetailsViewModel.space.allow_workpass else {return cell ?? UICollectionViewCell()}
        if allowWorkpass {cell?.createWorkPassLabel()}
        
        return cell ?? UICollectionViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        var roundedIndex = 0.0
        if index < 0.2 {
            roundedIndex = round(index)
        } else {
            roundedIndex = ceil(index)
        }

        self.pageControl.currentPage = Int(roundedIndex)
        
        for subview in scrollView.subviews {
            
            if subview.frame.origin.y != 0 {
                    
                subview.subviews[0].backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
            }
        }
    }
    
    /// This function handles the cancelbooking button alert. The message, buttons and their actions
    @objc func cancelBooking(){
        bookingDetailsViewModel.customAlertCancel.showAlert(image: UIImage(named: IconsBravve.questionCircleBlue_1.rawValue), message: "Certeza que deseja cancelar essa reserva? Entraremos em contato para confirmar o cancelamento!", enterAttributed: "Voltar", enterHandler: UIAction(handler: { _ in
            self.bookingDetailsViewModel.customAlertCancel.dismissAlert()
        }), cancelAttributed: "Cancelar Reserva", cancelHandler: UIAction(handler: { _ in
            
            self.bookingDetailsViewModel.cancelReservation()
            
            let vc = BookingHistoryView()
            vc.modalPresentationStyle = .fullScreen
            self.bookingDetailsViewModel.customAlertCancel.dismissAlert()
            self.present(vc, animated: true)
        }), on: self)
        Flags.shared.flagReservation = 2
    }
}

extension BookingDetailsView: BookingDetailsViewModelProtocol {
    
    func updateView(_ currentReservation: Reservations?, startDate: String, bookingTypeName: String, startHour: String, endHour: String) {
        
        titleLabel.text = currentReservation?.space_category?.name?.uppercased() ?? ""
        titleLabel.backgroundColor = titleLabel.getTitleLabelBackgroundColor(currentReservation?.space_category?.name?.uppercased() ?? "")
        descriptLabel.text = currentReservation?.slogan
        infoLocalLabel.text = currentReservation?.local_name
        nameLocalLabel.text = currentReservation?.description
        bdStackDataLabel.text = startDate
        bdStackViewBookingTypeLabel.text = bookingTypeName
        checkInStackViewHourLabel.text = startHour
        checkOutStackViewHourLabel.text = endHour
        bookingDetailsViewModel.spaceContactName = currentReservation?.space_contact?.name ?? " "
        bookingDetailsViewModel.spaceContactRole = " "
        bookingDetailsViewModel.spaceContactPhone = currentReservation?.space_contact?.phone ?? " "
        bookingDetailsViewModel.spaceContactEmail = currentReservation?.space_contact?.email ?? " "
        bookingDetailsViewModel.paymentAmount = currentReservation?.payment_amount?.replacingOccurrences(of: ".", with: ",") ?? ""
        creditCard.text = currentReservation?.payment_type_name ?? ""
    }
}
