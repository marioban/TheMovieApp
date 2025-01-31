//
//  KeychainManager.swift
//  TheMovieApp
//
//  Created by Mario Ban on 30.01.2025..
//

import SwiftUI
import KeychainSwift

final class KeychainManager {
    let keychain: KeychainSwift
    
    init() {
        self.keychain = KeychainSwift()
        keychain.synchronizable = true
    }
    
    func getAPIKey() -> String? {
        AppStateManager.shared.getAPIKey()
    }
}

struct KeychainManagerKey: EnvironmentKey {
    static let defaultValue: KeychainManager = KeychainManager()
}

extension EnvironmentValues {
    var keychain: KeychainManager {
        get { self[KeychainManagerKey.self] }
        set { self[KeychainManagerKey.self] = newValue }
    }
}
