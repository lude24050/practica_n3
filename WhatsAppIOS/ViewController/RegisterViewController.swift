//
//  RegisterViewController.swift
//  WhatsAppIOS
//
//  Created by MAC13 on 29/05/19.
//  Copyright © 2019 luis huarachi. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController ,UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    
    var imageElegida = UIImagePickerController()
    @IBOutlet weak var email_re: UITextField!
    @IBOutlet weak var pass_re: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    var usuario = ""
    var pass = ""
    var url_img = ""
    var url = " "
    var imagenID = NSUUID().uuidString
    
    
   
    
    @IBAction func Cancelar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func camaraTapped(_ sender: Any) {
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
    
    @IBAction func register(_ sender: Any) {
        Auth.auth().createUser(withEmail: email_re.text!, password: pass_re.text!, completion: {(user, error) in
            print("Intentadndo Crear usuario")
            if error != nil {
                self.performSegue(withIdentifier: "registrarsegue", sender: nil)
                print("Se presento el siguiente error al crear el usuario: \(error)")
            }else{
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
                        })
                    }
                }
            Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                    self.performSegue(withIdentifier: "registradosegue", sender: nil)
                print("El usuario fue creado exitosamente")
            }
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }
    
    override func viewDidLoad() {
        
        email_re.text = usuario
        pass_re.text = pass
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
