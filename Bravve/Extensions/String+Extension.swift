//
//  String+Extension.swift
//  Bravve
//
//  Created by Josicleison on 16/08/22.
//

import Foundation

extension String {
    
/// A variable that returns whether it is a CPF or not
    var isCPF: Bool {
        
        let numbers = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard numbers.count == 11 else { return false }

        let set = NSCountedSet(array: Array(numbers))
        guard set.count != 1 else { return false }

        let i1 = numbers.index(numbers.startIndex, offsetBy: 9)
        let i2 = numbers.index(numbers.startIndex, offsetBy: 10)
        let i3 = numbers.index(numbers.startIndex, offsetBy: 11)
        let d1 = Int(numbers[i1..<i2])
        let d2 = Int(numbers[i2..<i3])

        var temp1 = 0, temp2 = 0

        for i in 0...8 {
            
            let start = numbers.index(numbers.startIndex, offsetBy: i)
            let end = numbers.index(numbers.startIndex, offsetBy: i+1)
            let char = Int(numbers[start..<end])

            temp1 += char! * (10 - i)
            temp2 += char! * (11 - i)
        }

        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1

        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2

        return temp1 == d1 && temp2 == d2
    }
    
    func formatMask(mask: String) -> String {
        
        let cleanField = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        var result = ""
        var startIndex = cleanField.startIndex
        let endIndex = cleanField.endIndex
        
        for ch in mask where startIndex < endIndex {
            if ch == "#" {
                result.append(cleanField[startIndex])
                startIndex = cleanField.index(after: startIndex)
            } else {
                result.append(ch)
            }
        }
        
        return result
    }
    
    func clearFormatMask() -> String{
        
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
}
