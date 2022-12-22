//
//  TableViewExtensions.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//


import UIKit


public protocol UITableViewCellParameter {
    /// `UITableViewCell` reuse ID
    var reuseID: String { get }
}

// MARK: - Cell
/// Protocol that allows `UITableViewCell` to be configured using a parameter.
public protocol ConfigurableUITableViewCell: UITableViewCell {
    /// `UITableViewCell` reuse ID.
    static var reuseID: String { get }
    
    /// Configures `UITableViewCell` using a parameter.
    func configure(parameter: some UITableViewCellParameter)
}

extension ConfigurableUITableViewCell {
    public static var reuseID: String { .init(describing: self) }
}

// MARK: - Table View
/// Allows for the delegation of `UITableViewDelegate`.
///
/// In `MVP`, `VIP`, and `VIPER` architectures, this protocol is conformed to by a `Presenter`.
/// in `MVVM` architecture, this protocol is conformed to by a `ViewModel.`
public protocol UITableViewDelegable {
    /// Notifies that a `UITableViewCell` has been selected and section and row.
    func tableViewDidSelectRow(section: Int, row: Int)
}

/// Allows for the delegation of `UITableViewDataSource`.
///
/// In `MVP`, `VIP`, and `VIPER` architectures, this protocol is conformed to by a `Presenter`.
/// in `MVVM` architecture, this protocol is conformed to by a `ViewModel.`
public protocol UITableViewDataSourceable {
    /// Number of sections in `UITableView`.
    var tableViewNumberOfSections: Int { get }
    
    /// Number of rows in a given sections in `UITableView`.
    func tableViewNumberOfRows(section: Int) -> Int
    
    /// Parameter for `UITableViewCell` used during configuration.
    func tableViewCellParameter(section: Int, row: Int) -> any UITableViewCellParameter
}

// MARK: - Registering
extension UITableView {
    /// Registers `ConfigurableUITableViewCell` for reuse in a `UITableView`.
    public func register(_ cells: any ConfigurableUITableViewCell.Type...) {
        cells.forEach { register($0, forCellReuseIdentifier: $0.reuseID) }
    }
}

// MARK: - Dequeueing and Configuring
extension UITableView {
    /// Dequeues and configures a reusable cell in `UITableView`.
    public func dequeueAndConfigureReusableCell(
        parameter: any UITableViewCellParameter
    ) -> UITableViewCell {
        guard
            let cell = dequeueReusableCell(withIdentifier: parameter.reuseID) as? any ConfigurableUITableViewCell
        else {
            fatalError("Unable to dequeue a cell with identifier \(parameter.reuseID)")
        }
        
        cell.configure(parameter: parameter)
        
        return cell
    }
}
