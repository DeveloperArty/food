//
//  TodayViewController.swift
//  TopProject
//
//  Created by Artem Pavlov on 03.03.2018.
//  Copyright © 2018 Artem Pavlov. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {
    
    
    @IBOutlet weak var calendar: CalendarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.calendar.configure()
    }
    
}
