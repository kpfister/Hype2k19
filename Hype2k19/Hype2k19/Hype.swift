//
//  Hype.swift
//  Hype2k19
//
//  Created by Karl Pfister on 7/9/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import Foundation
import CloudKit

struct Constants {
    static let recordTypeKey = "Hype"
    fileprivate static let recordTextKey = "content"
    fileprivate static let recordTimestampKey = "Timestamp"
}

class Hype {
    
    let hypeText: String
    let timestamp: Date
    // Creating a Hype
    init(hypeText: String, timeStamp: Date) {
        self.hypeText = hypeText
        self.timestamp = timeStamp
        
    }
}

extension Hype {
    // Creating a Hype from a record
    convenience init?(ckRecord: CKRecord) {
        guard let hypeText = ckRecord[Constants.recordTextKey] as? String, let hypeTimestamp = ckRecord[Constants.recordTimestampKey] as? Date else {return nil}
        self.init(hypeText: hypeText, timeStamp: hypeTimestamp)
    }
}

// Createing a CKRecord from a Hype
extension CKRecord {
    convenience init(hype: Hype) {
        self.init(recordType: Constants.recordTypeKey)
        self.setValue(hype.hypeText, forKey: Constants.recordTextKey)
        self.setValue(hype.timestamp, forKey: Constants.recordTimestampKey)
    }
}
