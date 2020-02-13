//
//  SettingsViewController.swift
//  NYT-Books-GroupProj
//
//  Created by Christian Hurtado on 2/5/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit
import DataPersistence

class SettingsViewController: UIViewController {
    
    public var dataPersistence: DataPersistence<Books>!
    
    var genres: [String]?
    
    private let settingsView = SettingsView()
    
    override func loadView() {
        view = settingsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        settingsView.pickerView.dataSource = self
        settingsView.pickerView.delegate = self
    }

}

extension SettingsViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    
}

extension SettingsViewController: UIPickerViewDelegate {
    
}
