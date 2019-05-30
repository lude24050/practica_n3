//
//  envioImagenViewController.swift
//  WhatsAppIOS
//
//  Created by MAC13 on 30/05/19.
//  Copyright © 2019 luis huarachi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class envioImagenViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    var id_usu = ""
    var fecha = Date()
    var imagenID = NSUUID().uuidString
    var url_imagen = ""
    
    @IBOutlet weak var mensaje: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageElegida = UIImagePickerController()
    @IBAction func cargarImagen(_ sender: Any) {
        imageElegida.sourceType = .savedPhotosAlbum
        imageElegida.allowsEditing = false
        present(imageElegida, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        imageElegida.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func enviarImagen(_ sender: Any) {
        let imagenesFolder = Storage.storage().reference().child("imagenes")
        let imagenData = self.imageView.image?.jpegData(compressionQuality: 0.50)
        let cargarImagen = imagenesFolder.child("\(self.imagenID).jpg")
        cargarImagen.putData(imagenData!,metadata: nil) {(metadata, error) in
            if error != nil {
                print("Ocurrio un error al subir imagen: \(error)")
                return
            }else{
                cargarImagen.downloadURL(completion: {(url, error) in
                    guard let enlaceURL = url
                        else{
                            print("ocurrio al obtener informacion")
                            return
                    }
                    self.env_ima(url: (url?.absoluteString)!)
                   
                })
               
            }
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    func env_ima(url:String){
        print("aqui esta la url de mi imagen: \(url)")
        
        let fec = (String(describing: self.fecha))
                            let snap = ["from": Auth.auth().currentUser?.email
                                ,"mensaje": self.mensaje.text!,"fecha":fec,"imagenURL:":url]
                            Database.database().reference().child("usuarios").child(id_usu).child("imagenes")
                                .childByAutoId().setValue(snap)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        imageElegida.delegate = self
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
