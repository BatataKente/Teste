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
    case    usersAmount = "/users/amount"
    case usersUuid = "uuid"
    case usersPassword = "/password"
    case usersValidate = "/validate"
    case usersCode = "/user/code"
    case usersPictures = "/users/pictures"
    case usersPicture = "/users/picture"
    case usersCreditWallets = "/creditWallets"
    
    // Partners
    case partnersExport = "/partners/export"
    case partners = "/partners"
    case partnersAmount = "/partners/amount"
    case partnersId = "/partnersId"
    case partnersFinancial = "partners/financial"
    case partnersContacts = "partners/contacts"
    case partnersDoorLocks = "partners/doorLocks"
    
    // Sites
    case sitesSiteClassification = "/sites/siteClassification"
    case sites = "/sites"
    case sitesId = "/sites/id"
    case sitesContacts = "/sites/contacts"
    
    //Spaces
    case spacesTypes = "/spaces/types"
    case spacesClassifications = "/spaces/classifications"
    case spacesCategories = "/spaces/categories"
    case spacesFacilities = "/spaces/facilities"
    case spacesNoises = "/spaces/noises"
    case spacesContracts = "/spaces/contracts"
    case spaces = "/spaces"
    case spacesId = "/spacesId"
    case spacesList = "/spaces/list"
    case spacesPictures = "/spaces/pictures"
    case spacesPictureUuid = "/spaces/pictures/uuid"
    case spacesFavorite = "/spaces/favorite"
    case spacesQrcode = "/spaces/qrcode"
    
    
    
}
