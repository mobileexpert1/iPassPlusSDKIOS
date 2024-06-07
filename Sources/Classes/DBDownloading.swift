//
//  DBDownloading.swift
//  IpassFrameWork1
//
//  Created by Mobile on 10/04/24.
//

import Foundation
import DocumentReader
import Amplify
import AWSCognitoAuthPlugin
//import Amplify
public class DataBaseDownloading{
    
    
    public static func testDBIssue() {
        DocReader.shared.runAutoUpdate(databaseID: "Full", progressHandler: { (progress) in
            let progressString111 = String(format: "%.1f", progress.fractionCompleted * 100)
            print(progressString111) // progress block
        }, completion: { (success, error) in
            if success {
                print(success) // Success state
            } else {
                print(error) // Error status
            }
        })
    }
    
    
    public static func initialization(completion: @escaping (String, String, String) -> Void) {
        
        do {
           // Amplify.Logging.logLevel = .verbose
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            
            
           // try Amplify.configure()
        } catch {
        }
        
        // Custom path to your configuration file
       
        
        
        let configFileName = "amplifyconfiguration.json"

        if let configFileURL = Bundle.module.url(forResource: configFileName, withExtension: nil) {
            let configFilePath = configFileURL.path
            if let amplifyConfig = loadAmplifyConfiguration(from: configFilePath) {
                // Configure Amplify with the loaded configuration
                do {
                    try Amplify.configure(amplifyConfig)
                }
                catch {
                }
            } else {
                // Handle error loading or decoding configuration
            }
        } else {
        }
        
        
        DocumentReaderService.shared.initializeDatabaseAndAPI(progress: { state in
            var progressValue = ""
            var status = ""
            var validationError = ""
            switch state {
            case .downloadingDatabase(progress: let progress):
                let progressString = String(format: "%.1f", progress * 100)
                progressValue = "Downloading database: \(progressString)%"
            case .initializingAPI:
                status = "Start Now"
            case .completed:
                break
            case .error(let text):
                validationError = text
            }
            completion(progressValue, status, validationError)
        })
    }
    
    
    public static  func loadAmplifyConfiguration(from path: String) -> AmplifyConfiguration? {
        // Read configuration data from the custom path
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            return nil
        }

        // Decode the configuration data into an AmplifyConfiguration object
        do {
            let configuration = try JSONDecoder().decode(AmplifyConfiguration.self, from: data)
            return configuration
        } catch {
            return nil
        }
    }


    
    
}
