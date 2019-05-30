//
//  LogeadoViewController.swift
//  WhatsAppIOS
//
//  Created by MAC13 on 29/05/19.
//  Copyright © 2019 luis huarachi. All rights reserved.
//

import UIKit
import SDWebImage

class LogeadoViewController: UIViewController {
    var imagenID = ""
    
    @IBAction func CerrarSesion(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var imgPerfil: UIImageView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
  //imgPerfil.sd_setImage(with: URL(string: imagenID), completed: nil)
        
        // Do any additional setup after loading the view.
    }
    @IBAction func EnvMensaje(_ sender: Any) {
        print("es la url de img csmr logeado\(imagenID)")
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
