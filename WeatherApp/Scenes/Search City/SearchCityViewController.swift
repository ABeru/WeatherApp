//  
//  SearchCityViewController.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 22/12/2022.
//

import UIKit

// MARK: - SearchCity View Controller
final class SearchCityViewController:
    UIViewController, SearchCityViewable, SearchCityNavigable,
    UITableViewDelegate, UITableViewDataSource,
    UITextFieldDelegate
{
    // MARK: Subviews
    private let dummyView: UIView = {
        let view: UIView = .init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIModel.Colors.containerBackground
        return view
    }()
    
    private let headerContainerView: UIView = {
        let view: UIView = .init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIModel.Colors.containerBackground
        return view
    }()
    
    private let backIconView: UIButton = {
        let button: UIButton = .init()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(ImageBook.Icons.back, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = UIModel.Colors.themeColor
        button.addTarget(self, action: #selector(didClickBackButton(_ :)), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchField: UITextField = {
        let textField: UITextField = .init()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidChangeText), for: .editingChanged)
        textField.backgroundColor = ColorBook.white
        return textField
    }()
    
    private let searchIconView: UIImageView = {
        let imageView: UIImageView = .init(image: ImageBook.Icons.search)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIModel.Colors.themeColor
        return imageView
    }()

    private lazy var cityTableView: UITableView = {
        let tableView: UITableView = .init()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(
            CityCountryCell.self
        )
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIModel.Colors.background
        
        return tableView
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = initActivityIndicator()
    
    // MARK: Properties
    var presenter: (any SearchCityPresentable)!
    
    private typealias UIModel = SearchCityUIModel

    // MARK: Lifecycle  
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
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
        view.addSubview(dummyView)
        view.addSubview(headerContainerView)
        
        headerContainerView.addSubview(backIconView)
        headerContainerView.addSubview(searchField)
        headerContainerView.addSubview(searchIconView)
        
        view.addSubview(cityTableView)
    }

    private func setUpLayout() {
        NSLayoutConstraint.activate([
            dummyView.constraintLeading(to: view),
            dummyView.constraintTrailing(to: view),
            dummyView.constraintTop(to: view),
            dummyView.constraintBottom(to: headerContainerView),
            
            headerContainerView.constraintLeading(to: view),
            headerContainerView.constraintTrailing(to: view),
            headerContainerView.constraintTop(to: view, layoutGuide: .safeArea),
            
            backIconView.constraintLeading(to: headerContainerView, constant: UIModel.Layout.backIconMarginLeading),
            backIconView.constraintTop(to: headerContainerView),
            backIconView.constraintBottom(to: headerContainerView, constant: -UIModel.Layout.backIconMarginBottom),
            backIconView.constraintWidth(to: nil, constant: UIModel.Layout.backIconDimensions),
            backIconView.constraintHeight(to: nil, constant: UIModel.Layout.backIconDimensions),
            
            searchField.constraintLeading(to: backIconView, attribute: .trailing, constant: UIModel.Layout.searchFieldMarginLeading),
            searchField.constraintTop(to: headerContainerView),
            searchField.constraintBottom(to: headerContainerView, constant: -UIModel.Layout.backIconMarginBottom),
            searchField.constraintHeight(to: nil, constant: UIModel.Layout.searchFieldHeight),
            
            searchIconView.constraintLeading(to: searchField, attribute: .trailing, constant: UIModel.Layout.searchIconMarginHor),
            searchIconView.constraintTrailing(to: headerContainerView, constant: -UIModel.Layout.searchIconMarginHor),
            searchIconView.constraintTop(to: headerContainerView),
            searchIconView.constraintBottom(to: headerContainerView, constant: -UIModel.Layout.searchIconMarginBottom),
            searchIconView.constraintWidth(to: nil, constant: UIModel.Layout.searchIconDimensions),
            searchIconView.constraintHeight(to: nil, constant: UIModel.Layout.searchIconDimensions),
            
            cityTableView.constraintLeading(to: view),
            cityTableView.constraintTrailing(to: view),
            cityTableView.constraintTop(to: headerContainerView, attribute: .bottom, constant: UIModel.Layout.cityTableMarginTop),
            cityTableView.constraintBottom(to: view)
        ])
    }
    

    // MARK: Viewable
    func reloadData() {
        cityTableView.reloadData()
    }
    
    @objc private func didClickBackButton(_ sender: UIButton?) {
        presenter.didClickBackButton()
    }

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
    // MARK: Actions
    @objc private func textFieldDidChangeText() {
        presenter.searchFor(city: searchField.text ?? "")
    }
}
