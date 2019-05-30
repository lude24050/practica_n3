//
//  LogeadoViewController.swift
//  WhatsAppIOS
//
//  Created by MAC13 on 29/05/19.
//  Copyright © 2019 luis huarachi. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase

class LogeadoViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    var select = ""
    var snaps:[Snap] = []
    
    
    @IBAction func CerrarSesion(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var tablaSnaps: UITableView!
    @IBOutlet weak var imgPerfil: UIImageView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tablaSnaps.delegate = self
        tablaSnaps.dataSource = self
        Database.database().reference().child("usuarios").child((Auth.auth().currentUser?.uid)!).child("imagenes")
            .observe(DataEventType.childAdded, with: {(snapshot) in
                let snap = Snap()
                snap.fecha = (snapshot.value as! NSDictionary)["fecha"] as! String
                snap.from = (snapshot.value as! NSDictionary)["from"] as! String
                snap.mensaje = (snapshot.value as! NSDictionary)["mensaje"] as! String
                snap.imagenURL = (snapshot.value as! NSDictionary)["imagenURL"] as! String
                snap.id = snapshot.key
                self.snaps.append(snap)
                self.tablaSnaps.reloadData()
            })
    }
    @IBAction func EnvMensaje(_ sender: Any) {
        select = "mensaje_go"
        self.performSegue(withIdentifier: "elegirContactoSegue", sender: select)
    }
    
    @IBAction func enviar_img(_ sender: Any) {
        select = "imagen_go"
        self.performSegue(withIdentifier: "elegirContactoSegue", sender: select)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "elegirContactoSegue"{
            let select =  segue.destination as! ElegirContactoViewController
            select.select = sender as! String
        }
        
        if segue.identifier == "versnapsegue"{
            let mostrarsms = segue.destination as! mensajeViewController
            mostrarsms.snap = sender as! Snap
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snaps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let snap = snaps[indexPath.row]
        cell.textLabel?.text = snap.from
        cell.imageView?.sd_setImage(with: URL(string: snap.imagenURL), completed: nil)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let snap = snaps[indexPath.row]
        performSegue(withIdentifier: "versnapsegue", sender: snap)
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
