//
//  FullProcess.swift
//  IpassFrameWork1
//
//  Created by Mobile on 10/04/24.
//

import Foundation
import DocumentReader
import UIKit
import FaceLiveness
import Amplify
import SwiftUI
import Amplify
import AWSCognitoAuthPlugin


enum SelectedFlowType: String {
    case fullProcess = "fullProcess"
    case idVerificationAndLivenessAndAml = "idVerificationAndLivenessAndAml"
    case idVerificationAndAml = "idVerificationAndAml"
    case idVerificationAndLiveness = "idVerificationAndLiveness"
    case idVerification = "idVerification"
}



public class iPassSDKDataObjHandler {
    public init() {}
    
    static let shared = iPassSDKDataObjHandler()
    
    var resultScanData = DocumentReaderResults()
    var livenessResultData = String()
    var authToken = String()
    var userSelectedFlowId = Int()
    var token = String()
    var email = String()
    var sid = String()
    var controller = UIViewController()
    var sessionId = String()
    var isCustom = Bool()
    var userSelectedFlowType = String()
    var loaderColor = UIColor(red: 126/255, green:87/255, blue: 196/255, alpha: 1.0)
}



public class configSdk {
    public static func setLoaderColor(color:UIColor) {
        iPassSDKDataObjHandler.shared.loaderColor = color
    }
    public static func getAvailableScenarios() -> [[String: Any]] {
        let res = getListOfFlows()
        return res
    }
}

public protocol iPassSDKDelegate : AnyObject {
    func getScanCompletionResult(result : String, error : String)
}

public class iPassSDK {
    public init() {}
    
    private var selectedScenario: String?
    private var sectionsData: [CustomizationSection] = []
    
    public static weak var delegate : iPassSDKDelegate?
    
    
    public static  var activityIndicator: UIActivityIndicatorView!
    
    public static  let fullSizeView = UIView()
    
    
    
    private static func addAnimationLoader(controller: UIViewController) {
        
           // Set background color
        fullSizeView.backgroundColor = UIColor.black.withAlphaComponent(0.7)

           // Add the view to the main view
        controller.view.addSubview(fullSizeView)

           // Constrain the view to the edges of the superview
           fullSizeView.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               fullSizeView.topAnchor.constraint(equalTo: controller.view.topAnchor),
               fullSizeView.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor),
               fullSizeView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor),
               fullSizeView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor)
           ])
        
        
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = iPassSDKDataObjHandler.shared.loaderColor
        activityIndicator.center =  controller.view.center
        activityIndicator.hidesWhenStopped = true
        fullSizeView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    public static func startLoaderAnimation() {
        activityIndicator.startAnimating()
    }
    
    public static func stopLoaderAnimation() {
        DispatchQueue.main.async {
            fullSizeView.removeFromSuperview()
            activityIndicator.stopAnimating()
        }
       
    }
    
 
    
    public  static func userOnBoarding(email: String, password: String, completion: @escaping (Bool?, String?) -> Void) {
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        iPassHandler.methodForPost(url: "https://plusapi.ipass-mena.com/api/v1/ipass/create/authenticate/login", params: parameters) { response, error in
            if(error != "") {
                print("Response",response as Any)
                if let json = response as? [String: Any] {
                    if let user = json["user"] as? [String: Any] {
                        if let token = user["token"] as? String {
                            completion(true, token)
                        }
                        else {
                            completion(false, "")
                        }
                    }
                    else {
                        completion(false, "")
                    }
                }
                else {
                    completion(false, "")
                }
            }
        }
        
    }
    
    
    
    public static func fullProcessScanningTest(userEmail:String, flowId: Int, controller: UIViewController, userToken:String, appToken:String) async {
        iPassSDKDataObjHandler.shared.userSelectedFlowId = flowId
        iPassSDKDataObjHandler.shared.authToken = userToken
        iPassSDKDataObjHandler.shared.token = appToken
        iPassSDKDataObjHandler.shared.sid = generateRandomTwoDigitNumber()
        iPassSDKDataObjHandler.shared.email = userEmail
        iPassSDKDataObjHandler.shared.controller = controller
        iPassSDKDataObjHandler.shared.isCustom = false
        createLivenessSession()
     
    }
    
   
    
    
    public static func fullProcessScanningTestqwe(userEmail:String, type: Int, controller: UIViewController, userToken:String, appToken:String) async {
        iPassSDKDataObjHandler.shared.userSelectedFlowId = type
        iPassSDKDataObjHandler.shared.authToken = userToken
        iPassSDKDataObjHandler.shared.token = appToken
        iPassSDKDataObjHandler.shared.sid = generateRandomTwoDigitNumber()
        iPassSDKDataObjHandler.shared.email = userEmail
        iPassSDKDataObjHandler.shared.controller = controller
        iPassSDKDataObjHandler.shared.isCustom = false
        createLivenessSession()
     
    }
    
    
    
    public static func createLivenessSession() {
        DispatchQueue.main.async {
            addAnimationLoader(controller: iPassSDKDataObjHandler.shared.controller)
        }
        let parameters: [String: Any] = [
            "email": iPassSDKDataObjHandler.shared.email,
            "auth_token": iPassSDKDataObjHandler.shared.authToken
        ]
        iPassHandler.methodForPost(url: "https://plusapi.ipass-mena.com/api/v1/ipass/plus/face/session/create?token=\(iPassSDKDataObjHandler.shared.token)", params: parameters) { response, error in
            DispatchQueue.main.async {
                stopLoaderAnimation()
            }
            if(error != "") {
                print("Response",response as Any)
                if let jsonRes = response as? [String: Any] {
                    print("Response",jsonRes)
                    if let sessionId = jsonRes["sessionId"] as? String  {
                        iPassSDKDataObjHandler.shared.sessionId = sessionId
                        openDocumentScanner()
                    }
                    else {
                        self.delegate?.getScanCompletionResult(result: "", error: "Error in creating session")
                    }
                }
                else {
                    self.delegate?.getScanCompletionResult(result: "", error: "Error in creating session")
                }
            }
            else {
                self.delegate?.getScanCompletionResult(result: "", error: "Error in creating session")
            }
            
        }
    }
    
    
    
    public static func openDocumentScanner() {
        DispatchQueue.main.async {
            DocReader.shared.processParams.multipageProcessing = true
            DocReader.shared.processParams.authenticityParams?.livenessParams?.checkHolo = false
            DocReader.shared.processParams.authenticityParams?.livenessParams?.checkOVI = false
            DocReader.shared.processParams.authenticityParams?.livenessParams?.checkMLI = false
            
            DocReader.shared.localizationHandler = { localizationKey in
                // This will look up localization in `CustomLocalization.strings`.
                let result = NSLocalizedString(localizationKey, tableName: "CustomLocalization", comment: "")

                // Localization found in CustomLocalization.
                if result != localizationKey {
                    return result
                }

                // By returning nil we fallback to the default localization provided by SDK.
                return nil
            }
            
            let config = DocReader.ScannerConfig(scenario: "")
            
           config.scenario = RGL_SCENARIO_FULL_AUTH
            
            
            
            DocReader.shared.showScanner(presenter: iPassSDKDataObjHandler.shared.controller, config: config) { [self] (action, docResults, error) in
                if action == .complete || action == .processTimeout {
                    if docResults?.chipPage != 0  {
                        DocReader.shared.startRFIDReader(fromPresenter: iPassSDKDataObjHandler.shared.controller, completion: {  []  (action, results, error) in
                            switch action {
                            case .complete:
                                guard results != nil else {
                                    self.delegate?.getScanCompletionResult(result: "", error: "Document Scanning Error")
                                    return
                                }
                                DispatchQueue.main.async {
                                    iPassSDKDataObjHandler.shared.resultScanData = results!
                                    Task { @MainActor in
                                        await startCamera()
                                    }
                                }
                            case .cancel:
                                guard docResults != nil else {
                                    return
                                }
                                DispatchQueue.main.async {
                                    iPassSDKDataObjHandler.shared.resultScanData = docResults!
                                    Task { @MainActor in
                                        await startCamera()
                                    }
                                }
                                
                            case .processTimeout:
                               
                                iPassSDKDataObjHandler.shared.controller.view.showToast(toastMessage: "Something went wrong with NFC.", duration: 2)
                                guard docResults != nil else {
                                    return
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    iPassSDKDataObjHandler.shared.resultScanData = docResults!
                                    Task { @MainActor in
                                        await startCamera()
                                    }
                                }

                                
                            case .error:
                                print("Error")
                                iPassSDKDataObjHandler.shared.controller.view.showToast(toastMessage: "Something went wrong with NFC.", duration: 2)
                                guard docResults != nil else {
                                    return
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    iPassSDKDataObjHandler.shared.resultScanData = docResults!
                                    Task { @MainActor in
                                        await startCamera()
                                    }
                                }
                                
                            default:
                                break
                            }
                        })
                    
                    }
                    else {
                        DispatchQueue.main.async {
                            iPassSDKDataObjHandler.shared.resultScanData = docResults!
                            Task { @MainActor in
                                await startCamera()
                            }
                        }
                    }
                    
                }
                else  if action == .cancel  {
                    self.delegate?.getScanCompletionResult(result: "", error: "Document Scanning Error")
                }
                else  if action == .processTimeout  {
                    self.delegate?.getScanCompletionResult(result: "", error: "Document Scanning Error")
                }
            }
        }
    }
    
    public static func startCamera() async {
        await fetchCurrentAuthSession()
    }
    
    private static func fetchCurrentAuthSession() async {
        DispatchQueue.main.async {
                  addAnimationLoader(controller: iPassSDKDataObjHandler.shared.controller)
              }
         do {
             let session = try await Amplify.Auth.fetchAuthSession()
             print("Is user signed in - \(session.isSignedIn)")
             
             print(session)
             if(session.isSignedIn == true) {
                 faceLivenessApi()
             }
             else {
                 await signIn()
             }
             
         } catch let error as AuthError {
             print("Fetch session failed with error \(error)")
         } catch {
             print("Unexpected error: \(error)")
         }
     }
    
    
    private static func faceLivenessApi()  {
     
        DispatchQueue.main.async {
            stopLoaderAnimation()
            var swiftUIView = FaceClass()
            swiftUIView.sessoinIdValue = iPassSDKDataObjHandler.shared.sessionId
            let hostingController = UIHostingController(rootView: swiftUIView)
            hostingController.modalPresentationStyle = .fullScreen
            iPassSDKDataObjHandler.shared.controller.present(hostingController, animated: true)
          
            NotificationCenter.default.addObserver(forName: NSNotification.Name("dismissSwiftUI"), object: nil, queue: nil) { (data) in
                NotificationCenter.default.removeObserver(self)
                NotificationCenter.default.removeObserver(self, name: NSNotification.Name("dismissSwiftUI"), object: nil)

                print("userInfo from swift ui class-->> ",data.userInfo?["status"] ?? "no status value")
                hostingController.dismiss(animated: true, completion: nil)
               
               
                DispatchQueue.main.async {
                          addAnimationLoader(controller: iPassSDKDataObjHandler.shared.controller)
                      }
                
                
                
                
                iPassHandler.getresultliveness() { (data, error) in
            
                    if let error = error {
                        print("Error: \(error)")
                        DispatchQueue.main.async {
                                            stopLoaderAnimation()
                                        }
                        self.delegate?.getScanCompletionResult(result: "", error: "Liveness result not processed")
                        return
                    }
                 
                    
                    if let data = data {
                        if let dataString = String(data: data, encoding: .utf8) {
                            iPassSDKDataObjHandler.shared.livenessResultData = dataString
                            
                            iPassHandler.saveDataPostApi { data, error in
                                
                                if(error == nil) {
                                    print(Date())
                                    iPassHandler.getDataFromAPI() { (data, error) in
                                        print(Date())
                                        if let error = error {
                                            print("Error: \(error)")
                                            DispatchQueue.main.async {
                                                                stopLoaderAnimation()
                                                            }
                                            self.delegate?.getScanCompletionResult(result: "", error: "Liveness result not processed")
                                            return
                                        }
                                        
                                        if let data = data {
                                            if let dataString = String(data: data, encoding: .utf8) {
                                                print("getDataFromAPI completed")
                                                DispatchQueue.main.async {
                                                    stopLoaderAnimation()
                                                }
                                                self.delegate?.getScanCompletionResult(result: dataString, error: "")
                                                
                                            } else {
                                                DispatchQueue.main.async {
                                                                    stopLoaderAnimation()
                                                                }
                                                print("Error converting data to string.")
                                                self.delegate?.getScanCompletionResult(result: "", error: "Liveness result not processed")
                                            }
                                        }
                                    }
                                }
                                else {
                                    DispatchQueue.main.async {
                                                        stopLoaderAnimation()
                                                    }
                                    self.delegate?.getScanCompletionResult(result: "", error: "Time out")
                                }
                            }
                           
                            
                            
                        } else {
                            print("Error converting data to string.")
                        }
                    }
                    
                }
            }
        }
     }
   
 
    
    public static func getLivenessFeedback() {
        
        let parameters: [String: Any] = [:]
        
        iPassHandler.methodForPost(url: "https://plusapi.ipass-mena.com/api/v1/ipass/plus/session/result?sessionId=\(iPassSDKDataObjHandler.shared.sessionId)&sid=\(iPassSDKDataObjHandler.shared.sid)&email=\(iPassSDKDataObjHandler.shared.email)&token=\(iPassSDKDataObjHandler.shared.token)&auth_token=\(iPassSDKDataObjHandler.shared.authToken)", params:parameters) { response, error in
            if let dataString = String(data: response as! Data, encoding: .utf8) {
                iPassSDKDataObjHandler.shared.livenessResultData = dataString
            }
        }
    }
    
    public static func fullProcessScanning(userEmail:String, type: Int, controller: UIViewController, userToken:String, appToken:String) async {
      
        var translationDictionary = [String : String]()
       // ENG, AR, FR, SP, TURKISH, URDU, GERMAN, KURDISH
        var currentLanguage = "en"
        
        
        if let preferredLanguageCode = Locale.preferredLanguages.first {
             currentLanguage = Locale(identifier: preferredLanguageCode).languageCode ?? "en"
            print("Device's preferred language code: \(currentLanguage)")
          
        } else {
            print("Unable to determine the device's preferred language code.")
        }
        
      
       
        if(currentLanguage.lowercased() == "en") {
            let dataValues = EnglishDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        
        else if(currentLanguage.lowercased() == "ar") {
            let dataValues = ArabicDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        
        else if(currentLanguage.lowercased() == "fr") {
            let dataValues = FrenchDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        
        else if(currentLanguage.lowercased() == "sp") {
            let dataValues = SpanishDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        
        else if(currentLanguage.lowercased() == "tr") {
            let dataValues = TurkishDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        
        else if(currentLanguage.lowercased() == "ur") {
            let dataValues = UrduDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        
        else if(currentLanguage.lowercased() == "de") {
            let dataValues = GermanDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        
        else if(currentLanguage.lowercased() == "ku") {
            let dataValues = KurdishDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        else {
            let dataValues = EnglishDataValues()
            translationDictionary = dataValues.getDictionary()
        }
        
        DocReader.shared.localizationHandler = { localizationKey in
            // This will look up localization in `CustomLocalization.strings`.
            
            if let updatedString = translationDictionary[localizationKey] {
                return updatedString
            }
            
            return nil
            
//            let result = NSLocalizedString(localizationKey, tableName: "EnLocalizable", comment: "")
//            if(result == "strPresentNextPage") {
//                print("ADSADSS")
//                print(translationDictionary[localizationKey]!)
//                return translationDictionary[localizationKey]!
//            }
//            if(localizationKey == "strPresentNextPage") {
//                print("ADSADSSrrr")
//            }
//            return nil
        }
        
        
        iPassSDKDataObjHandler.shared.userSelectedFlowId = type
        iPassSDKDataObjHandler.shared.authToken = userToken
        iPassSDKDataObjHandler.shared.token = appToken
        iPassSDKDataObjHandler.shared.sid = generateRandomTwoDigitNumber()
        iPassSDKDataObjHandler.shared.email = userEmail
        iPassSDKDataObjHandler.shared.controller = controller
        iPassSDKDataObjHandler.shared.isCustom = true
        
        DispatchQueue.main.async {
            addAnimationLoader(controller: iPassSDKDataObjHandler.shared.controller)
        }
       
            iPassHandler.createSessionApi() { status in
                DispatchQueue.main.async {
                    stopLoaderAnimation()
                }
                if status == true {
                    DispatchQueue.main.async {
                        DocReader.shared.processParams.returnUncroppedImage = true
                        DocReader.shared.processParams.multipageProcessing = true
                        DocReader.shared.processParams.authenticityParams?.livenessParams?.checkHolo = false
                        DocReader.shared.processParams.authenticityParams?.livenessParams?.checkOVI = false
                        DocReader.shared.processParams.authenticityParams?.livenessParams?.checkMLI = false
                        
                        let config = DocReader.ScannerConfig(scenario: "")
                        config.scenario = RGL_SCENARIO_FULL_AUTH
                        DocReader.shared.showScanner(presenter: controller, config: config) { [self] (action, docResults, error) in
                            if action == .complete || action == .processTimeout {
                               
                                if docResults?.chipPage != 0  {
                                    DocReader.shared.startRFIDReader(fromPresenter: controller, completion: {  []  (action, results, error) in
                                        switch action {
                                        case .complete:
                                            guard results != nil else {
                                                self.delegate?.getScanCompletionResult(result: "", error: "Document Scanning Error")
                                                return
                                            }
                                            DispatchQueue.main.async {
                                                iPassSDKDataObjHandler.shared.resultScanData = results!
                                                Task { @MainActor in
                                                    await startCamera()
                                                }
                                            }
                                        case .cancel:
                                            guard docResults != nil else {
                                                return
                                            }
                                            DispatchQueue.main.async {
                                                iPassSDKDataObjHandler.shared.resultScanData = docResults!
                                                Task { @MainActor in
                                                    await startCamera()
                                                }
                                            }
                                            
                                        case .processTimeout:
                                           
                                            iPassSDKDataObjHandler.shared.controller.view.showToast(toastMessage: "Something went wrong with NFC.", duration: 2)
                                            guard docResults != nil else {
                                                return
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                                iPassSDKDataObjHandler.shared.resultScanData = docResults!
                                                Task { @MainActor in
                                                    await startCamera()
                                                }
                                            }

                                            
                                        case .error:
                                            print("Error")
                                            iPassSDKDataObjHandler.shared.controller.view.showToast(toastMessage: "Something went wrong with NFC.", duration: 2)
                                            guard docResults != nil else {
                                                return
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                                iPassSDKDataObjHandler.shared.resultScanData = docResults!
                                                Task { @MainActor in
                                                    await startCamera()
                                                }
                                            }
                                            
                                        default:
                                            break
                                        }
                                    })
                                
                                }
                                else {
                                    DispatchQueue.main.async {
                                        iPassSDKDataObjHandler.shared.resultScanData = docResults!
                                        Task { @MainActor in
                                            await startCamera()
                                        }
                                    }
                                }
                                
                            }
                            else  if action == .cancel  {
                                self.delegate?.getScanCompletionResult(result: "", error: "Document Scanning Error")
                            }
                            else  if action == .processTimeout  {
                                self.delegate?.getScanCompletionResult(result: "", error: "Document Scanning Error")
                            }
                        }
                    }
                }
                else {
                    self.delegate?.getScanCompletionResult(result: "", error: "Liveness Session Error")
                }
            }
        
        
      
    }

    
    

    
  
    
    
  public static  func nsdataToJSON(data: NSData) -> AnyObject? {
        do {
            return try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers) as AnyObject
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }
    

    
    
    private static func generateRandomTwoDigitNumber() -> String {
        let lowerBound = 10
        let upperBound = 999999999
        
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        var randStr =  String((0..<10).map{ _ in letters.randomElement()! })
        
        
        var randomValue = String(Int(arc4random_uniform(UInt32((upperBound - lowerBound + 1)))) + lowerBound)
        
        return randomValue + randStr
    }
    
    
    private static func getDocImages(isForCustom : Bool, userEmail:String, datavalue: DocumentReaderResults, userToken:String, appToken:String, completion: @escaping (String?, Error?) -> Void) {
        
     
        
        
        
       // startCamera(controller:)
        
        
        
        
        
        
//        self.present(hostingController, animated: true) {
//
//        }
       
        
        
//        let randomNo = generateRandomTwoDigitNumber()
//        print("random----->",  randomNo)
        
//        saveDataPostApi(isForCustom : isForCustom, userEmail:userEmail, random: randomNo, results: datavalue, userToken: userToken, appToken: appToken, completion: { (result, error) in
//            if let result = result {
//                completion(result, nil)
//            } else {
//                completion(nil, error)
//            }
//        })
        
    }
    
    
    
    
    
   
    
    

    
    
    
    
    private static func signIn() async {
            do {
                let signInResult = try await Amplify.Auth.signIn(
                    username: "testuser",
                    password: "Apple@123"
                    )
                if signInResult.isSignedIn {
                    print("Sign in succeeded")
                    await fetchCurrentAuthSession()
                }
            } catch let error as AuthError {
                print("Sign in failed \(error)")
            } catch {
                print("Unexpected error: \(error)")
            }
        }
        
    

    
    
    private func randomStringGenerator(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    
    
    
   

    
    
    lazy var onlineProcessing: CustomizationItem = {
        let item = CustomizationItem("Online Processing") { [weak self] in
            guard let self = self else { return }
            //            let container = UINavigationController(rootViewController: OnlineProcessingViewController())
            //            container.modalPresentationStyle = .fullScreen
            //            self.present(container, animated: true, completion: nil)
        }
        return item
    }()
    
    private func initSections() {
        // 1. Default
        let defaultScanner = CustomizationItem("Default (showScanner)") {
            DocReader.shared.functionality = ApplicationSetting.shared.functionality
        }
        
        defaultScanner.resetFunctionality = false
        let stillImage = CustomizationItem("Gallery (recognizeImages)")
        stillImage.actionType = .gallery
        let recognizeImageInput = CustomizationItem("Recognize images with light type") { [weak self] in
            guard let self = self else { return }
            self.recognizeImagesWithImageInput()
        }
        
        recognizeImageInput.actionType = .custom
        let defaultSection = CustomizationSection("Default", [defaultScanner, stillImage, recognizeImageInput])
        sectionsData.append(defaultSection)
        
        // 2. Custom modes
        let childModeScanner = CustomizationItem("Child mode") { [weak self] in
            guard let self = self else { return }
            
        }
        childModeScanner.actionType = .custom
        let manualMultipageMode = CustomizationItem("Manual multipage mode") { [weak self] in
            guard let self = self else { return }
            // Set default copy of functionality
            DocReader.shared.functionality = ApplicationSetting.shared.functionality
            // Manual multipage mode
            DocReader.shared.functionality.manualMultipageMode = true
            DocReader.shared.startNewSession()
            self.showScannerForManualMultipage(controller: UIViewController())
        }
        manualMultipageMode.resetFunctionality = false
        // manualMultipageMode.actionType = .custom
        let customModedSection = CustomizationSection("Custom", [childModeScanner, manualMultipageMode, onlineProcessing])
        sectionsData.append(customModedSection)
        
        // 3. Custom camera frame
        let customBorderWidth = CustomizationItem("Custom border width") { () -> (Void) in
            DocReader.shared.customization.cameraFrameBorderWidth = 10
        }
        let customBorderColor = CustomizationItem("Custom border color") { () -> (Void) in
            DocReader.shared.customization.cameraFrameDefaultColor = .red
            DocReader.shared.customization.cameraFrameActiveColor = .purple
        }
        let customShape = CustomizationItem("Custom shape") { () -> (Void) in
            DocReader.shared.customization.cameraFrameShapeType = .corners
            DocReader.shared.customization.cameraFrameLineLength = 40
            DocReader.shared.customization.cameraFrameCornerRadius = 10
            DocReader.shared.customization.cameraFrameLineCap = .round
        }
        let customOffset = CustomizationItem("Custom offset") { () -> (Void) in
            DocReader.shared.customization.cameraFrameOffsetWidth = 50
        }
        let customAspectRatio = CustomizationItem("Custom aspect ratio") { () -> (Void) in
            DocReader.shared.customization.cameraFramePortraitAspectRatio = 1.0
            DocReader.shared.customization.cameraFrameLandscapeAspectRatio = 1.0
        }
        let customFramePosition = CustomizationItem("Custom position") { () -> (Void) in
            DocReader.shared.customization.cameraFrameVerticalPositionMultiplier = 0.5
        }
        
        let customCameraFrameItems = [customBorderWidth, customBorderColor, customShape, customOffset, customAspectRatio, customFramePosition]
        let customCameraFrameSection = CustomizationSection("Custom camera frame", customCameraFrameItems)
        sectionsData.append(customCameraFrameSection)
        
        // 4. Custom toolbar
        let customTorchButton = CustomizationItem("Custom torch button") { () -> (Void) in
            DocReader.shared.functionality.showTorchButton = true
            DocReader.shared.customization.torchButtonOnImage = UIImage(named: "light-on")
            DocReader.shared.customization.torchButtonOffImage = UIImage(named: "light-off")
        }
        let customCameraSwitch = CustomizationItem("Custom camera switch button") { () -> (Void) in
            DocReader.shared.functionality.showCameraSwitchButton = true
            DocReader.shared.customization.cameraSwitchButtonImage = UIImage(named: "camera")
        }
        let customCaptureButton = CustomizationItem("Custom capture button") { () -> (Void) in
            DocReader.shared.functionality.showCaptureButton = true
            DocReader.shared.functionality.showCaptureButtonDelayFromStart = 0
            DocReader.shared.functionality.showCaptureButtonDelayFromDetect = 0
            DocReader.shared.customization.captureButtonImage = UIImage(named: "palette")
        }
        let customChangeFrameButton = CustomizationItem("Custom change frame button") { () -> (Void) in
            DocReader.shared.functionality.showChangeFrameButton = true
            DocReader.shared.customization.changeFrameButtonExpandImage = UIImage(named: "expand")
            DocReader.shared.customization.changeFrameButtonCollapseImage = UIImage(named: "collapse")
        }
        let customCloseButton = CustomizationItem("Custom close button") { () -> (Void) in
            DocReader.shared.functionality.showCloseButton = true
            DocReader.shared.customization.closeButtonImage = UIImage(named: "close")
        }
        let customSizeOfToolbar = CustomizationItem("Custom size of the toolbar") { () -> (Void) in
            DocReader.shared.customization.toolbarSize = 120
            DocReader.shared.customization.torchButtonOnImage = UIImage(named: "light-on")
            DocReader.shared.customization.torchButtonOffImage = UIImage(named: "light-off")
            DocReader.shared.customization.closeButtonImage = UIImage(named: "big_close")
            //DocReader.shared.customization.
        }
        
        let customToolbarItems = [customTorchButton, customCameraSwitch, customCaptureButton, customChangeFrameButton, customCloseButton, customSizeOfToolbar]
        let customToolbarSection = CustomizationSection("Custom toolbar", customToolbarItems)
        sectionsData.append(customToolbarSection)
        
        // 5. Custom status messages
        let customText = CustomizationItem("Custom text") { () -> (Void) in
            DocReader.shared.customization.showStatusMessages = true
            DocReader.shared.customization.status = "Custom status"
        }
        
        let customTextFont = CustomizationItem("Custom text font") { () -> (Void) in
            DocReader.shared.customization.showStatusMessages = true
            DocReader.shared.customization.statusTextFont = UIFont.systemFont(ofSize: 24, weight: .semibold)
        }
        
        let customTextColor = CustomizationItem("Custom text color") { () -> (Void) in
            DocReader.shared.customization.showStatusMessages = true
            DocReader.shared.customization.statusTextColor = .blue
        }
        let customStatusPosition = CustomizationItem("Custom position") { () -> (Void) in
            DocReader.shared.customization.showStatusMessages = true
            DocReader.shared.customization.statusPositionMultiplier = 0.5
        }
        
        let customStatusItems = [customText, customTextFont, customTextColor, customStatusPosition]
        let customStatusSection = CustomizationSection("Custom status messages", customStatusItems)
        sectionsData.append(customStatusSection)
        
        // 6. Custom result status messages
        let customResultStatusText = CustomizationItem("Custom text") { () -> (Void) in
            DocReader.shared.customization.showResultStatusMessages = true
            DocReader.shared.customization.resultStatus = "Custom result status"
        }
        let customResultStatusFont = CustomizationItem("Custom text font") { () -> (Void) in
            DocReader.shared.customization.showResultStatusMessages = true
            DocReader.shared.customization.resultStatusTextFont = UIFont.systemFont(ofSize: 24, weight: .semibold)
        }
        let customResultStatusColor = CustomizationItem("Custom text color") { () -> (Void) in
            DocReader.shared.customization.showResultStatusMessages = true
            DocReader.shared.customization.resultStatusTextColor = .blue
        }
        let customResultStatusBackColor = CustomizationItem("Custom background color") { () -> (Void) in
            DocReader.shared.customization.showResultStatusMessages = true
            DocReader.shared.customization.resultStatusBackgroundColor = .blue
        }
        let customResultStatusPosition = CustomizationItem("Custom position") { () -> (Void) in
            DocReader.shared.customization.showResultStatusMessages = true
            DocReader.shared.customization.resultStatusPositionMultiplier = 0.5
        }
        
        let customResultStatusItems = [customResultStatusText, customResultStatusFont, customResultStatusColor, customResultStatusBackColor, customResultStatusPosition]
        let customResultStatusSection = CustomizationSection("Custom result status messages", customResultStatusItems)
        sectionsData.append(customResultStatusSection)
        
        // 7. Free custom status
        let freeCustomTextAndPostion = CustomizationItem("Free text + position") { () -> (Void) in
            let fontAttributes =  [NSAttributedString.Key.foregroundColor: UIColor.red, NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 18)]
            DocReader.shared.customization.customLabelStatus = NSAttributedString(string: "Hello, world!", attributes: fontAttributes)
            DocReader.shared.customization.customStatusPositionMultiplier = 0.5
        }
        
        let customUILayerModeStatic = CustomizationItem("Custom Status & Images & Buttons") { [weak self] in
            guard let self = self else { return }
            self.setupCustomUIFromFile()
        }
        let customUILayerButtons = CustomizationItem("Custom Buttons") { [weak self] in
            guard let self = self else { return }
            self.setupCustomUIButtonsFromFile()
        }
        
        let customUILayerModeAnimated = CustomizationItem("Custom Status Animated") { [weak self] in
            guard let self = self else { return }
            
        }
        
        let freeCustomStatusItems = [freeCustomTextAndPostion, customUILayerModeStatic, customUILayerButtons, customUILayerModeAnimated]
        let freeCustomStatusSection = CustomizationSection("Free custom status", freeCustomStatusItems)
        sectionsData.append(freeCustomStatusSection)
        
        // 8. Custom animations
        let customAnimationHelpImage = CustomizationItem("Help animation image") { () -> (Void) in
            DocReader.shared.customization.showHelpAnimation = true
            DocReader.shared.customization.helpAnimationImage = UIImage(named: "credit-card")
        }
        let customAnimationNextPageImage = CustomizationItem("Custom the next page animation") { () -> (Void) in
            DocReader.shared.customization.showNextPageAnimation = true
            DocReader.shared.customization.multipageAnimationFrontImage = UIImage(named: "1")
            DocReader.shared.customization.multipageAnimationBackImage = UIImage(named: "2")
        }
        
        let customAnimationItems = [customAnimationHelpImage, customAnimationNextPageImage]
        let customAnimationSection = CustomizationSection("Custom animations", customAnimationItems)
        sectionsData.append(customAnimationSection)
        
        // 9. Custon tint color
        let customTintColor = CustomizationItem("Activity indicator") { () -> (Void) in
            DocReader.shared.customization.activityIndicatorColor = .red
        }
        let custonNextPageButton = CustomizationItem("Next page button") { () -> (Void) in
            DocReader.shared.functionality.showSkipNextPageButton = true
            DocReader.shared.customization.multipageButtonBackgroundColor = .red
        }
        let customAllVisualElements = CustomizationItem("All visual elements") { () -> (Void) in
            DocReader.shared.customization.tintColor = .blue
        }
        
        let customTintColorItems = [customTintColor, custonNextPageButton, customAllVisualElements]
        let customTintColorSection = CustomizationSection("Custom tint color", customTintColorItems)
        sectionsData.append(customTintColorSection)
        
        // 10. Custom background
        let noBackgroundMask = CustomizationItem("No background mask") { () -> (Void) in
            DocReader.shared.customization.showBackgroundMask = false
        }
        let customBackgroundAlpha = CustomizationItem("Custom alpha") { () -> (Void) in
            DocReader.shared.customization.backgroundMaskAlpha = 0.8
        }
        let customBackgroundImage = CustomizationItem("Custom background image") { () -> (Void) in
            DocReader.shared.customization.borderBackgroundImage = UIImage(named: "viewfinder")
        }
        
        let customBackgroundItems = [noBackgroundMask, customBackgroundAlpha, customBackgroundImage]
        let customBackgroundSection = CustomizationSection("Custom background", customBackgroundItems)
        sectionsData.append(customBackgroundSection)
    }
    
    
    @objc func fireTimer() {
        
    }
    
    
    
    
    private func setupCustomUIFromFile() {
        if let path = Bundle.main.path(forResource: "layer", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
                //                DocReader.shared.customization.actionDelegate = self
                DocReader.shared.customization.customUILayerJSON = jsonDict
            } catch {
                
            }
        }
    }
    
    
    private func setupCustomUIButtonsFromFile() {
        if let path = Bundle.main.path(forResource: "buttons", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
                
                DocReader.shared.functionality.showTorchButton = false
                DocReader.shared.functionality.showCloseButton = false
                
                //DocReader.shared.customization.actionDelegate = self
                DocReader.shared.customization.customUILayerJSON = jsonDict
            } catch {
                
            }
        }
    }
    
    private func showScannerForManualMultipage(controller:UIViewController) {
        let config = DocReader.ScannerConfig(scenario: "")
        config.scenario = selectedScenario
        
        DocReader.shared.showScanner(presenter: controller, config:config) { [weak self] (action, result, error) in
            guard let self = self else { return }
            switch action {
            case .cancel:
                print("Cancelled by user")
                DocReader.shared.functionality.manualMultipageMode = false
            case .complete, .processTimeout:
                guard let results = result else {
                    return
                }
                if results.morePagesAvailable != 0 {
                    // Scan next page in manual mode
                    DocReader.shared.startNewPage()
                    self.showScannerForManualMultipage(controller: UIViewController())
                } else if !results.isResultsEmpty() {
                    self.showResultScreen(results)
                    DocReader.shared.functionality.manualMultipageMode = false
                }
            case .error:
                print("Error")
                guard let error = error else { return }
                print("Error string: \(error)")
            case .process:
                guard let result = result else { return }
                print("Scaning not finished. Result: \(result)")
            default:
                break
            }
        }
    }
    
    
    private func recognizeImagesWithImageInput() {
        let whiteImage = UIImage(named: "white.bmp")
        let uvImage = UIImage(named: "uv.bmp")
        let irImage = UIImage(named: "ir.bmp")
        
        let whiteInput = DocReader.ImageInput(image: whiteImage!, light: .white, pageIndex: 0)
        let uvInput = DocReader.ImageInput(image: uvImage!, light: .UV, pageIndex: 0)
        let irInput = DocReader.ImageInput(image: irImage!, light: .infrared, pageIndex: 0)
        let imageInputs = [whiteInput, irInput, uvInput]
        
        let config = DocReader.RecognizeConfig(imageInputs: imageInputs)
        config.scenario = selectedScenario
        DocReader.shared.recognize(config:config) { action, results, error in
            switch action {
            case .cancel:
                self.stopCustomUIChanges()
                //  print("Cancelled by user")
            case .complete, .processTimeout:
                self.stopCustomUIChanges()
                guard let opticalResults = results else {
                    return
                }
                self.showResultScreen(opticalResults)
            case .error:
                self.stopCustomUIChanges()
                print("Error")
                guard let error = error else { return }
                print("Error string: \(error)")
            case .process:
                guard let result = results else { return }
                print("Scaning not finished. Result: \(result)")
            case .morePagesAvailable:
                print("This status couldn't be here, it uses for -recognizeImage function")
            default:
                break
            }
        }
    }
    
    
    private func stopCustomUIChanges() {
        DocReader.shared.customization.customUILayerJSON = nil
    }
    
    private func enableUserInterfaceOnSuccess() {
        if let scenario = DocReader.shared.availableScenarios.first {
            selectedScenario = scenario.identifier
        }
    }
    
    
    private func startRFIDReading(presenterClass: UIViewController, opticalResults: DocumentReaderResults?, completion: @escaping ([[String: Any]]?, Error?) -> Void) {
        if ApplicationSetting.shared.useCustomRfidController {
            
        } else {
            DocReader.shared.startRFIDReader(fromPresenter: presenterClass, completion: { [weak self] (action, results, error) in
                var scannResultData: [[String: Any]] = []
                guard let self = self else { return }
                switch action {
                case .complete:
                    guard let results = results else {
                        return
                    }
                    
                    for field in results.textResult.fields {
                        let fieldName = field.fieldName
                        let value = field.value
                        let dict = [fieldName: value]
                        scannResultData.append(dict)
                    }
                    completion(scannResultData, nil)
                    
                    self.showResultScreen(results)
                case .cancel:
                    guard let results = opticalResults else {
                        return
                    }
                    
                    for field in results.textResult.fields {
                        let fieldName = field.fieldName
                        let value = field.value
                        let dict = [fieldName: value]
                        scannResultData.append(dict)
                    }
                    completion(scannResultData, nil)
                    self.showResultScreen(results)
                case .error:
                    print("Error")
                    completion(nil,error)
                default:
                    break
                }
            })
        }
    }
    
    
    private func showResultScreen(_ results: DocumentReaderResults) {
        if ApplicationSetting.shared.isDataEncryptionEnabled {
            iPassSDK.processEncryptedResults(results) { decryptedResult in
                DispatchQueue.main.async {
                    guard let results = decryptedResult else {
                        print("Can't decrypt result")
                        return
                    }
                    iPassSDK.presentResults(results)
                }
            }
        } else {
            iPassSDK.presentResults(results)
        }
    }
    
    public static func presentResults(_ results: DocumentReaderResults) {
        var dict = [String:Any]()
        for i in 0 ..< results.textResult.fields.count {
            
            print("Title-=-=",results.textResult.fields[i].fieldName)
            let fileds = results.textResult.fields[i].fieldName
            //            print("Title",results.textResult.fields[i].fieldType)
            print("data-=-=",results.textResult.fields[i].value)
            let value = results.textResult.fields[i].value
            dict = [fileds:value]
            
        }
        
    }
    
    
    
    
    var audioPlayer: AVAudioPlayer?
    func handleDataForNavigation(_ results: DocumentReaderResults)  {
        
    }
    
    
    // MARK: - Encrypted processing
    public static func processEncryptedResults(_ encrypted: DocumentReaderResults, completion: ((DocumentReaderResults?) -> (Void))?) {
        let json = encrypted.rawResult
        
        let data = Data(json.utf8)
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                guard let containers = json["ContainerList"] as? [String: Any] else {
                    completion?(nil)
                    return
                }
                guard let list = containers["List"] as? [[String: Any]] else {
                    completion?(nil)
                    return
                }
                
                let processParam:[String: Any] = [
                    "scenario": RGL_SCENARIO_FULL_PROCESS,
                    "alreadyCropped": true
                ]
                let params:[String: Any] = [
                    "List": list,
                    "processParam": processParam
                ]
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: params, options: []) else {
                    completion?(nil)
                    return
                }
                sendDecryptionRequest(jsonData) { result in
                    completion?(result)
                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
            
        }
    }
    
    public static func sendDecryptionRequest(_ jsonData: Data, _ completion: ((DocumentReaderResults?) -> (Void))? ) {
        guard let url = URL(string: "") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            guard let jsonData = data else {
                completion?(nil)
                return
            }
            
            let decryptedResult = String(data: jsonData, encoding: .utf8)
                .flatMap { DocumentReaderResults.initWithRawString($0) }
            completion?(decryptedResult)
        })
        
        task.resume()
    }
    
    
    
    public static func getRfidCertificates(bundleName: String) -> [PKDCertificate] {
        var certificates: [PKDCertificate] = []
        let masterListURL = Bundle.main.bundleURL.appendingPathComponent(bundleName)
        do {
            let contents = try FileManager.default.contentsOfDirectory(at: masterListURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: .skipsHiddenFiles)
            
            for content in contents {
                //                if let cert = try? Data(contentsOf: content)  {
                //                    certificates.append(PKDCertificate.init(binaryData: cert, resourceType: PKDCertificate.findResourceType(typeName: content.pathExtension), privateKey: nil))
                //                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return certificates
    }
    
    
    
    public static func showCameraViewControllerForMrz(controller:UIViewController) {
        let config = DocReader.ScannerConfig(scenario: "")
        config.scenario = RGL_SCENARIO_FULL_AUTH
        
        DocReader.shared.showScanner(presenter: controller , config:config) {  (action, result, error) in
            // guard let self = self else { return }
            
            switch action {
            case .cancel:
                //  self.stopCustomUIChanges()
                print("Cancelled by user")
            case .complete, .processTimeout:
                //  self.stopCustomUIChanges()
                guard let opticalResults = result else {
                    return
                }
                //                if opticalResults.chipPage != 0 && UserLocalStore.shared.RFIDChipProcessing == true {
                //                    self.startRFIDReading(opticalResults)
                //                } else {
                // showResultScreen(opticalResults)
                // }
            case .error:
                // self.stopCustomUIChanges()
                print("Error")
                guard let error = error else { return }
                print("Error string: \(error)")
            case .process:
                guard let result = result else { return }
                print("Scaning not finished. Result: \(result)")
                print(result.rawResult)
            case .morePagesAvailable:
                print("This status couldn't be here, it uses for -recognizeImage function")
            default:
                break
            }
        }
    }
    public static func getRfidTACertificates() -> [PKDCertificate] {
        var paCertificates: [PKDCertificate] = []
        let masterListURL = Bundle.main.bundleURL.appendingPathComponent("CertificatesTA.bundle")
        do {
            let contents = try FileManager.default.contentsOfDirectory(at: masterListURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: .skipsHiddenFiles)
            
            var filesCertMap: [String: [URL]] = [:]
            
            for content in contents {
                let fileName = content.deletingPathExtension().lastPathComponent
                if filesCertMap[fileName] == nil {
                    filesCertMap[fileName] = []
                }
                filesCertMap[fileName]?.append(content.absoluteURL)
            }
            
            for (_, certificates) in filesCertMap {
                var binaryData: Data?
                var privateKey: Data?
                for cert in certificates {
                    if let data = try? Data(contentsOf: cert) {
                        if cert.pathExtension.elementsEqual("cvCert") {
                            binaryData = data
                        } else {
                            privateKey = data
                        }
                    }
                }
                if let data = binaryData {
                    paCertificates.append(PKDCertificate.init(binaryData: data, resourceType: .certificate_TA, privateKey: privateKey))
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return paCertificates
    }
    
}

public protocol ScanningResultData:AnyObject{
    func getScanningData(result:[String:Any])
}


private class ImageRequest {
    var image1: String = ""
    var image2: String = ""
    
    func isEmpty() -> Bool {
        return image1.isEmpty
    }
}
extension UIImage {
    func toBase64() -> String? {
        // Convert UIImage to Data
        guard let imageData = self.pngData() else {
            return nil
        }
        
        // Convert Data to base64 string
        let base64String = imageData.base64EncodedString(options: [])
        return base64String
    }
}


/*
 
 
 APIHandler.fetchDataliveness(token: datatoken, sessId: UserLocalStore.shared.sessionId) { (data, error) in
 if let error = error {
 print("Error: \(error)")
 return
 }
 
 if let data = data {
 if let dataString = String(data: data, encoding: .utf8) {
 print(dataString)
 } else {
 print("Error converting data to string.")
 }
 }
 }
 */

