import ExpoModulesCore
import Foundation
import StoreKit

public class ExpoExternalPurchaseModule: Module {
  public func definition() -> ModuleDefinition {
    Name("ExpoExternalPurchase")

    Function("hello") {
      return "Hello world! 👋"
    }
    
    //AsyncFunction("canPresentAsync") { (message: String) in
    //  return message
    //}
    AsyncFunction("presentNoticeSheetAsync") { (message: String) in
      return message
    }
    AsyncFunction("canPresentAsync") { () async throws -> Bool in
      if #available(iOS 17.4, *) {
        do {
          return try await ExternalPurchase.canPresent
        } catch {
          // Hibát dobunk ahelyett, hogy promise.reject-et hívnánk
          throw NSError(domain: "ERR_CAN_PRESENT", code: 0, userInfo: [NSLocalizedDescriptionKey: "An error occurred while checking if it can present: \(error.localizedDescription)"])
        }
      } else {
        // Hibát dobunk az iOS verzióhoz kapcsolódóan
        throw NSError(domain: "ERR_UNSUPPORTED", code: 0, userInfo: [NSLocalizedDescriptionKey: "iOS 17.4 or higher required."])
      }
    }

/*
    AsyncFunction("canPresentAsync") { () async throws -> Bool in
      if #available(iOS 17.4, *) {
        return await ExternalPurchase.canPresent
      } else {
        throw NSError(domain: "ERR_UNSUPPORTED", code: 0, userInfo: [NSLocalizedDescriptionKey: "iOS 17.4 or higher required."])
      }
    }
    AsyncFunction("presentNoticeSheetAsync") { () async throws -> String in
      if #available(iOS 17.4, *) {
        do {
          let result = try await ExternalPurchase.presentNoticeSheet()
          return "\(result)"  // Assuming `NoticeResult` is a string or convertible to a string
        } catch {
          throw NSError(domain: "ERR_PRESENT_NOTICE_SHEET", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to present notice sheet: \(error.localizedDescription)"])
        }
      } else {
        throw NSError(domain: "ERR_UNSUPPORTED", code: 0, userInfo: [NSLocalizedDescriptionKey: "iOS 17.4 or higher required."])
      }
    }
*/
  }
}