import ExpoModulesCore
import StoreKit

public class ExpoExternalPurchaseModule: Module {
  public func definition() -> ModuleDefinition {
    Name("ExpoExternalPurchase")

    Function("hello") {
      return "Hello world! 👋"
    }
    
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
  }
}