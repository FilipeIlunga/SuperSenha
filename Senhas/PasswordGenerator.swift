//
//  PasswordGenerator.swift
//  Senhas
//
//  Created by user201545 on 7/27/21.
//

import Foundation

class PasswordGenerator{
    var numberOfCharacters: Int
    var numberOfPasswords: Int
    var useLetters: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    var useNumbers: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvxwz"
    private let specialCharacters = "!@#$%¨&*()_-=+~´`[]}^:;><]["
    private let numbers = "0123456789"
    
    init(numberOfCharacters: Int, numberOfPasswords: Int,useLetters: Bool,useCapitalLetters: Bool,useSpecialCharacters: Bool,useNumbers: Bool) {
        var numchars = min(numberOfCharacters,16)
        numchars = max(1,numchars)
        self.numberOfCharacters = numchars
        self.numberOfPasswords = numberOfPasswords
        self.useLetters = useLetters
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
        self.useNumbers = useNumbers
    }
    
    func generate(total: Int) -> [String]{
        passwords.removeAll()

        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        if useSpecialCharacters {
            universe += specialCharacters
        }
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        if useNumbers {
            universe += numbers
        }
        let universeArray = Array(universe)
        
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacters{
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        
        return passwords
    }
    
}
