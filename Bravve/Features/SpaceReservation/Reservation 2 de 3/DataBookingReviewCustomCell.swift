
import Foundation
import UIKit

class DataBookingDayFirstCell: UITableViewCell {
    
    static let reuseIdDataBookingDayFirst: String = "BookingDayFirstCell"
    
    //MARK: - dayLabel
    lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 13)
        label.numberOfLines = 1
        label.text = "Dia 21-01-2022"
        
        return label
    }()
    
    //MARK: - firstHourImage
    lazy var firstHourImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.clock.rawValue)
        image.contentMode = .scaleToFill
        return image
    }()
    
    //MARK: - firstCheckInLabel
    lazy var firstCheckInLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        label.numberOfLines = 1
        label.text = "08:00"
        
        return label
    }()
    
    //MARK: - firstFeatLabel
    lazy var firstFeatLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        label.numberOfLines = 1
        label.text = "-"
        
        return label
    }()
    
    //MARK: - firstCheckOutLabel
    lazy var firstCheckOutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        label.numberOfLines = 1
        label.text = "09:00"
        
        return label
    }()
    
    //MARK: - firstPriceLabel
    lazy var firstPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        label.numberOfLines = 1
        label.text = "R$ 40,00"
        
        return label
    }()
    
    //MARK: - secondHourImage
    lazy var secondHourImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.clock.rawValue)
        image.contentMode = .scaleToFill
        return image
    }()
    
    //MARK: - secondCheckInLabel
    lazy var secondCheckInLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        label.numberOfLines = 1
        label.text = "14:00"
        
        return label
    }()
    
    //MARK: - secondFeatLabel
    lazy var secondFeatLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        label.numberOfLines = 1
        label.text = "-"
        
        return label
    }()
    
    //MARK: - secondCheckOutLabel
    lazy var secondCheckOutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        label.numberOfLines = 1
        label.text = "15:00"
        
        return label
    }()
    
    //MARK: - secondPriceLabel
    lazy var secondPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        label.numberOfLines = 1
        label.text = "R$ 40,00"
        
        return label
    }()
    
    //MARK: - amountImage
    lazy var amountImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.questionCircleBlue_1.rawValue)
        image.contentMode = .scaleToFill
        return image
    }()
    
    //MARK: - totalLabel
    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        label.numberOfLines = 1
        label.text = "Total"
        
        return label
    }()
    
    //MARK: - amountLabel
    lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 13)
        label.numberOfLines = 1
        label.text = "R$ 80,00"
        
        return label
    }()
    
    //MARK: - bottomLine
    private lazy var bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews([dayLabel,
                                 firstHourImage,
                                 firstCheckInLabel,
                                 firstFeatLabel,
                                 firstCheckOutLabel,
                                 firstPriceLabel,
                                 secondHourImage,
                                 secondCheckInLabel,
                                 secondFeatLabel,
                                 secondCheckOutLabel,
                                 secondPriceLabel,
                                 amountImage,
                                 totalLabel,
                                 amountLabel,
                                 bottomLine])
        contentView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - func configConstraints
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            
            firstPriceLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 19),
            firstPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            
            firstCheckOutLabel.trailingAnchor.constraint(equalTo: firstPriceLabel.leadingAnchor, constant: -24),
            firstCheckOutLabel.centerYAnchor.constraint(equalTo: firstPriceLabel.centerYAnchor),
            
            firstFeatLabel.trailingAnchor.constraint(equalTo: firstCheckOutLabel.leadingAnchor, constant: -19),
            firstFeatLabel.centerYAnchor.constraint(equalTo: firstPriceLabel.centerYAnchor),
            
            firstCheckInLabel.trailingAnchor.constraint(equalTo: firstFeatLabel.leadingAnchor, constant: -8),
            firstCheckInLabel.centerYAnchor.constraint(equalTo: firstPriceLabel.centerYAnchor),
            
            firstHourImage.centerYAnchor.constraint(equalTo: firstPriceLabel.centerYAnchor),
            firstHourImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            
            secondPriceLabel.topAnchor.constraint(equalTo: firstPriceLabel.bottomAnchor, constant: 19),
            secondPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            
            secondCheckOutLabel.trailingAnchor.constraint(equalTo: secondPriceLabel.leadingAnchor, constant: -24),
            secondCheckOutLabel.centerYAnchor.constraint(equalTo: secondPriceLabel.centerYAnchor),
            
            secondFeatLabel.trailingAnchor.constraint(equalTo: secondCheckOutLabel.leadingAnchor, constant: -19),
            secondFeatLabel.centerYAnchor.constraint(equalTo: secondPriceLabel.centerYAnchor),
            
            secondCheckInLabel.trailingAnchor.constraint(equalTo: secondFeatLabel.leadingAnchor, constant: -8),
            secondCheckInLabel.centerYAnchor.constraint(equalTo: secondPriceLabel.centerYAnchor),
            
            secondHourImage.centerYAnchor.constraint(equalTo: secondPriceLabel.centerYAnchor),
            secondHourImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            
            amountLabel.topAnchor.constraint(equalTo: secondPriceLabel.bottomAnchor, constant: 19),
            amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            amountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -19),
            
            totalLabel.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor, constant: -34),
            totalLabel.centerYAnchor.constraint(equalTo: amountLabel.centerYAnchor),
            
            amountImage.centerYAnchor.constraint(equalTo: amountLabel.centerYAnchor),
            amountImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            
            bottomLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bottomLine.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 0.3),
            bottomLine.widthAnchor.constraint(equalToConstant: 334),
        ])
    }
}


class DataBookingDaySecondCell: UITableViewCell {
    
    static let reuseIdDataBookingDaySecond: String = "BookingDaySecondCell"
   
        
        //MARK: - hourImage
        
        lazy var hourImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: IconsBravve.clock.rawValue)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        //MARK: - cashImage
        lazy var cashImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: IconsBravve.clock.rawValue)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        //MARK: - dayLabel
        lazy var dayLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            label.font = UIFont(name: FontsBravve.bold.rawValue, size: 13)
            label.numberOfLines = 1
            label.text = "Dia 22-01-2022"
            
            return label
        }()
        //MARK: - checkInHour
        lazy var checkInHour: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
            label.numberOfLines = 1
            label.text = "08:00"
            
            return label
        }()
        //MARK: - tracerLabel
        lazy var tracerLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
            label.numberOfLines = 1
            label.text = "-"
            
            return label
        }()
        
        //MARK: - checkOutHour
        lazy var checkOutHour: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
            label.numberOfLines = 1
            label.text = "19:00"
            
            return label
        }()
        //MARK: - firstHourValue
        lazy var firstHourValue: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
            label.numberOfLines = 1
            label.text = "200,00"
            
            return label
        }()
        //MARK: - totalLabel
        lazy var totalLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
            label.numberOfLines = 1
            label.text = "Total"
            
            return label
        }()
        //MARK: - totalValueLabel
        lazy var totalValueLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            label.font = UIFont(name: FontsBravve.bold.rawValue, size: 13)
            label.numberOfLines = 1
            label.text = "200,00"
            
            return label
        }()
    
    //MARK: - bottomLine
    private lazy var bottomLine: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
        //MARK: - Init
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.addSubviews([dayLabel, checkInHour, checkOutHour, firstHourValue, totalLabel,totalValueLabel,hourImage,cashImage,tracerLabel, bottomLine])
            contentView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
            configConstraints()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
       
        
        //MARK: - Constraints
        private func configConstraints() {
            
            NSLayoutConstraint.activate([
                
                
                dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19),
                dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
                
                hourImage.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 21),
                hourImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),

                cashImage.topAnchor.constraint(equalTo: hourImage.bottomAnchor, constant: 24),
                cashImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
                cashImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13),

                checkInHour.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 53),
                checkInHour.trailingAnchor.constraint(equalTo: tracerLabel.leadingAnchor, constant: -16),
                
                tracerLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 53),
                tracerLabel.leadingAnchor.constraint(equalTo: checkInHour.trailingAnchor,constant: 8),
                tracerLabel.trailingAnchor.constraint(equalTo: checkOutHour.leadingAnchor,constant: -16),
                
                checkOutHour.centerYAnchor.constraint(equalTo: checkInHour.centerYAnchor),
                checkOutHour.leadingAnchor.constraint(equalTo: tracerLabel.trailingAnchor,constant: 16),
                checkOutHour.trailingAnchor.constraint(equalTo: firstHourValue.leadingAnchor, constant: -16),

                firstHourValue.centerYAnchor.constraint(equalTo: checkInHour.centerYAnchor),
                firstHourValue.leadingAnchor.constraint(equalTo: checkOutHour.trailingAnchor, constant: 21),
                firstHourValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -32),
               
                totalLabel.topAnchor.constraint(equalTo: checkOutHour.bottomAnchor, constant: 19),
                totalLabel.centerXAnchor.constraint(equalTo: checkOutHour.centerXAnchor),
                totalLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13),

                totalValueLabel.topAnchor.constraint(equalTo: firstHourValue.bottomAnchor, constant: 19),
                totalValueLabel.centerXAnchor.constraint(equalTo: firstHourValue.centerXAnchor),
                totalValueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13),
                totalValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -32),
            
                
                //MARK: - bottomLine Constraints
                bottomLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                bottomLine.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                bottomLine.heightAnchor.constraint(equalToConstant: 0.3),
                bottomLine.widthAnchor.constraint(equalToConstant: 334)

            ])
        }
    }

class DataBookingDayThirdCell: UITableViewCell {
    
    static let reuseIdDataBookingDayThird: String = "BookingDayThirdCell"
   
        
        //MARK: - hourImage
        
        lazy var hourImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: IconsBravve.clock.rawValue)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        //MARK: - cashImage
        lazy var cashImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: IconsBravve.clock.rawValue)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        //MARK: - dayLabel
        lazy var dayLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            label.font = UIFont(name: FontsBravve.bold.rawValue, size: 15)
            label.numberOfLines = 1
            label.text = "Dia 23"
            
            return label
        }()
        //MARK: - checkInHour
        lazy var checkInHour: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
            label.numberOfLines = 1
            label.text = "08:00"
            
            return label
        }()
        //MARK: - tracerLabel
        lazy var tracerLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
            label.numberOfLines = 1
            label.text = "-"
            
            return label
        }()
        
        //MARK: - checkOutHour
        lazy var checkOutHour: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
            label.numberOfLines = 1
            label.text = "19:00"
            
            return label
        }()
        //MARK: - firstHourValue
        lazy var firstHourValue: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
            label.numberOfLines = 1
            label.text = "200,00"
            
            return label
        }()
        //MARK: - totalLabel
        lazy var totalLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
            label.numberOfLines = 1
            label.text = "Total"
            
            return label
        }()
        //MARK: - totalValueLabel
        lazy var totalValueLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            label.font = UIFont(name: FontsBravve.bold.rawValue, size: 13)
            label.numberOfLines = 1
            label.text = "200,00"
            
            return label
        }()
    
    //MARK: - bottomLine
    private lazy var bottomLine: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
        //MARK: - Init
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.addSubviews([dayLabel, checkInHour, checkOutHour, firstHourValue, totalLabel,totalValueLabel,hourImage,cashImage,tracerLabel, bottomLine])
            contentView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
            configConstraints()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
       
        
        //MARK: - Constraints
        private func configConstraints() {
            
            NSLayoutConstraint.activate([
                
                
                dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19),
                dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
                
                hourImage.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 21),
                hourImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),

                cashImage.topAnchor.constraint(equalTo: hourImage.bottomAnchor, constant: 24),
                cashImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
                cashImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13),

                checkInHour.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 53),
                checkInHour.trailingAnchor.constraint(equalTo: tracerLabel.leadingAnchor, constant: -16),
                
                tracerLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 53),
                tracerLabel.leadingAnchor.constraint(equalTo: checkInHour.trailingAnchor,constant: 8),
                tracerLabel.trailingAnchor.constraint(equalTo: checkOutHour.leadingAnchor,constant: -16),
                
                checkOutHour.centerYAnchor.constraint(equalTo: checkInHour.centerYAnchor),
                checkOutHour.leadingAnchor.constraint(equalTo: tracerLabel.trailingAnchor,constant: 16),
                checkOutHour.trailingAnchor.constraint(equalTo: firstHourValue.leadingAnchor, constant: -16),

                firstHourValue.centerYAnchor.constraint(equalTo: checkInHour.centerYAnchor),
                firstHourValue.leadingAnchor.constraint(equalTo: checkOutHour.trailingAnchor, constant: 21),
                firstHourValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -32),
               
                totalLabel.topAnchor.constraint(equalTo: checkOutHour.bottomAnchor, constant: 19),
                totalLabel.centerXAnchor.constraint(equalTo: checkOutHour.centerXAnchor),
                totalLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13),

                totalValueLabel.topAnchor.constraint(equalTo: firstHourValue.bottomAnchor, constant: 19),
                totalValueLabel.centerXAnchor.constraint(equalTo: firstHourValue.centerXAnchor),
                totalValueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13),
                totalValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -32),
           
                //MARK: - bottomLine Constraints
                bottomLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                bottomLine.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                bottomLine.heightAnchor.constraint(equalToConstant: 0.3),
                bottomLine.widthAnchor.constraint(equalToConstant: 334)

            ])
        }
    }


