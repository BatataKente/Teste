//
//  EndPointsEnum.swift
//  Teste
//
//  Created by Josicleison on 09/08/22.
//

//Enum for Endpoints

/* The enum was created to 
 */

enum EndPoints: String {
    
    //Utils
    case utilsStates = "/utils/states"
    case utilsCities = "/cities"
    case utilsMarketSegments = "/utils/marketSegments"
    case utilsCompanySizes = "/utils/companySizes"
    case utilsCompanyClassifications = "/utils/companyClarifications"
    case utilsPhoneNumber = "/utils/phoneNumber"
    
    
    //Users
    case usersExport = "/users/export"
    case usersHobbies = "/users/hobbies"
    case usersInterests = "/users/interests"
    case usersOccupations = "/users/occupations"
    case usersWorkModels = "/users/workModels"
    case users = "/users"
    case	usersAmount = "/users/amount"
    case usersUuid = "uuid"
    case usersPassword = "/password"
    case usersValidate = "/validate"
    case usersCode = "/code"
    case usersPictures = "/pictures"
    case usersPicture = "/picture"
    case usersCreditWallets = "/creditWallets"
    
    // Partners
    case partnersExport = "/partners/export"
    case partners = "/partners"
    case partnersAmount = "/partners/amount"
    case partnersId = "/id"
    case partnersFinancial = "financial"
    case partnersContacts = "contacts"
    case partnersDoorLocks = "doorLocks"
    
    // Sites
    
    
}
