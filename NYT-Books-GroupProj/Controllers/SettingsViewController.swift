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
    
    var genres = [String]()
        
    private let settingsView = SettingsView()
    
    override func loadView() {
        view = settingsView
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

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGenres()
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
        return genres.count 
    }
    
    
}

extension SettingsViewController: UIPickerViewDelegate {
    
}
