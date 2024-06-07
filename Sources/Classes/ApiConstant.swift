//
//  File.swift
//  
//
//  Created by MOBILE on 23/05/24.
//


import Foundation

struct Apis {
    static let baseUrl = "https://plusapi.ipass-mena.com/api/v1/ipass/"
}

// MARK: - FORM
// Login Api
struct UserLoginApi {
    static let baseApi = (Apis.baseUrl) + "create/authenticate/login"
    static let email = "email"
    static let password = "password"
}

// Create Session Api
struct CreateSessionApi {
    static let baseApi = (Apis.baseUrl) + "plus/face/session/create?token="
    static let email = "email"
    static let auth_token = "auth_token"
}


// Save Data Api
struct SaveDataApi {
    static let baseApi = (Apis.baseUrl) + "initiate/process/sdk?token="
    static let sessionId = "sessionId"
    static let randomid = "randomid"
    static let social_media_email = "social_media_email"
    static let phone_number = "phone_number"
    static let ipadd = "ipadd"
    static let email = "email"
    static let workflow = "workflow"
    static let idv_data = "idv_data"
    static let source = "source"
}

// Save Data Api
struct GetDataApi {
    static let baseApi = (Apis.baseUrl) + "idv/getAll/data?token="
    static let sesid = "&sesid="
}

// Check Permission Api
struct getPermissionStatus {
    static let baseApi = (Apis.baseUrl) + "customer/access?token="
}
