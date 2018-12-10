//
//  CondicionesTableViewController.swift
//  MiDoc2
//
//  Created by leon on 12/8/18.
//  Copyright © 2018 leon. All rights reserved.
//

import UIKit
import CoreData
class CondicionesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var condicionTable: UITableView!
    var arrayCondiciones : [CondicionUsuario] = obtenerCondiciones()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        condicionTable.delegate = self
        condicionTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCondiciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cond : CondicionUsuario = arrayCondiciones[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = cond.nombre
        cell.detailTextLabel?.text = cond.detalle
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let cond = arrayCondiciones[indexPath.row]
            eliminarCondicion(cond: cond)
            arrayCondiciones.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


}
