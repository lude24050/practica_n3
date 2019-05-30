//
//  envioMensajeViewController.swift
//  WhatsAppIOS
//
//  Created by MAC13 on 30/05/19.
//  Copyright © 2019 luis huarachi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class envioMensajeViewController: UIViewController {
    var id_usu = ""
    let fecha = Date()
    
    @IBOutlet weak var Mensaje: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func enviarMensaje(_ sender: Any) {
        let fec = (String(describing: fecha))
        
        let snap = ["fecha":fec,"from": Auth.auth().currentUser?.email, "mensaje": Mensaje.text!]
  Database.database().reference().child("usuarios").child(id_usu).child("mensajes")
     .childByAutoId().setValue(snap)
    navigationController?.popViewController(animated: true)
        
  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
