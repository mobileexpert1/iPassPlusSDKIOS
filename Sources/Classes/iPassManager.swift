//
//  File.swift
//  
//
//  Created by MOBILE on 23/05/24.
//

import Foundation
import DocumentReader
import UIKit
import FaceLiveness
import Amplify
import SwiftUI
import Amplify
import AWSCognitoAuthPlugin


public class iPassSDKDataManager {
    public init() {}
    
    public func localizedString(forKey key: String) -> String {
        return NSLocalizedString(key, bundle: Bundle.module, comment: "")
       }
    
    static let shared = iPassSDKDataManager()
    
    var resultScanData = DocumentReaderResults()
    var authToken = String()
    var userSelectedFlowId = Int()
    var userPhoneNumber = String()
    var userSocialMediaEmail = String()
    var token = String()
    var email = String()
    var sid = String()
    var controller = UIViewController()
    var sessionId = String()
    var loaderColor = UIColor(red: 126/255, green:87/255, blue: 196/255, alpha: 1.0)
    var needHologram = true
    var alreadyReturned = false
}



public class configProperties {
    public static func setLoaderColor(color: UIColor) {
        iPassSDKDataManager.shared.loaderColor = color
    }
    public static func needHologramDetection(value: Bool) {
        iPassSDKDataManager.shared.needHologram = value
    }
}

public protocol iPassSDKManagerDelegate : AnyObject {
    func getScanCompletionResult(result : String, transactionId : String, error : String)
}

public class iPassSDKManger {
    public init() {}
    
    public static weak var delegate : iPassSDKManagerDelegate?
    
    public static  var activityIndicator: UIActivityIndicatorView!
    
    public static  let fullSizeView = UIView()
    
    
    
    
    
    
    
    private static func addAnimationLoader() {
        
           // Set background color
        fullSizeView.backgroundColor = UIColor.black.withAlphaComponent(0.7)

           // Add the view to the main view
        iPassSDKDataManager.shared.controller.view.addSubview(fullSizeView)

           // Constrain the view to the edges of the superview
           fullSizeView.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
            fullSizeView.topAnchor.constraint(equalTo: iPassSDKDataManager.shared.controller.view.topAnchor),
               fullSizeView.bottomAnchor.constraint(equalTo: iPassSDKDataManager.shared.controller.view.bottomAnchor),
               fullSizeView.leadingAnchor.constraint(equalTo: iPassSDKDataManager.shared.controller.view.leadingAnchor),
               fullSizeView.trailingAnchor.constraint(equalTo: iPassSDKDataManager.shared.controller.view.trailingAnchor)
           ])
        
        
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = iPassSDKDataManager.shared.loaderColor
        activityIndicator.center =  iPassSDKDataManager.shared.controller.view.center
        activityIndicator.hidesWhenStopped = true
        fullSizeView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
   
    
    public static func stopLoaderAnimation() {
        if fullSizeView.superview == nil {
            // The view has been removed from its superview
        } else {
            // The view is still in the view hierarchy
            fullSizeView.removeFromSuperview()
        }
      
       
       
    }
    
    
    
    
    public  static func UserOnboardingProcess(email: String, password: String, completion: @escaping (Bool?, String?) -> Void) {
        let parameters: [String: Any] = [
            UserLoginApi.email: email,
            UserLoginApi.password: password
        ]
        iPassHandler.methodForPost(url: UserLoginApi.baseApi, params: parameters) { response, error in
            if(error != "") {
                completion(false, "User Login Issue")
            }
            else {
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
    
    private static func generateRandomTwoDigitNumber() -> String {
        let lowerBound = 10
        let upperBound = 999999999
        
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        var randStr =  String((0..<10).map{ _ in letters.randomElement()! })
        
        
        var randomValue = String(Int(arc4random_uniform(UInt32((upperBound - lowerBound + 1)))) + lowerBound)
        
        let currentDate = Date()

        // Step 2: Create a DateFormatter instance
        let dateFormatter = DateFormatter()

        // Step 3: Set the desired date format
        dateFormatter.dateFormat = "yyyy-MM-ddHH-mm"

        // Step 4: Convert the date to a string
        let dateString = dateFormatter.string(from: currentDate)
        
        return "i"+randomValue+"OS" + randStr + dateString + String(iPassSDKDataManager.shared.userSelectedFlowId)
    }
    

    public static func getWorkFlows() -> [[String: Any]] {
        let res = getListOfFlows()
        return res
    }
    
    public static func fetchTransaction(transactionId:String, controller: UIViewController, appToken:String)   {
        iPassSDKDataManager.shared.sid = transactionId
        iPassSDKDataManager.shared.controller = controller
        iPassSDKDataManager.shared.token = appToken
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            addAnimationLoader()
        }
        startDataFetching()
    }
    
    
    private static func checkUserPermission() {
        iPassHandler.methodForGetWithErrorMessages(urlStr: getPermissionStatus.baseApi + iPassSDKDataManager.shared.token ) { response, error in
            if(error != "") {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    stopLoaderAnimation()
                }
                var tempDict = [String: String]()
                tempDict = error?.convertToDictionary() ?? [:]
                self.delegate?.getScanCompletionResult(result: "" , transactionId: "", error: tempDict["message"] ?? "you have reached your transaction limit or you dont have access for transaction")
            }
            else {
                
                var tempDict = [String: String]()
                tempDict = response?.convertToDictionary() ?? [:]
                if(tempDict["message"]?.lowercased() == "sucess") {
                    if(iPassSDKDataManager.shared.userSelectedFlowId == 10031 || iPassSDKDataManager.shared.userSelectedFlowId == 10032 || iPassSDKDataManager.shared.userSelectedFlowId == 10011) {
                         createLivenessSessionID()
                    }
                    else if(iPassSDKDataManager.shared.userSelectedFlowId == 10015 ) {
                        
                         oPenDocumentScanner()
                    }
                    else {
                        self.delegate?.getScanCompletionResult(result: "", transactionId: "",  error: "Work flow id is not valid")
                    }
                }
                else {
                    self.delegate?.getScanCompletionResult(result: "" , transactionId: "", error: tempDict["message"] ?? "you have reached your transaction limit or you dont have access for transaction")
                }
                
                
            }
            
        }
        
    }

    
    
    public static func startScanningProcess(userEmail:String, flowId: Int, socialMediaEmail: String, phoneNumber: String, controller: UIViewController, userToken:String, appToken:String) async   {
        
      
       
        if(flowId == 10031) {
            if(socialMediaEmail == "" ) {
                self.delegate?.getScanCompletionResult(result: "", transactionId: "",  error: "Social media email is requried")
                return
            }
            else if(phoneNumber == "" ) {
                 self.delegate?.getScanCompletionResult(result: "", transactionId: "",  error: "Phone number is requried")
                 return
             }
           else if(isValidEmail(socialMediaEmail) == false) {
                self.delegate?.getScanCompletionResult(result: "", transactionId: "",  error: "Social media email format is not correct")
                return
            }
            
//            else if(isNumeric(phoneNumber) == false) {
//                 self.delegate?.getScanCompletionResult(result: "", transactionId: "",  error: "Only numbers are allowed in phone number")
//                 return
//             }
        }
       
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            addAnimationLoader()
        }
        
        iPassSDKDataManager.shared.userSelectedFlowId = flowId
        iPassSDKDataManager.shared.userSocialMediaEmail = socialMediaEmail
        iPassSDKDataManager.shared.userPhoneNumber = phoneNumber
        iPassSDKDataManager.shared.authToken = userToken
        iPassSDKDataManager.shared.token = appToken
        iPassSDKDataManager.shared.sid = generateRandomTwoDigitNumber()
        iPassSDKDataManager.shared.email = userEmail
        iPassSDKDataManager.shared.controller = controller
        iPassSDKDataManager.shared.alreadyReturned = false
        checkUserPermission()
    

    }
    
    private static var isAuthorized: Bool {
        get async {
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            
            // Determine if the user previously authorized camera access.
            var isAuthorized = status == .authorized
            
            // If the system hasn't determined the user's authorization status,
            // explicitly prompt them for approval.
            if status == .notDetermined {
                isAuthorized = await AVCaptureDevice.requestAccess(for: .video)
            }
            
            return isAuthorized
        }
    }
    
    private static func isNumeric(_ input: String) -> Bool {
        let regex = "^[0-9]+$"
        //let regex = "^\\d{3}-\\d{3}-\\d{4}$"
        let test = NSPredicate(format:"SELF MATCHES %@", regex)
        return test.evaluate(with: input)
    }
    
    private static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private static func createLivenessSessionID() {
        
        let parameters: [String: Any] = [
            CreateSessionApi.email: iPassSDKDataManager.shared.email,
            CreateSessionApi.auth_token: iPassSDKDataManager.shared.authToken
        ]
        iPassHandler.methodForPost(url: CreateSessionApi.baseApi + (iPassSDKDataManager.shared.token), params: parameters) { response, error in
            DispatchQueue.main.async {
                stopLoaderAnimation()
            }
            if(error != "") {
                self.delegate?.getScanCompletionResult(result: "", transactionId: "", error: "Error in creating session")
            }
            else {
                if let jsonRes = response as? [String: Any] {
                    if let sessionId = jsonRes["sessionId"] as? String  {
                        iPassSDKDataManager.shared.sessionId = sessionId
                             oPenDocumentScanner()
                        
                    }
                    else {
                        self.delegate?.getScanCompletionResult(result: "", transactionId: "", error: "Error in creating session")
                    }
                }
                else {
                    self.delegate?.getScanCompletionResult(result: "", transactionId: "", error: "Error in creating session")
                }
            }
            
        }
    }
    
    
        
    
    private static func oPenDocumentScanner()  {
                        
             
//
      
        
        
        
        setDocumentScannerProperties()
        
    }
    
    private static func setDocumentScannerProperties() {
        DocReader.shared.processParams.returnUncroppedImage = true
        DocReader.shared.processParams.multipageProcessing = true
        DocReader.shared.customization.cameraFrameDefaultColor  = UIColor(red: 126/255, green: 87/255, blue: 196/255, alpha: 1)
        DocReader.shared.customization.tintColor  = UIColor(red: 126/255, green: 87/255, blue: 196/255, alpha: 1)
        DocReader.shared.functionality.showSkipNextPageButton = false
        DocReader.shared.processParams.authenticityParams = AuthenticityParams.default()
        DocReader.shared.processParams.authenticityParams?.livenessParams = LivenessParams.default()
        
        
        DocReader.shared.processParams.authenticityParams?.livenessParams?.checkHolo = NSNumber(value: iPassSDKDataManager.shared.needHologram)
        DocReader.shared.processParams.authenticityParams?.livenessParams?.checkOVI = NSNumber(value: iPassSDKDataManager.shared.needHologram)
        DocReader.shared.processParams.authenticityParams?.livenessParams?.checkED = NSNumber(value: iPassSDKDataManager.shared.needHologram)
        DocReader.shared.processParams.authenticityParams?.livenessParams?.checkMLI = NSNumber(value: iPassSDKDataManager.shared.needHologram)
        DocReader.shared.processParams.authenticityParams?.checkImagePatterns = NSNumber(value: iPassSDKDataManager.shared.needHologram)
        DocReader.shared.processParams.authenticityParams?.checkPhotoEmbedding = NSNumber(value: iPassSDKDataManager.shared.needHologram)
        DocReader.shared.processParams.authenticityParams?.checkBarcodeFormat = NSNumber(value: iPassSDKDataManager.shared.needHologram)
        DocReader.shared.processParams.authenticityParams?.checkPhotoComparison = NSNumber(value: iPassSDKDataManager.shared.needHologram)
        DocReader.shared.processParams.authenticityParams?.checkUVLuminiscence = NSNumber(value: iPassSDKDataManager.shared.needHologram)
        DocReader.shared.processParams.authenticityParams?.checkFibers = NSNumber(value: iPassSDKDataManager.shared.needHologram)
        DocReader.shared.processParams.authenticityParams?.checkExtMRZ = NSNumber(value: iPassSDKDataManager.shared.needHologram)
        DocReader.shared.processParams.authenticityParams?.checkExtOCR = NSNumber(value: iPassSDKDataManager.shared.needHologram)
        DocReader.shared.processParams.authenticityParams?.checkIRB900 = NSNumber(value: iPassSDKDataManager.shared.needHologram)
        DocReader.shared.processParams.authenticityParams?.checkIRVisibility = NSNumber(value: iPassSDKDataManager.shared.needHologram)
        DocReader.shared.processParams.authenticityParams?.checkIPI = NSNumber(value: iPassSDKDataManager.shared.needHologram)
        DocReader.shared.processParams.authenticityParams?.checkAxial = NSNumber(value: iPassSDKDataManager.shared.needHologram)
        DocReader.shared.processParams.authenticityParams?.checkLetterScreen = NSNumber(value: iPassSDKDataManager.shared.needHologram)


        
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
            if let updatedString = translationDictionary[localizationKey] {
                return updatedString
            }
            return nil
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            startDocumentProcessing()
        }
        
    }
    
    private static func startDocumentProcessing() {
        
        DispatchQueue.main.async {
            stopLoaderAnimation()
        }
        
        let config = DocReader.ScannerConfig(scenario: "")
        config.scenario = RGL_SCENARIO_FULL_AUTH
        DocReader.shared.showScanner(presenter: iPassSDKDataManager.shared.controller, config: config) { [self] (action, docResults, error) in
            if action == .complete || action == .processTimeout {
               
                if docResults?.chipPage != 0  {
                    DocReader.shared.startRFIDReader(fromPresenter: iPassSDKDataManager.shared.controller, completion: {  []  (action, results, error) in
                        switch action {
                        case .complete:
                            guard results != nil else {
                                self.delegate?.getScanCompletionResult(result: "", transactionId: "", error: "Document Scanning Error")
                                return
                            }
                            DispatchQueue.main.async {
                                iPassSDKDataManager.shared.resultScanData = results!
                                Task { @MainActor in
                                    await startCamera()
                                }
                            }
                        case .cancel:
                            guard docResults != nil else {
                                return
                            }
                            DispatchQueue.main.async {
                                iPassSDKDataManager.shared.resultScanData = docResults!
                                Task { @MainActor in
                                    await startCamera()
                                }
                            }
                            
                        case .processTimeout:
                           
                            iPassSDKDataManager.shared.controller.view.showToast(toastMessage: "Something went wrong with NFC.", duration: 2)
                            guard docResults != nil else {
                                return
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                iPassSDKDataManager.shared.resultScanData = docResults!
                                Task { @MainActor in
                                    await startCamera()
                                }
                            }

                            
                        case .error:
                            iPassSDKDataManager.shared.controller.view.showToast(toastMessage: "Something went wrong with NFC.", duration: 2)
                            guard docResults != nil else {
                                return
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                iPassSDKDataManager.shared.resultScanData = docResults!
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
                        iPassSDKDataManager.shared.resultScanData = docResults!
                        Task { @MainActor in
                            await startCamera()
                        }
                    }
                }
                
            }
            else  if action == .cancel  {
                DispatchQueue.main.async {
                    stopLoaderAnimation()}
                self.delegate?.getScanCompletionResult(result: "", transactionId: "", error: "Document Scanning Error")
            }
            
        }
    }
    
    public static func startCamera() async {
        
        if( iPassSDKDataManager.shared.userSelectedFlowId == 10031 ||  iPassSDKDataManager.shared.userSelectedFlowId == 10032 ||  iPassSDKDataManager.shared.userSelectedFlowId == 10011) {
            await fetchCurrentAuthSession()
        }
        else   {
            DispatchQueue.main.async {
                      addAnimationLoader()
            }
            startSavingDataToPanel()
        }
        
      
    }
    
    private static func fetchCurrentAuthSession() async {
        DispatchQueue.main.async {
                  addAnimationLoader()
              }
         do {
             let session = try await Amplify.Auth.fetchAuthSession()
             
             if(session.isSignedIn == true) {
                 faceLivenessApi()
             }
             else {
                 await signIn()
             }
             
         } catch let error as AuthError {
         } catch {
         }
     }
    
    private static func signIn() async {
            do {
                let signInResult = try await Amplify.Auth.signIn(
                    username: "testuser",
                    password: "Apple@123"
                    )
                if signInResult.isSignedIn {
                    await fetchCurrentAuthSession()
                }
            } catch let error as AuthError {
            } catch {
            }
        }
    
    private static func faceLivenessApi()  {
        DispatchQueue.main.async {
            stopLoaderAnimation()
            var swiftUIView = FaceClass()
            swiftUIView.sessoinIdValue = iPassSDKDataManager.shared.sessionId
            let hostingController = UIHostingController(rootView: swiftUIView)
            hostingController.modalPresentationStyle = .fullScreen
            iPassSDKDataManager.shared.controller.present(hostingController, animated: true)
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("dismissSwiftUI"), object: nil, queue: nil) { (data) in
                NotificationCenter.default.removeObserver(self)
                NotificationCenter.default.removeObserver(self, name: NSNotification.Name("dismissSwiftUI"), object: nil)

                hostingController.dismiss(animated: true, completion: nil)
               
                
                if(iPassSDKDataManager.shared.alreadyReturned == false) {
                    DispatchQueue.main.async {
                              addAnimationLoader()
                    }
                    iPassSDKDataManager.shared.alreadyReturned = true
                    startSavingDataToPanel()
                }
            }
        }
     }
    
    

    
    private static func startSavingDataToPanel() {
        
       
      
        
        let documentDataJson = convertStringToJSON(iPassSDKDataManager.shared.resultScanData.rawResult)
        
        var userIpAddress = "Unable to get IP Address"
        
        if let ipAddress = getIPAddress() {
            userIpAddress = ipAddress
        }
        
        let parameters: [String: Any] = [
            SaveDataApi.sessionId: iPassSDKDataManager.shared.sessionId,
            SaveDataApi.randomid: iPassSDKDataManager.shared.sid,
            SaveDataApi.social_media_email:  iPassSDKDataManager.shared.userSocialMediaEmail ,
            SaveDataApi.phone_number:  iPassSDKDataManager.shared.userPhoneNumber ,
            SaveDataApi.ipadd: userIpAddress,
            SaveDataApi.email: iPassSDKDataManager.shared.email,
            SaveDataApi.workflow: String(iPassSDKDataManager.shared.userSelectedFlowId),
            SaveDataApi.idv_data: documentDataJson ?? "",
            SaveDataApi.source: "iOS",
            
        ]
        iPassHandler.methodForPost(url: SaveDataApi.baseApi + (iPassSDKDataManager.shared.token), params: parameters) { response, error in
            if(error != "") {
                DispatchQueue.main.async {
                    stopLoaderAnimation()
                }
                self.delegate?.getScanCompletionResult(result: "", transactionId: "", error: "Data processing error")
            }
            else {
                startDataFetching()
            }
            
        }
    }
    
    private static func startDataFetching() {
        
            iPassHandler.methodForGet(urlStr: GetDataApi.baseApi + iPassSDKDataManager.shared.token + GetDataApi.sesid + iPassSDKDataManager.shared.sid) { response, error in
                DispatchQueue.main.async {
                    stopLoaderAnimation()
                }
                if(error != "") {
                    self.delegate?.getScanCompletionResult(result: "" , transactionId: "", error: "Data processing error")
                }
                else {
                    self.delegate?.getScanCompletionResult(result: response as! String, transactionId: iPassSDKDataManager.shared.sid, error: "")
                }
                
            }
        
        
      
        
    }
    
    private static func getIPAddress() -> String? {
        var address : String?

        // Get list of all interfaces on the local machine:
        var ifaddr : UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return nil }
        guard let firstAddr = ifaddr else { return nil }

        // For each interface ...
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee

            // Check for IPv4 or IPv6 interface:
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {

                // Check interface name:
                // wifi = ["en0"]
                // wired = ["en2", "en3", "en4"]
                // cellular = ["pdp_ip0","pdp_ip1","pdp_ip2","pdp_ip3"]
                
                let name = String(cString: interface.ifa_name)
                if  name == "en0" || name == "en2" || name == "en3" || name == "en4" || name == "pdp_ip0" || name == "pdp_ip1" || name == "pdp_ip2" || name == "pdp_ip3" {

                    // Convert interface address to a human readable string:
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                &hostname, socklen_t(hostname.count),
                                nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                }
            }
        }
        freeifaddrs(ifaddr)

        return address
    }
    
    private static func convertStringToJSON(_ jsonString: String) -> Any? {
        // Convert the string to Data
        guard let jsonData = jsonString.data(using: .utf8) else {
            return nil
        }
        
        // Use JSONSerialization to parse the data into a JSON object (Dictionary or Array)
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
            return jsonObject
        } catch {
            return nil
        }
    }
}

extension String {
    func convertToDictionary() -> [String: String]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: String]
            } catch {
            }
        }
        return nil
    }
}
