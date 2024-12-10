//
//  CrashService.swift
//
//  Created by Lili Shi on 10/29/24.
//

import FirebaseCrashlytics

struct CrashService {
    static func getService() -> CrashService {
        return CrashService()
    }

    func logDebug(message: String) {
        Crashlytics.crashlytics().log(message)
    }

    func logError(error: Error) {
        Crashlytics.crashlytics().record(error: error)
    }
}
