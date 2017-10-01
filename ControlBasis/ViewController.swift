//
//  ViewController.swift
//  ControlBasis
//
//  Created by Вячеслав Горлов on 22.09.17.
//  Copyright © 2017 Gorloff Foundation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var slider: UISlider!

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var switchControl: UISwitch!
    
    @IBOutlet weak var textField: UITextField!


    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        self.textField.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.percentLabel.text = "\(self.slider.value.rounded())%"
        self.amountLabel.text = "0$"
        self.button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Договор с Люцифером", message: "Вы хотите подписать договор на продажу собственной души?", preferredStyle: .actionSheet) //
        let action = UIAlertAction(title: "Подписать", style: .default) {(alertAction) in self.view.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.009946824187, alpha: 1)}
        let cancelAction = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancelAction)
        
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = sender.bounds
            popoverController.permittedArrowDirections = .down
        }

        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        self.button.isEnabled = sender.isOn
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        self.percentLabel.text = "\(sender.value.rounded())%"
        
    }
    @IBAction func textChanged(_ sender: UITextField) {
        if let summ = Double(sender.text!) {
            self.amountLabel.text = "\((summ * Double(pow(self.slider.value / 100 + 1, 10))).rounded())$"
        } else {
            self.amountLabel.text = "Не могу рассчитать долг"
        }
    }
    
    @IBAction func segmentedTapped(_ sender: UISegmentedControl) {
        self.switchControl.setOn((sender.selectedSegmentIndex == 0), animated: true)
        self.perform(#selector(switchChanged(_:)), with: self.switchControl)
    }

    
}

