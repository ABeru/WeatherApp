//
//  CollectionViewExtensions.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import UIKit


public protocol UICollectionViewCellParameter {
    /// `UICollectionViewCell` reuse ID.
    var reuseID: String { get }
}

// MARK: - Cell
/// Protocol that allows `UICollectionViewCell` to be configured using a parameter.
public protocol ConfigurableUICollectionViewCell: UICollectionViewCell {
    /// `UICollectionViewCell` reuse ID.
    static var reuseID: String { get }
    
    /// Configures `UICollectionViewCell` using a parameter.
    func configure(parameter: some UICollectionViewCellParameter)
}

extension ConfigurableUICollectionViewCell {
    public static var reuseID: String { .init(describing: self) }
}

public protocol UICollectionViewDelegable {
    /// Notifies that a `UICollectionViewCell` has been selected and section and row.
    func collectionViewDidSelectRow(section: Int, row: Int)
}

public protocol UICollectionViewDataSourceable {
    /// Number of sections in `UICollectionView`
    var collectionViewNumberOfSections: Int { get }
    
    /// Number of items in a given sections in `UICollectionView`.
    func collectionViewNumberOfItems(section: Int) -> Int
    
    /// Parameter for `UICollectionViewCell` used during configuration.
    func collectionViewCellParameter(section: Int, row: Int) -> any UICollectionViewCellParameter
}

// MARK: - Registering
extension UICollectionView {
    /// Registers `ConfigurableUICollectionViewCell` for reuse in a `UICollectionView`.
    public func register(_ cells: any ConfigurableUICollectionViewCell.Type...) {
        cells.forEach { register($0, forCellWithReuseIdentifier: $0.reuseID) }
    }
}

// MARK: - Dequeueing and Configuring
extension UICollectionView {
    /// Dequeues and configures a reusable cell in `UICollectionView`.
    public func dequeueAndConfigureReusableCell(
        indexPath: IndexPath,
        parameter: any UICollectionViewCellParameter
    ) -> UICollectionViewCell {
        guard
            let cell = dequeueReusableCell(withReuseIdentifier: parameter.reuseID, for: indexPath) as? any ConfigurableUICollectionViewCell
        else {
            fatalError("Unable to dequeue a cell with identifier \(parameter.reuseID)")
        }
        
        cell.configure(parameter: parameter)
        
        return cell
    }
}
