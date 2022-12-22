//  
//  HourlyForecastCell.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import UIKit

// MARK: - Hourly Forecast Table View Cell
final class HourlyForecastTableViewCell: UITableViewCell, ConfigurableUITableViewCell {
    // MARK: Subviews
    private var hourlyForecastView: HourlyForecastView = .init()
        .withTranslatesAutoresizingMaskIntoConstraints(false)
    // MARK: Properties
    private typealias UIModel = HourlyForecastTableViewCellUIModel

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
        contentView.addSubview(hourlyForecastView)
    }
    
    private func setUpLayout() {
        NSLayoutConstraint.activate([
            hourlyForecastView.constraintLeading(to: contentView, constant: UIModel.Layout.hourlyForecastMarginLeading),
            hourlyForecastView.constraintTrailing(to: contentView),
            hourlyForecastView.constraintTop(to: contentView),
            hourlyForecastView.constraintBottom(to: contentView)
        ])
    }

    // MARK: Configurable Table View Cell
    func configure(parameter: some UITableViewCellParameter) {
        guard let parameters = parameter as? HourlyForecastTableViewCellParameters else { return }
        hourlyForecastView.configure(parameters: .init(hours: parameters.hours))
    }
}
