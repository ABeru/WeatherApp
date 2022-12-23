//  
//  HourlyForecastCell.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import UIKit

// MARK: - HourlyForecast Cell
final class HourlyForecastCell: UICollectionViewCell, ConfigurableUICollectionViewCell {
    // MARK: Subviews
    private let timeLabel: UILabel = {
        let label: UILabel = .init()
        label.textColor = UIModel.Colors.themeColor
        label.font = UIModel.Fonts.timeAndTemp
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherIconView: UIImageView = {
        let imageView: UIImageView = .init()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIModel.Colors.themeColor
        return imageView
    }()
    
    private let tempLabel: UILabel = {
        let label: UILabel = .init()
        label.textColor = UIModel.Colors.themeColor
        label.font = UIModel.Fonts.timeAndTemp
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Properties
    private typealias UIModel = HourlyForecastCellUIModel

    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    }
    
    private func addSubviews() {
        contentView.addSubview(timeLabel)
        contentView.addSubview(weatherIconView)
        contentView.addSubview(tempLabel)
    }
    
    private func setUpLayout() {
        NSLayoutConstraint.activate([
            timeLabel.constraintLeading(to: contentView),
            timeLabel.constraintTrailing(to: contentView),
            timeLabel.constraintTop(to: contentView, constant: UIModel.Layout.timeLabelMarginTop),
            
            weatherIconView.constraintTop(to: timeLabel, attribute: .bottom, constant: UIModel.Layout.weatherIconMarginTop),
            weatherIconView.constraintWidth(to: contentView, multiplier: UIModel.Layout.weatherIconDimensionMult),
            weatherIconView.constraintHeight(to: contentView, multiplier: UIModel.Layout.weatherIconDimensionMult),
            
            tempLabel.constraintLeading(to: contentView),
            tempLabel.constraintTrailing(to: contentView),
            tempLabel.constraintTop(to: weatherIconView, attribute: .bottom, constant: -UIModel.Layout.tempLabelMarginBottom),
            tempLabel.constraintBottom(to: contentView)
                                    
           
        ])
    }

    // MARK: Configurable Collection View Cell
    func configure(parameter: some UICollectionViewCellParameter) {
        guard let parameters = parameter as? HourlyForecastCellParameters else { return }
        
        timeLabel.text = String(parameters.time.dropFirst(11))
        weatherIconView.image = ImageBook.Icons.whiteDayCloudy
        tempLabel.text = parameters.temp
        
    }
}
