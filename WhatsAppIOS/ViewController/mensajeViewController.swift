//
//  mensajeViewController.swift
//  WhatsAppIOS
//
//  Created by MAC13 on 30/05/19.
//  Copyright © 2019 luis huarachi. All rights reserved.
//

import UIKit

class mensajeViewController: UIViewController {

    @IBOutlet weak var mensaje: UILabel!
    @IBOutlet weak var fecha: UILabel!
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mensaje.text = snap.mensaje
        fecha.text = "Fecha y hora de envio :" + snap.fecha
        
        // Do any additional setup after loading the view.
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
