//
//  ShoppingListViewController.swift
//  TopProject
//
//  Created by Artem Pavlov on 03.03.2018.
//  Copyright © 2018 Artem Pavlov. All rights reserved.
//

import UIKit

class ShoppingListViewController: UIViewController {
    
    let data = [("Курица", "300 г."),
                ("Яйца", "100 шт."),
                ("Чеснок", "300 г."),
                ("Кумкваты", "300 г."),
                ("Багет французский", "300 г."),
                ("Сок яблочный", "1 л."),
                ("Майонез", "1 кг."),
                ("Помидоры", "400 г."),
                ("Огурцы", "300 г."),
                ("Лонганы", "500 г.")]

    var showMsg: Bool {
        return tableView.indexPathsForSelectedRows?.count == data.count
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "ПОКУПКИ"
        
        tableView.delegate = self
        tableView.dataSource = self 
    }
}

extension ShoppingListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ShoppingTableViewCell {
            cell.selectedFlag = !cell.selectedFlag
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ShoppingTableViewCell {
            cell.selectedFlag = !cell.selectedFlag
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "header_cell", for: indexPath)
        } else if indexPath.row == data.count + 1 {
            if showMsg {
                cell = tableView.dequeueReusableCell(withIdentifier: "msg_cell", for: indexPath)
            } else {
                cell = UITableViewCell()
            }
        } else {
            let _cell = tableView.dequeueReusableCell(withIdentifier: "shopping_cell", for: indexPath) as! ShoppingTableViewCell
            _cell.configure(data[indexPath.row - 1])
            cell = _cell
        }
        cell.selectionStyle = .none
        return cell
    }
}
