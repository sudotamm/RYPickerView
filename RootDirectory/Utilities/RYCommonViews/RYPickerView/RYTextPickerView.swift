//
//  RYTextPickerView.swift
//  RootDirectory
//
//  Created by Ryan on 03/01/2017.
//  Copyright © 2017 Ryan. All rights reserved.
//

import UIKit

class RYTextPickerView: UIView{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textPicker: UIPickerView!
    var textArray = [String]()
    
    var cancelBlock: (()->Void)?
    var confirmBlock: ((String)->Void)?
    
    @IBAction func pickerCancel(btn: UIButton){
        self.cancelBlock?()
    }
    
    @IBAction func pickerConfirm(btn: UIButton){
        let row = self.textPicker.selectedRow(inComponent: 0)
        let textValue = self.textArray[row]
        self.confirmBlock?(textValue)
    }
}

extension RYTextPickerView{
    func reload(texts: [String], defaultIndex: Int){
        self.textArray = texts
        self.textPicker.reloadAllComponents()
        self.textPicker.selectRow(defaultIndex, inComponent: 0, animated: false)
    }
}

//MARK: UIPickerView methods
extension RYTextPickerView: UIPickerViewDataSource, UIPickerViewDelegate{

    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return self.textArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return self.textArray[row]
    }
}
