//
//  ViewController.swift
//  WhatsAppIOS
//
//  Created by MAC13 on 29/05/19.
//  Copyright © 2019 luis huarachi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class iniciarSesionViewcontroller: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var iniciarsesion: UIButton!
    
    @IBAction func iniciarsesion(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) {(user, error) in
            print("Intentando iniciar sesion")
            if error != nil{
                print("Se presento el siguiente erro:\(error)")
//                self.mostrarAlerta(titulo: "Error", mensaje: "Su cuentea no esta registrada, porfavor registrese"
//                    + "primero", accion: "Aceptar")
                self.performSegue(withIdentifier: "registrarsegue", sender: nil)
            }else{
                print("inicio de sesion exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func mostrarAlerta(titulo: String, mensaje: String, accion :String){
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let btnCANCELOK = UIAlertAction(title: accion, style: .default, handler: nil)
        alerta.addAction(btnCANCELOK)
        present(alerta, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registrarsegue"{
            let viewRe =  segue.destination as! RegisterViewController
            viewRe.usuario = email.text!
            viewRe.pass = password.text!
        }
    }
}

