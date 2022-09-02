
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
    
    func createHourStackView(startHour: String?, endHour: String?, totalPrice: String?) -> UIStackView {
        
        let stackView = UIStackView()
        
        //MARK: - firstHourImage
        lazy var firstHourImage: UIImageView = {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.image = UIImage(named: IconsBravve.clock.rawValue)
            image.contentMode = .scaleAspectFit
            image.widthAnchor.constraint(equalToConstant: CGFloat(10).generateSizeForScreen).isActive = true
            image.heightAnchor.constraint(equalToConstant: CGFloat(10).generateSizeForScreen).isActive = true
            return image
        }()
        
        //MARK: - firstCheckInLabel
        lazy var firstCheckInLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
            label.numberOfLines = 1
            label.text = "\(startHour ?? " ") -  \(endHour ?? " ")"
            label.textAlignment = .right
            label.widthAnchor.constraint(equalToConstant: CGFloat(200).generateSizeForScreen).isActive = true
            
            return label
        }()
        
        //MARK: - firstPriceLabel
        lazy var firstPriceLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
            label.numberOfLines = 1
            label.text = "R$ \(totalPrice ?? " ")"
            
            return label
        }()
        
        stackView.addArrangedSubviews([firstHourImage, firstCheckInLabel, firstPriceLabel])
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
    
    lazy var hoursStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = CGFloat(19).generateSizeForScreen
        
        return stackView
    }()

    //MARK: - amountImage
    lazy var amountImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.dolar.rawValue)
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
                                 hoursStackView,
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
            
            hoursStackView.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: CGFloat(19).generateSizeForScreen),
            hoursStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: CGFloat(-32).generateSizeForScreen),
            hoursStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat(17).generateSizeForScreen),
            
            amountLabel.topAnchor.constraint(equalTo: hoursStackView.bottomAnchor, constant: 19),
            amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            amountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -19),
            
            totalLabel.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor, constant: -34),
            totalLabel.centerYAnchor.constraint(equalTo: amountLabel.centerYAnchor),
            
            amountImage.centerYAnchor.constraint(equalTo: amountLabel.centerYAnchor),
            amountImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat(17).generateSizeForScreen),
            amountImage.heightAnchor.constraint(equalToConstant: 10),
            amountImage.widthAnchor.constraint(equalToConstant: 10),

            bottomLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bottomLine.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 0.3),
            bottomLine.widthAnchor.constraint(equalToConstant: 334),
        ])
    }
    
    func setupCell(_ reservationDate: ReservationDate) {
        dayLabel.text = reservationDate.day
        var totalPrice = 0.0
        for hour in reservationDate.hours {
            let hourStackView = createHourStackView(startHour: hour.start_dt, endHour: hour.end_dt, totalPrice: hour.hour_price)
            hoursStackView.addArrangedSubview(hourStackView)
            let hourPrice = Double(hour.hour_price.replacingOccurrences(of: ",", with: "."))
            totalPrice += hourPrice ?? 0.0
        }
        let amountString = String(format: "R$ %.2f", totalPrice).replacingOccurrences(of: ".", with: ",")
        amountLabel.text = amountString
    }
}
