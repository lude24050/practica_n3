//
//  ElegirContactoViewController.swift
//  WhatsAppIOS
//
//  Created by luis huarachi on 5/30/19.
//  Copyright © 2019 luis huarachi. All rights reserved.
//

import UIKit
import Firebase

class ElegirContactoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var usuarios:[Usuario] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usuarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let usuario = usuarios[indexPath.row]
        cell.textLabel?.text = usuario.email
        return cell
    }
    
    @IBOutlet weak var listausuarios: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listausuarios.delegate = self
        listausuarios.dataSource = self
        Database.database().reference().child("usuarios").observe(DataEventType.childAdded, with: {(snapshot) in
            print(snapshot)
        })
        
        
        
        let usuario = Usuario()
        usuario.email = (snapshot.)
        
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
