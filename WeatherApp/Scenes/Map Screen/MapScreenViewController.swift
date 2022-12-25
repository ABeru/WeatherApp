//  
//  MapScreenViewController.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 25/12/2022.
//

import UIKit
import MapKit

// MARK: - MapScreen View Controller
final class MapScreenViewController: UIViewController, MKMapViewDelegate, MapScreenViewable, MapScreenNavigable {
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
    
    private let mapLabel: UILabel = {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIModel.Colors.themeColor
        label.font = UIModel.Fonts.city
        label.textAlignment = .center
        label.text = "Map"
        return label
    }()
    
    private lazy var map: MKMapView = {
        let map: MKMapView = .init()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    // MARK: Properties
    var presenter: (any MapScreenPresentable)!
    
    private typealias UIModel = MapScreenUIModel

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        locateUser()
        map.delegate = self
        map.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.revealRegionDetailsWithLongPressOnMap(sender:))))
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
        headerContainerView.addSubview(mapLabel)
        view.addSubview(map)
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
            
            mapLabel.constraintLeading(to: backIconView, attribute: .trailing),
            mapLabel.constraintTrailing(to: headerContainerView, constant: -UIModel.Layout.mapLabelMarginTrailing),
            mapLabel.constraintTop(to: headerContainerView),
            mapLabel.constraintBottom(to: headerContainerView, constant: -UIModel.Layout.mapLabelMarginBottom),
            
            map.constraintLeading(to: view),
            map.constraintTrailing(to: view),
            map.constraintTop(to: headerContainerView, attribute: .bottom),
            map.constraintBottom(to: view)
        ])
    }
    

    // MARK: Viewable
    private func locateUser() {
        guard let location = LocationService.shared.location else { return }
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        map.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
        map.addAnnotation(pin)
    }
    
   @objc private func revealRegionDetailsWithLongPressOnMap(sender: UITapGestureRecognizer) {
        let touchLocation = sender.location(in: map)
        let locationCoordinate = map.convert(touchLocation, toCoordinateFrom: map)
        presenter.didChooseLocation(lat: locationCoordinate.latitude, lon: locationCoordinate.longitude)
    }
    
    @objc private func didClickBackButton(_ sender: UIButton?) {
        presenter.didClickBackButton()
    }

}
