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
    private var availableTimes = ["08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00"]
    private let dropDownHeight = CGFloat(160).generateSizeForScreen
    private let timeStacksSize = CGSize(width: CGFloat(120).generateSizeForScreen,
                                        height: CGFloat(60).generateSizeForScreen)
    
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
    
    private lazy var bodyScrollView: UIScrollView = {
        
        let bodyScrollView = UIScrollView()
        bodyScrollView.delegate = self
        
        return bodyScrollView
    }()
    
    private let viewToScroll: UIView = {
        
        let viewToScroll = UIView()
        return viewToScroll
    }()
    
    private lazy var dropDown: UIScrollView = {
        
        let dropDown = UIScrollView()
        dropDown.delegate = self
        
        return dropDown
    }()
    
    private let nextButton = UIButton()
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "My Calender"
        self.navigationController?.navigationBar.isTranslucent=false
        self.view.backgroundColor = Style.bgColor
        view.addSubviews([bodyScrollView, nextButton])
        bodyScrollView.addSubview(viewToScroll)
        viewToScroll.addSubviews([calenderView, daysChoiceLabel, capacityLabel, lineView, schedulesStack, dropDown])
        self.nextButton.setToBottomButtonKeyboardDefault("Próxima Etapa", backgroundColor: .buttonPink)
        self.view.setToDefaultBackgroundColor()
        
        view.createReservationCustomBar (progressBarButtons: buttons) { _ in
            
            print("Lero Lero")
        }
        
        calenderView.constraintInsideTo(.top, viewToScroll, 44)
        calenderView.constraintInsideTo(.leading, viewToScroll, 40)
        calenderView.constraintInsideTo(.trailing, viewToScroll, 40)
        calenderView.heightAnchorInSuperview(338)

        bodyScrollView.constraintInsideTo(.top, view, 220)
        bodyScrollView.constraintInsideTo(.leading, view)
        bodyScrollView.constraintInsideTo(.trailing, view)
        bodyScrollView.constraintOutsideTo(.bottom, nextButton)
        
        viewToScroll.constraintInsideTo(.top, bodyScrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.leading, bodyScrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.trailing, bodyScrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.bottom, bodyScrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.width, bodyScrollView.frameLayoutGuide)
    
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
        schedulesStack.constraintInsideTo(.bottom, viewToScroll, dropDownHeight)
        
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
    
    @objc func showDropDown(_ sender: UIButton) {
        
        let myButtonCenter = schedulesStack.convert(sender.center, from: sender.superview)
        
        var buttons = [UIButton]()
        
        for time in self.availableTimes {
            
            let button = UIButton()
            button.setTitle(time, for: .normal)
            button.setTitleColor(UIColor(named: ColorsBravve.label.rawValue),
                                 for: .normal)
            
            let handler = {(action: UIAction) in
                
                if let timeStack = sender.superview as? UIStackView,
                   let stack = timeStack.arrangedSubviews[0] as? UIStackView,
                   let hourLabel = stack.arrangedSubviews[1] as? UILabel {
                    
                    self.dropDown.frame.size = .zero
                    hourLabel.text = time
                }
            }
            
            button.addAction(UIAction(handler: handler), for: .touchUpInside)
            
            buttons.append(button)
        }
        
        dropDown.turnIntoAList(buttons)
        
        dropDown.showLikeAWindow(size: CGSize(width: sender.superview?.frame.size.width ?? 0,
                                                   height: dropDownHeight),
                                      origin: CGPoint(x: sender.superview?.frame.maxX ?? 0,
                                                      y: schedulesStack.frame.minY + myButtonCenter.y + sender.frame.height/2),
                                      .downLeft)
        
        schedulesStack.bringSubviewToFront(dropDown)
    }
}

extension SingleBookingView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        
        for subview in scrollView.subviews {
            
            if subview.frame.origin.x != 0 {
                
                subview.subviews[0].backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
            }
        }
    }
}

extension SingleBookingView: CalendarViewProtocol {
    
    func chosedDays(_ day: String,_ month: String,_ year: String) {
        
        let dayLabel = UILabel()
        dayLabel.text = "\(day)/\(month)/\(year)"
        
        let entireDayLabel = UILabel()
        entireDayLabel.text = "Dia inteiro"
        
        let dayLabelStack = UIStackView(arrangedSubviews: [dayLabel, entireDayLabel])
        
        let timeLabel = UILabel()
        timeLabel.text = "Horários"
        
        let timesStack = UIStackView()
        timesStack.axis = .vertical
        
        let addtimeButton = UIButton()
        
        let handler = {(action: UIAction) in
            
            let timeInStack: UIStackView = {
                
                let inLabel = UILabel()
                inLabel.text = "Entrada"
                
                let hourLabel = UILabel()
                hourLabel.text = "08:00"
                
                let stackView = UIStackView(arrangedSubviews: [inLabel, hourLabel])
                stackView.axis = .vertical
                
                let dropDownButton = UIButton()
                dropDownButton.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue),
                                        for: .normal)
                
                let timeInStack = UIStackView(arrangedSubviews: [stackView, dropDownButton])
                
                dropDownButton.addTarget(self, action: #selector(self.showDropDown),
                                         for: .touchUpInside)
                
                return timeInStack
            }()
            
            let timeOutStack: UIStackView = {
                
                let outLabel = UILabel()
                outLabel.text = "Saída"
                
                let hourLabel = UILabel()
                hourLabel.text = "08:00"
                
                let stackView = UIStackView(arrangedSubviews: [outLabel, hourLabel])
                stackView.axis = .vertical
                
                let dropDownButton = UIButton()
                dropDownButton.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue),
                                        for: .normal)
                
                dropDownButton.addTarget(self, action: #selector(self.showDropDown),
                                         for: .touchUpInside)
                
                let timeOutStack = UIStackView(arrangedSubviews: [stackView, dropDownButton])
                
                return timeOutStack
            }()
            
            let trashButton = UIButton()
            trashButton.setImage(UIImage(named: ButtonsBravve.alert.rawValue),
                                    for: .normal)
            
            let timeStack = UIStackView(arrangedSubviews: [timeInStack, timeOutStack, trashButton])
            timeStack.distribution = .fillProportionally
            
            timeInStack.widthAnchorInSuperview(self.timeStacksSize.width)
            timeInStack.heightAnchorInSuperview(self.timeStacksSize.height)
            timeOutStack.widthAnchorInSuperview(self.timeStacksSize.width)
            timeOutStack.heightAnchorInSuperview(self.timeStacksSize.height)
            
            let handler = {(action: UIAction) in
                
                timeStack.removeFromSuperview()
            }
            
            trashButton.addAction(UIAction(handler: handler), for: .touchUpInside)
            
            timesStack.addArrangedSubview(timeStack)
        }
        
        addtimeButton.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        addtimeButton.setTitle("+ Adicionar horário", for: .normal)
        addtimeButton.setTitleColor(UIColor(named: ColorsBravve.label.rawValue),
                                    for: .normal)
        
        let chosedDayStack = UIStackView(arrangedSubviews: [dayLabelStack, timeLabel, timesStack, addtimeButton])
        chosedDayStack.axis = .vertical
        
        self.schedulesStack.addArrangedSubview(chosedDayStack)
    }
    
    func unchoseDays(_ day: String,_ month: String,_ year: String) {
        
        for view in self.schedulesStack.arrangedSubviews {
            
            if let chosedDayStack = view as? UIStackView {
                
                if let dayLabelStack = chosedDayStack.arrangedSubviews[0] as? UIStackView {
                    
                    if let dayLabel = dayLabelStack.arrangedSubviews[0] as? UILabel {
                        
                        if let text = dayLabel.text {
                            
                            if text.contains(day) && text.contains(month) && text.contains(year) {
                                
                                chosedDayStack.removeFromSuperview()
                            }
                        }
                    }
                }
            }
        }
    }
}
