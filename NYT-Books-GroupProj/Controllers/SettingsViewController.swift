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
    
    public var dataPersistence: DataPersistence<BookInfo>!
        
    private let settingsView = SettingsView()
    
    var genres = [String]() {
        didSet{
            DispatchQueue.main.async{
                self.settingsView.pickerView.reloadAllComponents()
            }
        }
    }
    
    override func loadView() {
        view = settingsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGenres()
        view.backgroundColor = .white
        settingsView.pickerView.dataSource = self
        settingsView.pickerView.delegate = self
    }
    
    private func fetchGenres(){
        NYTBooksAPIClient.fetchGenres { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("could not get genres because : \(appError)")
            case .success(let loadedGenres):
                self?.genres = loadedGenres.map { $0.displayName }
                dump(self?.genres)
        }
    }
    }

}

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count 
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let sectionName = genres[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return genres[row]
    }
}
