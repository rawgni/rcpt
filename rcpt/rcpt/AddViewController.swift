//
//  AddViewController.swift
//  rcpt
//
//  Created by Efendy Tanamal on 4/29/16.
//  Copyright © 2016 gts. All rights reserved.
//


import UIKit
import Eureka
import CoreLocation

typealias Emoji = String
let 💰 = "💰", 📄 = "📄", 📦 = "📦"


class NativeEventNavigationController: UINavigationController, RowControllerType{
    var completionCallback: ((UIViewController) -> ())?
}

class NativeEventFormViewController : FormViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    var location: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        //}

        initializeForm()
        
        self.navigationItem.leftBarButtonItem?.target = self
        self.navigationItem.leftBarButtonItem?.action = #selector(NativeEventFormViewController.cancelTapped(_:))
        
    }
    
    
    private func initializeForm() {
        
        form = Section()
            
                <<< DateRow() {
                    $0.title = "Date"
                    $0.value = NSDate()
                }
        
                <<< NameRow() {
                    $0.title = "From"
                    $0.placeholder = "Recepient's name"
                }
            
                <<< AlertRow<String>("category") {
                    $0.title = "Category"
                    $0.selectorTitle = "What do you give?"
                    $0.options = ["Money", "Goods", "Documents"]
                    $0.value = "Money"
                }
            
                <<< DecimalRow() {
                    $0.tag = "money"
                    $0.title = "Amount"
                    //$0.hidden = "$segments = 'Goods' || $segments ='Documents'"
                    $0.useFormatterDuringInput = true
                    $0.placeholder = "Enter the amount"
                    let formatter = CurrencyFormatter()
                    formatter.locale = .currentLocale()
                    formatter.numberStyle = .CurrencyStyle
                    $0.formatter = formatter
                    
                    $0.hidden = Condition.Function(["category"]) { form in
                        if let r1 : AlertRow<String> = form.rowByTag("category") {
                            return r1.value != "Money"
                        }
                        return false
                    }
                }
            
                <<< TextRow() {
                    $0.tag = "goods"
                    $0.title = "What is it?"
                    $0.hidden = Condition.Function(["category"]) { form in
                        if let r1 : AlertRow<String> = form.rowByTag("category") {
                            return r1.value == "Money"
                        }
                        return false
                    }
                }
            
                <<< TextRow() {
                    $0.title = "Notes"
                    $0.placeholder = "Transaction Reasons"
                }
            
                <<< ImageRow() {
                    $0.title = "Photo"
                }
            
                <<< LocationRow("location") {
                    $0.title = "Location"
                }
            
            <<< TextAreaRow("address") {
                $0.title = "Address"
                $0.disabled = true

            }
            
            
            +++ Section()


            +++ Section()

            <<< LocationRow() {
                $0.title = "Location"
                $0.value = CLLocation(latitude: -34.91, longitude: -56.1646)
            }
//                .onPresent { from, to in
//                    to.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: from, action: #selector(AddViewController.multipleSelectorDone(_:)))
//            }
        
            <<< ImageRow() {
                $0.title = "Photo"
            }
        
        func multipleSelectorDone(item:UIBarButtonItem) {
            navigationController?.popViewControllerAnimated(true)
        }
 
    }
    
    func cancelTapped(barButtonItem: UIBarButtonItem) {
        (navigationController as? NativeEventNavigationController)?.completionCallback?(self)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        
        self.form.rowByTag("location")!.baseValue = location
        
        //var geocoder = CLGeocoder()
        //var locationCLLocation = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler:
            {(placemarks, error) in
                if (error != nil) {print("reverse geodcode fail: \(error!.localizedDescription)")}
                if placemarks!.count > 0 {
                    let pm = placemarks![0] as CLPlacemark
                    let addrlist =  pm.addressDictionary?["FormattedAddressLines"] as? [String]
                    self.form.rowByTag("address")!.baseValue = addrlist?.joinWithSeparator(", ")
                    self.form.rowByTag("address")?.updateCell()
                }
                
        })
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("\(error)")
    }
    
}
    


class CurrencyFormatter : NSNumberFormatter, FormatterProtocol {
    override func getObjectValue(obj: AutoreleasingUnsafeMutablePointer<AnyObject?>, forString string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>) -> Bool {
        guard obj != nil else { return false }
        let str = string.componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet).joinWithSeparator("")
        obj.memory = NSNumber(double: (Double(str) ?? 0.0)/Double(pow(10.0, Double(minimumFractionDigits))))
        return true
    }
        
    func getNewPosition(forPosition position: UITextPosition, inTextInput textInput: UITextInput, oldValue: String?, newValue: String?) -> UITextPosition {
        return textInput.positionFromPosition(position, offset:((newValue?.characters.count ?? 0) - (oldValue?.characters.count ?? 0))) ?? position
    }
}