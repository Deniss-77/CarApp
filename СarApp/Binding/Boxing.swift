//
//  Boxing.swift
//  СarApp
//
//  Created by Denis Kravets on 02.07.2021.
//

import Foundation

class Boxing<T> {
    
    typealias Listener = (T) -> ()
    
    // MARK: Properties
    
    private var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    // MARK: Methods
    
    func bind(_ listener: @escaping Listener) {
        self.listener = listener
    }
    
    // MARK: Initializer
    
    init(_ value: T) {
        self.value = value
    }
    
}
