import UIKit

public enum AppRunningEnviornment :Int{
    case staging
    case release
}


public class Constants: NSObject {
    public static let kIS_USER_LOGGED_IN = "com.demoApp.kIS_USER_LOGGED_IN"
    public static let BANNER_VISIBLE_DURATION: CGFloat = 3.0
    
    public static let kLOGGED_IN_USER_ID = "com.demoApp.kLOGGED_IN_USER_ID"
    
    public static let kEMAIL_VALIDATION_REGULAR_EXPRESSION = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
    
    
    
    
}




