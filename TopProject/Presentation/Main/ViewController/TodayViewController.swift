//
//  TodayViewController.swift
//  TopProject
//
//  Created by Artem Pavlov on 03.03.2018.
//  Copyright © 2018 Artem Pavlov. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = [(UIImage(named: "chicken")!, "Куриная грудка в медовом соусе с рисом", 27, Сomplexity.Hard),
                (UIImage(named: "lapsha")!, "Корейская лапша с цуккини говядиной", 20, Сomplexity.OK),
                (UIImage(named: "spa")!, "Спагетти четыре сыра", 15, Сomplexity.Easy),
                (UIImage(named: "kesa")!, "Сырная кесадилья с соусом глукамоле", 30, Сomplexity.Hard),
                (UIImage(named: "eggs")!, "Яишенка с тентаклями из сосисок", 10, Сomplexity.Easy)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.backgroundColor = UIColor.white
    }
}

extension TodayViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toMeal", sender: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count + 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.frame = CGRect(x: cell.frame.minX, y: cell.frame.minY, width: self.view.frame.width, height: 216)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if indexPath.row == 0 {
            return tableView.dequeueReusableCell(withIdentifier: "header_cell", for: indexPath)
        } else {
            let _cell = tableView.dequeueReusableCell(withIdentifier: "image_cell", for: indexPath) as! ImageTableViewCell
            _cell.configure(data[indexPath.row - 1])
            cell = _cell
        }
        cell.frame = CGRect(x: cell.frame.minX, y: cell.frame.minY, width: self.view.frame.width, height: 216)
        cell.selectionStyle = .none
        return cell
    }
}

