//
//  ViewController.swift
//  Senhas
//
//  Created by user201545 on 7/27/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTotalPassword: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swLetters: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // Passar Informação de uma viewController para outra
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //ViewController será a referencia para a proxima viewController
        // segue.destination informa qual a viewController de destino do segue
        let passwordsViewController = segue.destination as! PasswordViewController
        
        if let numberOfPasswords = Int(tfTotalPassword.text!){
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        if let numberOfCharacters = Int(tfNumberOfCharacters.text!){
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCapitalLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
        // Encerramento do modo de edição, sumir o teclado
        view.endEditing(true)
    }

}

