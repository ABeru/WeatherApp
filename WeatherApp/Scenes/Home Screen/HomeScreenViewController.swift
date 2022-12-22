//  
//  HomeScreenViewController.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import UIKit
import CoreLocation

// MARK: - HomeScreen View Controller
final class HomeScreenViewController:
    UIViewController, HomeScreenViewable, HomeScreenNavigable,
    UITableViewDelegate, UITableViewDataSource
{
    // MARK: Subviews
    private lazy var weatherTableView: UITableView = {
        let tableView: UITableView = .init()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(
            HomeHeaderCell.self,
            HourlyForecastTableViewCell.self,
            FutureForecastCell.self
        )
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIModel.Colors.background
        
        return tableView
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = initVocateActivityIndicator()
    
    // MARK: Properties
    var presenter: (any HomeScreenPresentable)!
    
    private typealias UIModel = HomeScreenUIModel

    // MARK: Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        presenter.viewDidLoad()
    }
    
    // MARK: Setup
    private func setUp() {
        setUpView()
        addSubviews()
        setUpLayout()
    }
    
    private func setUpView() {
        view.backgroundColor = UIModel.Colors.background
    }

    private func addSubviews() {
        view.addSubview(weatherTableView)
    }

    private func setUpLayout() {
        NSLayoutConstraint.activate([
            weatherTableView.constraintLeading(to: view),
            weatherTableView.constraintTrailing(to: view),
            weatherTableView.constraintTop(to: view),
            weatherTableView.constraintBottom(to: view)
        ])
    }

    // MARK: Viewable
    func reloadWeather() {
        weatherTableView.reloadData()
    }
    // MARK: Navigable

    // MARK: Table View Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.tableViewDidSelectRow(section: indexPath.section, row: indexPath.row)
    }

    // MARK: Table View DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.tableViewNumberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.tableViewNumberOfRows(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueAndConfigureReusableCell(
            parameter: presenter.tableViewCellParameter(section: indexPath.section, row: indexPath.row)
        )
    }
}
