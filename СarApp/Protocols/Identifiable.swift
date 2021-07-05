//
//  Cellable.swift
//  СarApp
//
//  Created by Denis Kravets on 01.07.2021.
//

import Foundation

public protocol Identifiable {
    static var nibName: String { get }
    static var identifier: String { get }
}

public extension Identifiable {
    static var nibName: String { String(describing: Self.self) }
    static var identifier: String { String(describing: Self.self) }
}
