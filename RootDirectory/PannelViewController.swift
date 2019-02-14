//
//  PannelViewController.swift
//  RootDirectory
//
//  Created by Ryan on 8/3/16.
//  Copyright © 2016 Ryan. All rights reserved.
//

import UIKit
import RYUtils

class PannelViewController: UIViewController {
    
    private func showPicker(_ pickerView: UIView){
        var viewRect = pickerView.frame
        viewRect.size.width = UIScreen.main.bounds.size.width
        pickerView.frame = viewRect
        let position = CGPoint(x: 0, y: UIScreen.main.bounds.size.height - viewRect.size.height)
        pickerView.addAnimation(withType: CATransitionType.moveIn.rawValue, subtype: CATransitionSubtype.fromTop.rawValue)
        
        RYRootBlurViewManager.sharedManger()?.show(withBlurImage: nil, contentView: pickerView, position: position, adaptKeyboard: false, touchHide: true)
    }
    
    //Internal methods
    @IBAction func dateBtnClick(){
        let dateView = Bundle.main.loadNibNamed("RYDatePickerView", owner: self, options: nil)?.first as! RYDatePickerView
        dateView.cancelBlock = {
            RYRootBlurViewManager.sharedManger()?.hideBlurView()
        }
        dateView.confirmBlock = {
            RYHUDManager.shared()?.show(withMessage: $0.description, customView: nil, hideDelay: 2.0)
            RYRootBlurViewManager.sharedManger()?.hideBlurView()
        }
        self.showPicker(dateView)
    }
    
    @IBAction func textBtnClick(){
        let textView = Bundle.main.loadNibNamed("RYTextPickerView", owner: self, options: nil)?.first as! RYTextPickerView
        textView.reload(texts: ["first item", "second item", "third item"], defaultIndex: 1)
        textView.cancelBlock = {
            RYRootBlurViewManager.sharedManger()?.hideBlurView()
        }
        textView.confirmBlock = {
            RYHUDManager.shared()?.show(withMessage: $0.description, customView: nil, hideDelay: 2.0)
            RYRootBlurViewManager.sharedManger()?.hideBlurView()
        }
        self.showPicker(textView)
    }
    
    //MARK: UIViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


