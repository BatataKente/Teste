//
//  HomeMapKitViewModel.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 08/09/22.
//

import Foundation
import CoreLocation
import MapKit

class HomeMapKitViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    //MARK: - Closures
    var alertAccessDenied: (() -> Void)?
    var alertRestricted: (() -> Void)?
    
    //MARK: - var and let
    private var userLocation: CLLocationManager?
    var userRegion: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -23.5888, longitude: -46.658890), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
    
    func setupUserRegion(latitude: Double?, longitude: Double?) {
        guard let userLatitude = latitude else {
            print("Unable to unwrap user latitude")
            return
        }
        guard let userLongitude = longitude else {
            print("Unable to unwrap user longitude")
            return
        }
        userRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLatitude, longitude: userLongitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
    
    //MARK: - checkLocation
    //This func is used to check if the user accepts to show his location
    ///
    func checkIfLocationIsEnabled(){
    
        if CLLocationManager.locationServicesEnabled(){
            userLocation = CLLocationManager()
            userLocation!.delegate = self
    
        }else{
            
            print("This app needs the permition to show you location, please accept")
            
        }
    }
    
    //MARK: - setUserRegion
    //This func is used to center the user location on the map
    ///
    func setUserRegion(map: MKMapView){
        
        switch userLocation?.authorizationStatus{
            
        case .authorizedWhenInUse , .authorizedAlways:
        guard let locationManager = userLocation else {return}
        
        userRegion = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                            span: MKCoordinateSpan(latitudeDelta: 0.05,
                                                                   longitudeDelta: 0.05))
            map.setRegion(userRegion, animated: true)
            
        default:
            break;
        }
        
    }
    
    //MARK: - checkLocationAuthStatus
    //This func is used to determined authorization status of the app and return an answer
    ///
    private func checkAuthorizationStatus(){
        guard let locationManager = userLocation else {return}
        
        
        switch locationManager.authorizationStatus{
            
        case .notDetermined:
            
            locationManager.requestWhenInUseAuthorization()
            
        case .restricted:
            
            print("Restricted")
            alertRestricted!()
            
        case .denied:
            
            print("Denied")
            alertAccessDenied!()
           
        
        case .authorizedAlways, .authorizedWhenInUse:
                                  
            userRegion = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                                span: MKCoordinateSpan(latitudeDelta: 0.05,
                                                                       longitudeDelta: 0.05))
            
            print("Authorized")
            
        default:
            
            break;
            
            
        }
        
    }
    
    //MARK: - func locationManAuth
    //This func check everytime when the apps run the authorization status
    ///
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthorizationStatus()
    }
    
}
