//
//  AvulsaView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//


import UIKit

class SingleBookingView: UIViewController {
    
    private var theme = MyTheme.light
    private var capacityNumber = 4
    
    private lazy var  buttons: [UIButton] = {
        
        let buttons = createProgressBarButtonsWithoutActions([IconsBravve.walletGray.rawValue, IconsBravve.calendarBlue.rawValue, IconsBravve.pencilGray.rawValue, IconsBravve.creditGray.rawValue])
        
        return buttons
    }()
    
    private lazy var schedulesStack: UIStackView = {
        
        let schedulesStack = UIStackView()
        schedulesStack.axis = .vertical
        
        return schedulesStack
    }()
    
    private let daysChoiceLabel: UILabel = {
        
       let daysChoiceLabel = UILabel()
        daysChoiceLabel.text = "Escolha dia e hora"
        daysChoiceLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        daysChoiceLabel.textAlignment = .left
        return daysChoiceLabel
    }()
    
    private lazy var capacityLabel: UILabel = {
        
       let capacityLabel = UILabel()
        capacityLabel.text = "Capacidade: \(capacityNumber) pessoas"
        capacityLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        capacityLabel.textAlignment = .left
        
        return capacityLabel
    }()
    
    private let lineView: UIView = {
        
        let lineView = UIView()
        lineView.backgroundColor = .gray
        
        return lineView
    }()
    
    private lazy var calenderView: CalendarView = {
        
        let calenderView = CalendarView(theme: MyTheme.dark)
        calenderView.translatesAutoresizingMaskIntoConstraints = false
        calenderView.delegate = self
        
        return calenderView
    }()
    
    private let scrollView: UIScrollView = {
        
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let viewToScroll: UIView = {
        
        let viewToScroll = UIView()
        return viewToScroll
    }()
    
    let nextButton = UIButton()
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "My Calender"
        self.navigationController?.navigationBar.isTranslucent=false
        self.view.backgroundColor=Style.bgColor
        view.addSubviews([scrollView, nextButton])
        scrollView.addSubview(viewToScroll)
        viewToScroll.addSubviews([calenderView, daysChoiceLabel, capacityLabel, lineView, schedulesStack])
        self.nextButton.setToBottomButtonKeyboardDefault("Próxima Etapa", backgroundColor: .buttonPink)
        self.view.setToDefaultBackgroundColor()
        
        view.createReservationCustomBar (progressBarButtons: buttons) { _ in
            
            print("Lero Lero")
        }
        
        calenderView.constraintInsideTo(.top, viewToScroll, 44)
        calenderView.constraintInsideTo(.leading, viewToScroll, 40)
        calenderView.constraintInsideTo(.trailing, viewToScroll, 40)
        calenderView.heightAnchorInSuperview(338)

        scrollView.constraintInsideTo(.top, view, 220)
        scrollView.constraintInsideTo(.leading, view)
        scrollView.constraintInsideTo(.trailing, view)
        scrollView.constraintOutsideTo(.bottom, nextButton)
        
        viewToScroll.constraintInsideTo(.top, scrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.leading, scrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.trailing, scrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.bottom, scrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.width, scrollView.frameLayoutGuide)
    
        daysChoiceLabel.constraintInsideTo(.top, viewToScroll)
        daysChoiceLabel.constraintInsideTo(.leading, viewToScroll, 20)
        daysChoiceLabel.constraintInsideTo(.trailing, viewToScroll, 20)
        
        capacityLabel.constraintOutsideTo(.top, calenderView, 54)
        capacityLabel.constraintInsideTo(.leading, daysChoiceLabel)
        capacityLabel.constraintInsideTo(.trailing, daysChoiceLabel)

        lineView.constraintOutsideTo(.top, capacityLabel, 24)
        lineView.constraintInsideTo(.leading, daysChoiceLabel)
        lineView.constraintInsideTo(.trailing, daysChoiceLabel)
        lineView.heightAnchorInSuperview(1)
        
        schedulesStack.constraintOutsideTo(.top, lineView, 24)
        schedulesStack.constraintInsideTo(.leading, lineView)
        schedulesStack.constraintInsideTo(.trailing, lineView)
        schedulesStack.constraintInsideTo(.bottom, viewToScroll, 24)
        
        let rightBarBtn = UIBarButtonItem(title: "Light", style: .plain, target: self, action: #selector(rightBarBtnAction))
        self.navigationItem.rightBarButtonItem = rightBarBtn
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    @objc func rightBarBtnAction(sender: UIBarButtonItem) {
        
        if theme == .dark {
            
            sender.title = "Dark"
            theme = .light
            Style.themeLight()
        }
        else {
            
            sender.title = "Light"
            theme = .dark
            Style.themeDark()
        }
        self.view.backgroundColor = Style.bgColor
        calenderView.changeTheme()
    }
}

extension SingleBookingView: CalendarViewProtocol {
    
    func chosedDays(_ day: String) {
        
        let dayLabel = UILabel()
        dayLabel.text = "\(day)/01/2022"
        
        let entireDayLabel = UILabel()
        entireDayLabel.text = "Dia inteiro"
        
        let dayLabelStack = UIStackView(arrangedSubviews: [dayLabel, entireDayLabel])
        
        let timeLabel = UILabel()
        timeLabel.text = "Horários"
        
        let addtimeButton = UIButton()
        addtimeButton.setTitle("+ Adicionar horário", for: .normal)
        addtimeButton.setTitleColor(UIColor(named: ColorsBravve.label.rawValue),
                                    for: .normal)
        
        let chosedDayStack = UIStackView(arrangedSubviews: [dayLabelStack, timeLabel, addtimeButton])
        chosedDayStack.axis = .vertical
        
        self.schedulesStack.addArrangedSubview(chosedDayStack)
    }
    
    func unchoseDays(_ day: String) {
        
        for stack in self.schedulesStack.arrangedSubviews {
            
            if let stack = stack as? UIStackView {
                
                if let stack = stack.arrangedSubviews[0] as? UIStackView {
                    
                    if let label = stack.arrangedSubviews[0] as? UILabel {
                        
                        if let text = label.text {
                            
                            if text.contains(day) {
                                
                                stack.superview?.removeFromSuperview()
                            }
                        }
                    }
                }
            }
        }
    }
}
