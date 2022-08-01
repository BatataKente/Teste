//
//  EnumAssets.swift
//  Teste
//
//  Created by Josicleison on 01/08/22.
//

import UIKit

extension UIView {

    public enum FontsBravve: String {
    
        case medium = "Ubuntu-Medium"
        case regular = "Ubuntu-Regular"
        case bold = "Ubuntu-Bold"
        case koho = "KoHo-Bold"
        case light = "Ubuntu-light"
    }
    
    public enum ButtonsBravve: String {
    
        case whiteBack = "backWhite"
        case filter = "filter"
    }

    public enum ImagesBravve: String {
    
        case exampleHomeOpen_1 = "homeOpen"
        case exampleHomeOpen_2 = "homeOpen2"
        case exampleHomeOpen_3 = "homeOpen3"
        case exampleHomeOpen_4 = "homeOpen4"
        case imageReservs_1 = "imageReservs"
        case imageReservs_2 = "imageReservs2"
        case imageReservs_3 = "imageReservs3"
        case imageReservs_4 = "imageReservs4"
        case blueLogo = "logoBlue"
        case whiteLogo = "logoWhite"
        case blueImageReservs = "imageReservsNav"
        case activiesWay = "wayActivies"
        case cellWay = "wayCell"
        case confirmWay = "wayConfirm"
        case emailWay = "wayEmail"
        case finalCadasterWay_1 = "wayFinalCadaster"
        case finalCadasterWay_2 = "wayFinalCadaster2"
        case loginWay = "wayLogin"
        case nameWay = "wayName"
        case passwordWay = "wayPassword"
        case reservWay_1 = "wayReserv"
        case reservWay_2 = "wayReserv2"
    }

    public enum IconsBravve: String {
    
        case blueActivies = "activiesBlue"
        case grayActivies = "activiesGray"
        case pinkActivies = "activiesPink"
        case book = "book"
        case blueCalendar = "calendarBlue"
        case grayCalendar = "calendarGray"
        case pinkCalendar = "calendarPink"
        case whiteBack = "backWhite"
        case filter = "filter"
    }

    public enum ColorsBravve: String {
    
        case background = "background"
        case Bravvebackground = "backgroundBravve"
        case blue = "blueNav"
        case borderBottomTexfield = "borderBottomTexfield"
        case boxOffice = "boxOffice"
        case gray = "buttonGray"
        case pink = "buttonPink"
        case recoveryPassword = "buttonRecoveryPassword"
        case underline = "buttonUnderline"
        case cards = "cards"
        case color = "Color"
        case coolWorking = "coolWorking"
        case coWorking = "coWorking"
        case grayAlertLabel = "grayAlertLabel"
        case greenAlertLabel = "greenAlertLabel"
        case hotel = "hotel"
        case label = "label"
        case textFieldLabel = "labelTextField"
        case redAlertLabel = "redAlertLabel"
        case reserved = "reserved"
        case cancelReserved = "reservedCancel"
        case searchBar = "searchBar"
        case textField = "textField"
        case textFieldBackground = "textFieldBackground"
    }

    public enum Ride: CGFloat {
    
        case up = 1
        case down = -1
    }

}
