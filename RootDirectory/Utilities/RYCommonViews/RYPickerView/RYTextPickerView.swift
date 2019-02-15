//
//  RYTextPickerView.swift
//  RootDirectory
//
//  Created by Ryan on 03/01/2017.
//  Copyright © 2017 Ryan. All rights reserved.
//

import UIKit

public class RYTextPickerView: UIView{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textPicker: UIPickerView!
    var textArray = [String]()
    
    public var cancelBlock: (()->Void)?
    public var confirmBlock: ((String)->Void)?
    
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
    public func reload(texts: [String], defaultIndex: Int){
        self.textArray = texts
        self.textPicker.reloadAllComponents()
        self.textPicker.selectRow(defaultIndex, inComponent: 0, animated: false)
    }
}

//MARK: UIPickerView methods
extension RYTextPickerView: UIPickerViewDataSource, UIPickerViewDelegate{

    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return self.textArray.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return self.textArray[row]
    }
}
