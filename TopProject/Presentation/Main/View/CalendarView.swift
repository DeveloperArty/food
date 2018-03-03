//
//  CalendarView.swift
//  TopProject
//
//  Created by Artem Pavlov on 03.03.2018.
//  Copyright © 2018 Artem Pavlov. All rights reserved.
//

import UIKit

class CalendarView: UIView {
    
    @IBOutlet weak var stackView: UIStackView!

    func configure() {
        for day in 5...11 {
            let view = self.stackView.arrangedSubviews.first!.copyView() as! CalendarDayView
            view.configure(nameday: "Пт", day: day)
            
            stackView.addArrangedSubview(view.copyView())
        }
    }

}
