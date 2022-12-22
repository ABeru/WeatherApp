//  
//  HomeHeaderCell.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import UIKit

// MARK: - HomeHeader Cell
final class HomeHeaderCell: UITableViewCell, ConfigurableUITableViewCell {
    // MARK: Subviews
    private let headerContainerView: UIView = .init()
        .withTranslatesAutoresizingMaskIntoConstraints(false)
    
    private let pinIconView: UIImageView = {
        let imageView: UIImageView = .init(image: ImageBook.Icons.place)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIModel.Colors.themeColor
        return imageView
    }()
    
    private let cityLabel: UILabel = {
        let label: UILabel = .init()
        label.textColor = UIModel.Colors.themeColor
        label.font = UIModel.Fonts.city
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationIconButton: UIButton = {
        let button: UIButton = .init()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(ImageBook.Icons.myLocation, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = UIModel.Colors.themeColor
        return button
    }()
    
    private let dayLabel: UILabel = {
        let label: UILabel = .init()
        label.textColor = UIModel.Colors.themeColor
        label.font = UIModel.Fonts.day
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherStackView: UIStackView = {
        let stack: UIStackView = .init()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = UIModel.Layout.weatherStackViewSpacing
        return stack
    }()
    
    private let weatherIconView: UIImageView = {
        let imageView: UIImageView = .init()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIModel.Colors.themeColor
        return imageView
    }()
    
    private let detailsStackView: UIStackView = {
        let stack: UIStackView = .init()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = UIModel.Layout.detailsStackViewSpacing
        return stack
    }()
    
    private let tempContainerView: UIView = .init()
        .withTranslatesAutoresizingMaskIntoConstraints(false)
    
    private let tempIconView: UIImageView = {
        let imageView: UIImageView = .init(image: ImageBook.Icons.temp)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIModel.Colors.themeColor
        return imageView
    }()
    
    private let tempLabel: UILabel = {
        let label: UILabel = .init()
        label.textColor = UIModel.Colors.themeColor
        label.font = UIModel.Fonts.details
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let humContainerView: UIView = .init()
        .withTranslatesAutoresizingMaskIntoConstraints(false)
    
    private let humIconView: UIImageView = {
        let imageView: UIImageView = .init(image: ImageBook.Icons.humidity)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIModel.Colors.themeColor
        return imageView
    }()
    
    private let humLabel: UILabel = {
        let label: UILabel = .init()
        label.textColor = UIModel.Colors.themeColor
        label.font = UIModel.Fonts.details
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let windContainerView: UIView = .init()
        .withTranslatesAutoresizingMaskIntoConstraints(false)
    
    private let windIconView: UIImageView = {
        let imageView: UIImageView = .init(image: ImageBook.Icons.wind)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIModel.Colors.themeColor
        return imageView
    }()
    
    private let windLabel: UILabel = {
        let label: UILabel = .init()
        label.textColor = UIModel.Colors.themeColor
        label.font = UIModel.Fonts.details
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: Properties
    private typealias UIModel = HomeHeaderCellUIModel
    
    private var day = " "
    
    private var locationButtonHandler: (() -> Void)?

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
        contentView.addSubview(headerContainerView)
        
        headerContainerView.addSubview(pinIconView)
        headerContainerView.addSubview(cityLabel)
        headerContainerView.addSubview(locationIconButton)
        
        contentView.addSubview(dayLabel)

        contentView.addSubview(weatherStackView)

        weatherStackView.addArrangedSubview(weatherIconView)
        weatherStackView.addArrangedSubview(detailsStackView)

        detailsStackView.addArrangedSubview(tempContainerView)
        tempContainerView.addSubview(tempIconView)
        tempContainerView.addSubview(tempLabel)

        detailsStackView.addArrangedSubview(humContainerView)
        tempContainerView.addSubview(humIconView)
        tempContainerView.addSubview(humLabel)

        detailsStackView.addArrangedSubview(windContainerView)
        tempContainerView.addSubview(windIconView)
        tempContainerView.addSubview(windLabel)
    }
    
    private func setUpLayout() {
        NSLayoutConstraint.activate([
            headerContainerView.constraintLeading(to: contentView),
            headerContainerView.constraintTrailing(to: contentView),
            headerContainerView.constraintTop(to: contentView, layoutGuide: .safeArea),
            
            pinIconView.constraintLeading(to: headerContainerView, constant: UIModel.Layout.pinIconMarginLeading),
            pinIconView.constraintWidth(to: nil, constant: UIModel.Layout.pinIconDimension),
            pinIconView.constraintHeight(to: nil, constant: UIModel.Layout.pinIconDimension),
            pinIconView.constraintTop(to: headerContainerView),
            pinIconView.constraintBottom(to: headerContainerView),
            
            cityLabel.constraintLeading(to: pinIconView, attribute: .trailing, constant: UIModel.Layout.cityLabelMarginHor),
            cityLabel.constraintTrailing(to: locationIconButton, attribute: .leading, relation: .greaterThanOrEqual, constant: UIModel.Layout.cityLabelMarginHor),
            cityLabel.constraintTop(to: headerContainerView),
            cityLabel.constraintBottom(to: headerContainerView),
            
            locationIconButton.constraintTrailing(to: contentView, constant: -UIModel.Layout.locationIconButtonMarginTrailing),
            locationIconButton.constraintWidth(to: nil, constant: UIModel.Layout.locationIconButtonDimensions),
            locationIconButton.constraintHeight(to: nil, constant: UIModel.Layout.locationIconButtonDimensions),
            locationIconButton.constraintTop(to: headerContainerView),
            locationIconButton.constraintBottom(to: headerContainerView),
            
            dayLabel.constraintLeading(to: contentView, constant:  UIModel.Layout.dayLabelMarginHor),
            dayLabel.constraintTrailing(to: contentView, constant: -UIModel.Layout.dayLabelMarginHor),
            dayLabel.constraintTop(to: headerContainerView, attribute: .bottom, constant: UIModel.Layout.dayLabelMarginTop),
            
            weatherStackView.constraintCenterX(to: contentView),
            weatherStackView.constraintTop(to: dayLabel, attribute: .bottom,  constant: UIModel.Layout.weatherStackMarginTop),
            weatherStackView.constraintBottom(to: contentView, constant: -UIModel.Layout.weatherStackMarginBottom),
            
            weatherIconView.constraintWidth(to: contentView, multiplier: UIModel.Layout.weatherIconMult),
            weatherIconView.constraintHeight(to: weatherIconView, attribute: .width),
            
            tempIconView.constraintLeading(to: tempContainerView),
            tempIconView.constraintTop(to: tempContainerView),
            tempIconView.constraintBottom(to: tempContainerView),
            
            tempLabel.constraintLeading(to: tempIconView, attribute: .trailing, constant: UIModel.Layout.tempLabelMarginLeading),
            tempLabel.constraintTrailing(to: tempContainerView),
            tempLabel.constraintTop(to: tempContainerView),
            tempLabel.constraintBottom(to: tempContainerView),
            
            humIconView.constraintLeading(to: humContainerView),
            humIconView.constraintTop(to: humContainerView),
            humIconView.constraintBottom(to: humContainerView),
            
            humLabel.constraintLeading(to: humIconView, attribute: .trailing, constant: UIModel.Layout.humLabelMarginLeading),
            humLabel.constraintTrailing(to: humContainerView),
            humLabel.constraintTop(to: humContainerView),
            humLabel.constraintBottom(to: humContainerView),
            
            windIconView.constraintLeading(to: windContainerView),
            windIconView.constraintTop(to: windContainerView),
            windIconView.constraintBottom(to: windContainerView),
            
            windLabel.constraintLeading(to: windIconView, attribute: .trailing, constant: UIModel.Layout.windLabelMarginLeading),
            windLabel.constraintTrailing(to: windContainerView),
            windLabel.constraintTop(to: windContainerView),
            windLabel.constraintBottom(to: windContainerView)
            
        ])
    }

    // MARK: Configurable Table View Cell
    func configure(parameter: some UITableViewCellParameter) {
        guard let parameters = parameter as? HomeHeaderCellParameters else { return }
        day = parameters.day
        
        locationButtonHandler = parameters.locationButtonHandler
        
        cityLabel.text = parameters.city
        dayLabel.text = parameters.day
        
        tempLabel.text = parameters.temp
        humLabel.text = parameters.hum
        windLabel.text = parameters.wind
        
        weatherIconView.image = nil
        loadImage(parameters: parameters)
        
        locationIconButton.addTarget(self, action: #selector(didClickLocation(_ :)), for: .touchUpInside)
        
        
    }
    
    @objc private func didClickLocation(_ sender: UIButton?) {
        if let closure = self.locationButtonHandler {
            closure()
        }
    }
    
    private func loadImage(parameters: HomeHeaderCellParameters) {
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
}
