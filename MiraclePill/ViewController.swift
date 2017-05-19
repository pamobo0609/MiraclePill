//
//  ViewController.swift
//  MiraclePill
//
//  Created by Liquid Workforce on 5/16/17.
//  Copyright © 2017 Liquid Workforce. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // Components to hide
    @IBOutlet weak var imgvEmoji: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var divider: UIView!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblStreetAdd: UILabel!
    
    @IBOutlet weak var lblCity: UILabel!
    
    @IBOutlet weak var lblState: UILabel!
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtCity: UITextField!
    
    @IBOutlet weak var imgvSuccess: UIImageView!
    
    // Components needed to perform actions
    @IBOutlet weak var btnStatePicker: UIButton!
    
    @IBOutlet weak var statePicker: UIPickerView!
    
    @IBOutlet weak var btnBuyNow: UIButton!
    
    let states = ["Alaska", "Arkansas", "Alabama", "New York", "California", "Vermont", "Hawai"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // changing the background color
        // self.view.backgroundColor = UIColor.purple
        
        // we're telling the picker that this view controller will have the data for it to function.
        self.statePicker.dataSource = self
        // now we're telling Xcode that if something happens with the picker, here's the actions for it.
        self.statePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // we leave 1 since we're selecting one at a time
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // the size of the array is the number of states we'll have
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // this adapter will enter the datasource(the array in this case) for an index, and set every title
        return states[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // this method will handle the selection in the picker view
        if nil != btnStatePicker {
            btnStatePicker.setTitle(states[row], for: UIControlState.normal)
            statePicker.isHidden = true
            btnBuyNow.isHidden = false
        }
    }
    
    @IBAction func stateBtnPressed(_ sender: Any) {
        if nil != statePicker {
            statePicker.isHidden = false
        }
    }
    
    @IBAction func buyNowBtnPressed(_ sender: Any) {
        imgvEmoji.isHidden = true
        lblTitle.isHidden = true
        lblName.isHidden = true
        lblCity.isHidden = true
        lblStreetAdd.isHidden = true
        lblState.isHidden = true
        divider.isHidden = true
        price.isHidden = true
        txtCity.isHidden = true
        txtName.isHidden = true
        txtAddress.isHidden = true
        btnStatePicker.isHidden = true
        
        if statePicker.isHidden {
            statePicker.isHidden = true
        }
        
        btnBuyNow.isHidden = true
        // We "make" the purchase
        imgvSuccess.isHidden = false
    }

}

