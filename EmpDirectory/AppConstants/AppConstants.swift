//
//  AppConstants.swift
//  EmpDirectory
//
//  Created by Chanchal Raj on 17/02/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import Foundation

struct AppConstants {
    enum NotificationType:String {
        case kEmployeeDirectoryDidUpdateNotification = "kEmployeeDirectoryDidUpdateNotification"
        var notification : Notification.Name{
            return Notification.Name.init(self.rawValue)
        }
    }
}
