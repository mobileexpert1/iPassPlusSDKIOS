//
//  ApplicationSetting.swift
//  IpassFrameWork1
//
//  Created by Mobile on 10/04/24.
//

import Foundation
import DocumentReader


class ApplicationSetting {
    static var shared: ApplicationSetting = ApplicationSetting()
    var isDataEncryptionEnabled: Bool = false
    var isRfidEnabled: Bool = false
    var useCustomRfidController: Bool = false
    
    var functionality: Functionality = Functionality()
    var functionalitys: Functionality = DocReader.shared.functionality
}
