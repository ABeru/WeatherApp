//
//  Alert Extension.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 23/12/2022.
//

import UIKit

public protocol UIAlertViewable {
    /// Presents `UIAlert` with parameters
    func presentAlert(parameters: UIAlertParameters)
}

extension UIAlertViewable where Self: UIViewController {
    public func presentAlert(parameters: UIAlertParameters) {
        let alerC = UIAlertController(
            title: parameters.title,
            message: parameters.message,
            preferredStyle: .alert
        )
        alerC.addAction(
            .init(
                title: "Ok",
                style: .cancel
            )
        )
       
        present(alerC, animated: true)
      
    }
}


public struct UIAlertParameters {
    // MARK: Properties
    /// Title.
    public var title: String?
    
    /// Message.
    public var message: String
    
    // MARK: Initializers
    /// Initializes `UIAlertParameters`.
    init(
        title: String?,
        message: String
    ) {
        self.title = title
        self.message = message
    }
    
}
