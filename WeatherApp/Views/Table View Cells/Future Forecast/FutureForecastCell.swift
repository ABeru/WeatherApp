//  
//  FutureForecastCell.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 21/12/2022.
//

import UIKit

// MARK: - FutureForecast Cell
final class FutureForecastCell: UITableViewCell, ConfigurableUITableViewCell {
    // MARK: Subviews
    private let cellContainer: UIView = { // FIXME: Needs to be changed
        let view: UIView = .init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIModel.Colors.shadowColor.cgColor
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowRadius = 10
        view.layer.shouldRasterize = true
        return view
    }()
    
    private let weatherStackView: UIStackView = {
        let stack: UIStackView = .init()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = UIModel.Layout.weatherStackViewSpacing
        return stack
    }()
    
    private let dayLabel: UILabel = {
        let label: UILabel = .init()
        label.textColor = UIModel.Colors.themeColor
        label.font = UIModel.Fonts.weather
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label: UILabel = .init()
        label.textColor = UIModel.Colors.themeColor
        label.font = UIModel.Fonts.weather
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherIconView: UIImageView = {
        let imageView: UIImageView = .init(image: ImageBook.Icons.whiteDayCloudy)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIModel.Colors.themeColor
        return imageView
    }()
    
    // MARK: Properties
    private typealias UIModel = FutureForecastCellUIModel
    
    var day = ""

    // MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: Setup
    private func setUp() {
        setUpView()
        addSubviews()
        setUpLayout()
    }
    
    private func setUpView() {
        backgroundColor = UIModel.Colors.background
        selectionStyle = .none
    }
    
    private func addSubviews() {
        contentView.addSubview(cellContainer)
        
        cellContainer.addSubview(weatherStackView)
        
        weatherStackView.addArrangedSubview(dayLabel)
        weatherStackView.addArrangedSubview(tempLabel)
        weatherStackView.addArrangedSubview(weatherIconView)
    }
    
    private func setUpLayout() {
        NSLayoutConstraint.activate([
            cellContainer.constraintLeading(to: contentView),
            cellContainer.constraintTrailing(to: contentView),
            cellContainer.constraintTop(to: contentView, constant: UIModel.Layout.cellContainerMarginTop),
            cellContainer.constraintBottom(to: contentView),
        
            weatherStackView.constraintLeading(to: cellContainer),
            weatherStackView.constraintTrailing(to: cellContainer),
            weatherStackView.constraintTop(to: cellContainer),
            weatherStackView.constraintBottom(to: cellContainer)
        ])
    }

    // MARK: Configurable Table View Cell
    func configure(parameter: some UITableViewCellParameter) {
        guard let parameters = parameter as? FutureForecastCellParameters else { return }
        day = parameters.day
        
        if parameters.isSelected == true {
            cellContainer.layer.shadowOpacity = 1
        } else {
            cellContainer.layer.shadowOpacity = 0
        }
        
        dayLabel.text = getTodayWeekDay(from: day)
        tempLabel.text = parameters.temp
        
        weatherIconView.image = nil
        loadImage(parameters: parameters)
    }
    
    private func loadImage(parameters: FutureForecastCellParameters) {
        if let url = parameters.imageUrl {
            parameters.loadImage(url, { [weak self] image in
                guard let self = self else { return }
                
                guard
                    let image = image,
                    self.day == parameters.day
                else {
                    return
                }
                
                self.weatherIconView.image = image
            })
        }
    }
    
    // MARK: Helpers
    func getTodayWeekDay(from day: String)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-MM-dd"
        let date = dateFormatter.date(from: day)!
           dateFormatter.dateFormat = "EEE"
           let weekDay = dateFormatter.string(from: date)
           return weekDay
     }

}
