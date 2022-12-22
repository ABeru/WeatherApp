//
//  ConstraintsExtension.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import UIKit

// MARK: - Horizontal Attribute
extension NSLayoutConstraint.Attribute {
    /// Part of the object’s visual horizontal representation that should be used to get the value for the constraint.
    public enum Horizontal: Int, CaseIterable, @unchecked Sendable {
        // MARK: Cases
        /// Leading edge of the object’s alignment rectangle.
        case leading
        
        /// Center along the x-axis of the object’s alignment rectangle.
        case centerX
        
        /// Trailing edge of the object’s alignment rectangle.
        case trailing
        
        /// Left side of the object’s alignment rectangle.
        case left
        
        /// Right side of the object’s alignment rectangle.
        case right
        
        // MARK: Properties
        /// Converts `HorizontalAttribute` to `NSLayoutConstraint.Attribute`.
        public var toAttribute: NSLayoutConstraint.Attribute {
            switch self {
            case .leading: return .leading
            case .centerX: return .centerX
            case .trailing: return .trailing
            case .left: return .left
            case .right: return .right
            }
        }
    }
}

// MARK: - Constraints
extension UIView {
  
    public func constraintLeading(
        on selfLayoutGuide: UILayoutGuideType? = nil,
        to view: UIView?,
        layoutGuide: UILayoutGuideType? = nil,
        attribute: NSLayoutConstraint.Attribute.Horizontal = .leading,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        priority: UILayoutPriority? = nil
    ) -> NSLayoutConstraint {
        .init(
            item: selfLayoutGuide?.toLayoutGuide(in: self) ?? self,
            attribute: .leading,
            relatedBy: relation,
            toItem: view.flatMap { layoutGuide?.toLayoutGuide(in: $0) } ?? view,
            attribute: attribute.toAttribute,
            multiplier: multiplier,
            constant: constant
        )
    }
    
    public func constraintCenterX(
        on selfLayoutGuide: UILayoutGuideType? = nil,
        to view: UIView?,
        layoutGuide: UILayoutGuideType? = nil,
        attribute: NSLayoutConstraint.Attribute.Horizontal = .centerX,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        priority: UILayoutPriority? = nil
    ) -> NSLayoutConstraint {
        .init(
            item: selfLayoutGuide?.toLayoutGuide(in: self) ?? self,
            attribute: .centerX,
            relatedBy: relation,
            toItem: view.flatMap { layoutGuide?.toLayoutGuide(in: $0) } ?? view,
            attribute: attribute.toAttribute,
            multiplier: multiplier,
            constant: constant
        )
    }
   
    public func constraintTrailing(
        on selfLayoutGuide: UILayoutGuideType? = nil,
        to view: UIView?,
        layoutGuide: UILayoutGuideType? = nil,
        attribute: NSLayoutConstraint.Attribute.Horizontal = .trailing,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        priority: UILayoutPriority? = nil
    ) -> NSLayoutConstraint {
        .init(
            item: selfLayoutGuide?.toLayoutGuide(in: self) ?? self,
            attribute: .trailing,
            relatedBy: relation,
            toItem: view.flatMap { layoutGuide?.toLayoutGuide(in: $0) } ?? view,
            attribute: attribute.toAttribute,
            multiplier: multiplier,
            constant: constant
        )
    }
    
    public func constraintLeft(
        on selfLayoutGuide: UILayoutGuideType? = nil,
        to view: UIView?,
        layoutGuide: UILayoutGuideType? = nil,
        attribute: NSLayoutConstraint.Attribute.Horizontal = .left,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        priority: UILayoutPriority? = nil
    ) -> NSLayoutConstraint {
        .init(
            item: selfLayoutGuide?.toLayoutGuide(in: self) ?? self,
            attribute: .left,
            relatedBy: relation,
            toItem: view.flatMap { layoutGuide?.toLayoutGuide(in: $0) } ?? view,
            attribute: attribute.toAttribute,
            multiplier: multiplier,
            constant: constant
        )
    }
    
    public func constraintRight(
        on selfLayoutGuide: UILayoutGuideType? = nil,
        to view: UIView?,
        layoutGuide: UILayoutGuideType? = nil,
        attribute: NSLayoutConstraint.Attribute.Horizontal = .right,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        priority: UILayoutPriority? = nil
    ) -> NSLayoutConstraint {
        .init(
            item: selfLayoutGuide?.toLayoutGuide(in: self) ?? self,
            attribute: .right,
            relatedBy: relation,
            toItem: view.flatMap { layoutGuide?.toLayoutGuide(in: $0) } ?? view,
            attribute: attribute.toAttribute,
            multiplier: multiplier,
            constant: constant
        )
    }
}

// MARK: - Vertical Attribute
extension NSLayoutConstraint.Attribute {
    /// Part of the object’s visual vertical representation that should be used to get the value for the constraint.
    public enum Vertical: Int, CaseIterable, @unchecked Sendable {
        // MARK: Cases
        /// Top of the object’s alignment rectangle.
        case top
        
        /// Center along the y-axis of the object’s alignment rectangle.
        case centerY
        
        /// Bottom of the object’s alignment rectangle.
        case bottom
        
        /// Object’s baseline. For objects with more than one line of text, this is the baseline for the topmost line of text.
        case firstBaseline
        
        /// Object’s baseline. For objects with more than one line of text, this is the baseline for the bottommost line of text.
        case lastBaseline
        
        // MARK: Properties
        /// Converts `VerticalAttribute` to `NSLayoutConstraint.Attribute`.
        public var toAttribute: NSLayoutConstraint.Attribute {
            switch self {
            case .top: return .top
            case .centerY: return .centerY
            case .bottom: return .bottom
            case .firstBaseline: return .firstBaseline
            case .lastBaseline: return .lastBaseline
            }
        }
    }
}

// MARK: - Constraints
extension UIView {
    
    public func constraintTop(
        on selfLayoutGuide: UILayoutGuideType? = nil,
        to view: UIView?,
        layoutGuide: UILayoutGuideType? = nil,
        attribute: NSLayoutConstraint.Attribute.Vertical = .top,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        priority: UILayoutPriority? = nil
    ) -> NSLayoutConstraint {
        .init(
            item: selfLayoutGuide?.toLayoutGuide(in: self) ?? self,
            attribute: .top,
            relatedBy: relation,
            toItem: view.flatMap { layoutGuide?.toLayoutGuide(in: $0) } ?? view,
            attribute: attribute.toAttribute,
            multiplier: multiplier,
            constant: constant
        )
    }
    
    public func constraintCenterY(
        on selfLayoutGuide: UILayoutGuideType? = nil,
        to view: UIView?,
        layoutGuide: UILayoutGuideType? = nil,
        attribute: NSLayoutConstraint.Attribute.Vertical = .centerY,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        priority: UILayoutPriority? = nil
    ) -> NSLayoutConstraint {
        .init(
            item: selfLayoutGuide?.toLayoutGuide(in: self) ?? self,
            attribute: .centerY,
            relatedBy: relation,
            toItem: view.flatMap { layoutGuide?.toLayoutGuide(in: $0) } ?? view,
            attribute: attribute.toAttribute,
            multiplier: multiplier,
            constant: constant
        )
    }
    
    public func constraintBottom(
        on selfLayoutGuide: UILayoutGuideType? = nil,
        to view: UIView?,
        layoutGuide: UILayoutGuideType? = nil,
        attribute: NSLayoutConstraint.Attribute.Vertical = .bottom,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        priority: UILayoutPriority? = nil
    ) -> NSLayoutConstraint {
        .init(
            item: selfLayoutGuide?.toLayoutGuide(in: self) ?? self,
            attribute: .bottom,
            relatedBy: relation,
            toItem: view.flatMap { layoutGuide?.toLayoutGuide(in: $0) } ?? view,
            attribute: attribute.toAttribute,
            multiplier: multiplier,
            constant: constant
        )
    }
  
}

// MARK: - Dimension Attribute
extension NSLayoutConstraint.Attribute {
    /// Part of the object’s visual dimension representation that should be used to get the value for the constraint.
    public enum Dimension: Int, CaseIterable, @unchecked Sendable {
        // MARK: Cases
        /// Width of the object’s alignment rectangle.
        case width
        
        /// Height of the object’s alignment rectangle.
        case height
        
        // MARK: Properties
        /// Converts `DimensionAttribute` to `NSLayoutConstraint.Attribute`.
        public var toAttribute: NSLayoutConstraint.Attribute {
            switch self {
            case .width: return .width
            case .height: return .height
            }
        }
    }
}

// MARK: - Constraints
extension UIView {
    public func constraintWidth(
        on selfLayoutGuide: UILayoutGuideType? = nil,
        to view: UIView?,
        layoutGuide: UILayoutGuideType? = nil,
        attribute: NSLayoutConstraint.Attribute.Dimension = .width,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        priority: UILayoutPriority? = nil
    ) -> NSLayoutConstraint {
        .init(
            item: selfLayoutGuide?.toLayoutGuide(in: self) ?? self,
            attribute: .width,
            relatedBy: relation,
            toItem: view.flatMap { layoutGuide?.toLayoutGuide(in: $0) } ?? view,
            attribute: attribute.toAttribute,
            multiplier: multiplier,
            constant: constant
        )
    }
    
    public func constraintHeight(
        on selfLayoutGuide: UILayoutGuideType? = nil,
        to view: UIView?,
        layoutGuide: UILayoutGuideType? = nil,
        attribute: NSLayoutConstraint.Attribute.Dimension = .height,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        priority: UILayoutPriority? = nil
    ) -> NSLayoutConstraint {
        .init(
            item: selfLayoutGuide?.toLayoutGuide(in: self) ?? self,
            attribute: .height,
            relatedBy: relation,
            toItem: view.flatMap { layoutGuide?.toLayoutGuide(in: $0) } ?? view,
            attribute: attribute.toAttribute,
            multiplier: multiplier,
            constant: constant
        )
    }
}


// MARK: - UI Layout Guide Type
/// Enumeration that represents `UILayoutGuide`.
public enum UILayoutGuideType {
    // MARK: Cases
    /// Layout guide representing the view’s margins.
    case margins
    
    /// Layout guide representing an area with a readable width within the view.
    case readableContent
    
    /// Layout guide representing the portion of your view that is unobscured by bars and other content.
    case safeArea
    
    /// Layout guide that tracks the keyboard’s position in your app’s layout.
    @available(iOS 15.0, *)
    @available(tvOS, unavailable)
    case keyboard
    
    /// Custom layout guide.
    ///
    /// A `KeyPath` cannot be used in declaration, as generic `Value` disallows the use of subclasses,
    /// such as `UITrackingLayoutGuide` and `UIKeyboardLayoutGuide`.
    ///
    ///     extension UIView {
    ///         var someOtherLayoutGuide: UILayoutGuide { ... }
    ///     }
    ///
    ///     extension UILayoutGuideType {
    ///         static var someOther: Self { .custom({ $0.someOtherLayoutGuide })
    ///     }
    ///
    ///     view.constraintLeading(
    ///         ...
    ///         layoutGuide: .someOther,
    ///         ...
    ///     )
    ///
    case custom((UIView) -> UILayoutGuide)
    
    // MARK: Properties
    /// Converts `UILayoutGuideType` to `UILayoutGuide` within the context of an `UIView`.
    public func toLayoutGuide(in view: UIView) -> UILayoutGuide {
        switch self {
        case .margins:
            return view.layoutMarginsGuide
        
        case .readableContent:
            return view.readableContentGuide
        
        case .safeArea:
            return view.safeAreaLayoutGuide
        
        #if os(iOS)
        case .keyboard:
            if #available(iOS 15.0, *) {
                return view.keyboardLayoutGuide
            } else {
                fatalError() // Safe to call, as case will never be created
            }
        #endif
            
        case .custom(let block):
            return block(view)
        }
    }
}

// MARK: - Storing Layout Constraint
extension NSLayoutConstraint {
    public func storing(in container: inout NSLayoutConstraint?) -> NSLayoutConstraint {
        container = self
        return self
    }
}
