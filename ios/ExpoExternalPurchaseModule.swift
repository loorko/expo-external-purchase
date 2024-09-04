import ExpoModulesCore
import Foundation
import StoreKit

public class ExpoExternalPurchaseModule: Module {
  public func definition() -> ModuleDefinition {
    Name("ExpoExternalPurchase")

    Events("onChangeExternalPurchase")

    AsyncFunction("canPresentAsync") { () async throws -> Bool in
      if #available(iOS 17.4, *) {
        do {
          let result = try await ExternalPurchase.canPresent
          sendEvent("onChangeExternalPurchase", [
            "result": result
          ])
          return result
        } catch {
          throw NSError(domain: "ERR_CAN_PRESENT", code: 0, userInfo: [NSLocalizedDescriptionKey: "An error occurred while checking if it can present: \(error.localizedDescription)"])
        }
      } else {
        throw NSError(domain: "ERR_UNSUPPORTED", code: 0, userInfo: [NSLocalizedDescriptionKey: "iOS 17.4 or higher required."])
      }
    }
    AsyncFunction("presentNoticeSheetAsync") { () async throws -> String in
      if #available(iOS 17.4, *) {
        do {
          let result = try await ExternalPurchase.presentNoticeSheet()
          sendEvent("onChangeExternalPurchase", [
            "result": result
          ])
          switch result {
            case .continuedWithExternalPurchaseToken(let token):
              return token
            default:
              return "Action not allowed"
          }
        } catch {
          throw NSError(domain: "ERR_PRESENT_NOTICE_SHEET", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to present notice sheet: \(error.localizedDescription)"])
        }
      } else {
        throw NSError(domain: "ERR_UNSUPPORTED", code: 0, userInfo: [NSLocalizedDescriptionKey: "iOS 17.4 or higher required."])
      }
    }
  }
}