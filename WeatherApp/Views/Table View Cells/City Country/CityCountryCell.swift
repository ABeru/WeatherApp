//  
//  CityCountryCell.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 22/12/2022.
//

import UIKit

// MARK: - CityCountry Cell
final class CityCountryCell: UITableViewCell, ConfigurableUITableViewCell {
    // MARK: Subviews
    private let cityLabel: UILabel = {
        let label: UILabel = .init()
        label.textColor = UIModel.Colors.themeColor
        label.font = UIModel.Fonts.city
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Properties
    private typealias UIModel = CityCountryCellUIModel

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
        contentView.addSubview(cityLabel)
    }
    
    private func setUpLayout() {
        NSLayoutConstraint.activate([
            cityLabel.constraintLeading(to: contentView, constant: UIModel.Layout.cityLabelMarginHor),
            cityLabel.constraintTrailing(to: contentView, constant: -UIModel.Layout.cityLabelMarginHor),
            cityLabel.constraintTop(to: contentView, constant: UIModel.Layout.cityLabelMarginVer),
            cityLabel.constraintBottom(to: contentView, constant: -UIModel.Layout.cityLabelMarginVer)
            
        ])
    }

    // MARK: Configurable Table View Cell
    func configure(parameter: some UITableViewCellParameter) {
        guard let parameters = parameter as? CityCountryCellParameters else { return }
        cityLabel.text = "\(parameters.city), \(parameters.country)"
    }
}
