//
//  File.swift
//  
//
//  Created by MOBILE on 10/05/24.
//

import Foundation

func getListOfFlows() -> [[String: Any]] {
    var arrayOfDictionaries = [[String: Any]]()

    // Create dictionaries and add them to the array
    var dictionary1 = [String: Any]()
    dictionary1["flow"] = "Full processing"
    dictionary1["flowId"] = 10031
    dictionary1["Description"] = "This flow includes Document Scanning, Document Authenticity, User Liveness, User Face Matching, AML and social platform"
    arrayOfDictionaries.append(dictionary1)

    var dictionary2 = [String: Any]()
    dictionary2["flow"] = "IdVerification+liveness+AML"
    dictionary2["flowId"] = 10032
    dictionary2["Description"] = "This flow includes Document Scanning, Document Authenticity, User Liveness, User Face Matching and AML "
    arrayOfDictionaries.append(dictionary2)
    
    var dictionary3 = [String: Any]()
    dictionary3["flow"] = "Idverification+AML"
    dictionary3["flowId"] = 10015
    dictionary3["Description"] = "This flow includes Document Scanning, Document Authenticity and AML "
    arrayOfDictionaries.append(dictionary3)
    
    var dictionary4 = [String: Any]()
    dictionary4["flow"] = "idverification+liveness"
    dictionary4["flowId"] = 10011
    dictionary4["Description"] = "This flow includes Document Scanning, Document Authenticity, User Liveness and User Face Matching"
    arrayOfDictionaries.append(dictionary4)
    
   
   

    return arrayOfDictionaries
}
