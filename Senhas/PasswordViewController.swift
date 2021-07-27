//
//  PasswordViewController.swift
//  Senhas
//
//  Created by user201545 on 7/27/21.
//

import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var tvPasswords: UITextView!
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Total de senhas: \(numberOfPasswords)"
        passwordGenerator = PasswordGenerator(
            numberOfCharacters: numberOfCharacters,
            numberOfPasswords: numberOfPasswords,
            useLetters: useLetters,
            useCapitalLetters:useCapitalLetters,
            useSpecialCharacters:useSpecialCharacters,
            useNumbers: useNumbers)
        generatePasswords ()
    }
    
    func generatePasswords (){
        tvPasswords.text = ""
        // Jogando o textView para o topo caso, o usuário clique em "Gerar nova senha"
        tvPasswords.scrollRangeToVisible(_NSRange(location: 0, length: 0))
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
            print(password)
        }
    }

    

    @IBAction func generate(_ sender: Any) {
        generatePasswords()
    }
}
