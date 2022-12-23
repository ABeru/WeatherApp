//  
//  HourlyForecastView.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import UIKit

// MARK: - HourlyForecast View
final class HourlyForecastView:
    UIView,
    UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
{
    // MARK: Subviews
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = {
            let layout: UICollectionViewFlowLayout = .init()
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            return layout
        }()
        
        let collectionView: UICollectionView = .init(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(HourlyForecastCell.self)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIModel.Colors.background
        
        return collectionView
    }()
    
    // MARK: Properties
    private typealias UIModel = HourlyForecastViewUIModel
    
    private var parameters: HourlyForecastViewParameters?
    
    // MARK: Initializers
    init() {
        super.init(frame: .zero)
        setUp()
    }
    
    convenience init(parameters: HourlyForecastViewParameters) {
        self.init()
        configure(parameters: parameters)
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
        addSubview(collectionView)
    }
    
    private func setUpLayout() {
        NSLayoutConstraint.activate([
            collectionView.constraintHeight(to: nil, constant: UIModel.Layout.collectionHeight, priority: .defaultHigh), // Fixes issues in cells
            collectionView.constraintLeading(to: self),
            collectionView.constraintTrailing(to: self),
            collectionView.constraintTop(to: self),
            collectionView.constraintBottom(to: self)
        ])
    }
    
    // MARK: Configuration
    func configure(parameters: HourlyForecastViewParameters) {
        self.parameters = parameters
        
        collectionView.reloadData()
    }
    
    // MARK: Collection View DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        parameters?.hours?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let parameters = parameters else { fatalError() } // Will never occur
        
        return collectionView.dequeueAndConfigureReusableCell(
            indexPath: indexPath,
            parameter: HourlyForecastCellParameters(
                time: parameters.hours?[indexPath.row].time ?? "",
                temp: "\(parameters.hours?[indexPath.row].tempC ?? 0)°"
            )
        )
    }
    
}
