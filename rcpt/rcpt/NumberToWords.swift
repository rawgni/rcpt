//
//  NumberToWords.swift
//  rcpt
//
//  Created by Efendy Tanamal on 3/24/16.
//  Copyright © 2016 gts. All rights reserved.
//

import Foundation


// Single-digit and small number names
var _smallNumbers = [String]()

// Tens number names from twenty upwards
var _tens = [String]()

// Scale number names for use during recombination
var _scaleNumbers = [String]()

// To hold hundred in word for each language
var hundredInWord = ""
var andInWord = ""
var commaInWord = ""

// Algorithm from  http://www.blackwasp.co.uk/NumberToWords_1.aspx
// language id from http://www.lingoes.net/en/translator/langcode.htm
func NumberToWords(number: Int, language: String) -> String {
    
    switch language {
        
    // For Indonesian language
    case "id":
        
        _smallNumbers =
            ["Nol", "Satu", "Dua", "Tiga", "Empat", "Lima", "Enam", "Tujuh", "Delapan", "Sembilan",
             "Sepuluh", "Sebelas", "Dua Belas", "Tiga Belas", "Empat Belas", "Lima Belas", "Enam Belas", "Tujuh Belas",
             "Delapan Belas", "Sembilan Belas"]
        
        
        _tens =
            ["", "", "Dua Puluh", "Tiga Puluh", "Empat Puluh", "Lima Puluh", "Enam Puluh", "Tujuh Puluh",
             "Delapan Puluh", "Sembilan Puluh"]
        
        _scaleNumbers = ["", "Ribu", "Juta", "Milyar", "Triliun"]
        
        hundredInWord = " Ratus"
        andInWord = " "
        commaInWord = " "
        
        
    // For any other languages including English
    default :
        _smallNumbers =
            ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
             "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen",
             "Eighteen", "Nineteen"]
        
        _tens =
            ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
        
        _scaleNumbers = ["", "Thousand", "Million", "Billion", "Trillion"]
        
        hundredInWord = " Hundred"
        andInWord = " "
        commaInWord = " "
    }
    
    
    
    
    // Zero rule
    if number == 0 {
        return _smallNumbers[0]
    }
    
    // Array to hold four three-digit groups
    var digitGroups = [Int]()
    
    // Ensure a positive number to extract from
    var positive = abs(number)
    
    // Extract the three-digit groups
    for _ in 0...4 {
        digitGroups.append(positive % 1000)
        positive = positive / 1000
    }
    
    // Convert each three-digit group to words
    var groupText: [String] = ["", "", "", "", ""]
    
    for i in 0...4 {
        groupText[i] = ThreeDigitGroupToWords(digitGroups[i])
    }
    
    
    // Recombine the three-digit groups
    var combined: String = groupText[0]
    var appendAnd: Bool
    
    // Determine whether an 'and' is needed
    appendAnd = (digitGroups[0] > 0) && (digitGroups[0] < 100);
    
    // Process the remaining groups in turn, smallest to largest
    for i in 1...4 {
        // Only add non-zero items
        if (digitGroups[i] != 0) {
            // Build the string to add as a prefix
            var prefix: String = groupText[i] + " " + _scaleNumbers[i];
            
            if (combined.characters.count != 0) {
                prefix += appendAnd ? andInWord : commaInWord;
            }
            
            // Opportunity to add 'and' is ended
            appendAnd = false;
            
            // Add the three-digit group to the combined string
            combined = prefix + combined;
        }
    }
    
    // Negative rule
    if (number < 0) {
        combined = "Negative " + combined
    }
    
    // Indonesian specific cleanup rules...
    if language == "id" {
        combined = combined.stringByReplacingOccurrencesOfString("Satu Ratus", withString: "Seratus")
        
        if (number < 2000) {
            combined = combined.stringByReplacingOccurrencesOfString("Satu Ribu", withString: "Seribu")
        }
    }
    
    
    return combined
}


// Converts a three-digit group into words
private func ThreeDigitGroupToWords(threeDigits: Int) -> String {
    
    // Initialise the return text
    var groupText: String = ""
    
    // Determine the hundreds and the remainder
    let hundreds: Int = threeDigits / 100;
    let tensUnits: Int = threeDigits % 100;
    
    // Hundreds rules
    if (hundreds != 0) {
        groupText += _smallNumbers[hundreds] + hundredInWord
        
        if (tensUnits != 0) {
            groupText += andInWord;
        }
    }
    
    // Determine the tens and units
    let tens: Int = tensUnits / 10
    let units: Int = tensUnits % 10
    
    // Tens rules
    if (tens >= 2) {
        groupText += _tens[tens];
        if (units != 0) {
            groupText += " " + _smallNumbers[units];
        }
    } else if (tensUnits != 0) {
        groupText += _smallNumbers[tensUnits]
    }
    
    return groupText
}



NumberToWords(111111111, language: "id")
NumberToWords(111111111, language: "en")

print(Int.max)
print(UInt.max)

