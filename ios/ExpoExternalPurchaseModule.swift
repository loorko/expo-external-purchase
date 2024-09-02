import ExpoModulesCore
//import StoreKit

public class ExpoExternalPurchaseModule: Module {
  public func definition() -> ModuleDefinition {
    Name("ExpoExternalPurchase")

    Function("hello") {
      return "Hello world! 👋"
    }
    /*
    AsyncFunction("canPresentAsync") { () -> Bool in
      if #available(iOS 16.0, *) {
        return await ExternalPurchase.canPresent
      } else {
        throw NSError(domain: "ERR_UNSUPPORTED", code: 0, userInfo: [NSLocalizedDescriptionKey: "iOS 16.0 or higher required."])
      }
    }

    AsyncFunction("presentNoticeSheetAsync") { () -> String in
      if #available(iOS 16.0, *) {
        do {
          let result = try await ExternalPurchase.presentNoticeSheet()
          return "\(result)"  // Assuming `NoticeResult` is a string or convertible to a string
        } catch {
          throw NSError(domain: "ERR_PRESENT_NOTICE_SHEET", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to present notice sheet: \(error.localizedDescription)"])
        }
      } else {
        throw NSError(domain: "ERR_UNSUPPORTED", code: 0, userInfo: [NSLocalizedDescriptionKey: "iOS 16.0 or higher required."])
      }
    }
    */
  }
}