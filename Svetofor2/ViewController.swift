//
//  ViewController.swift
//  Svetofor2
//
//  Created by Евгения Максимова on 01.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    @IBOutlet weak var startButtonView: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enum lights {
            case red
            case yellow
            case green
        }
        var currentLight = lights.red
        
        switch currentLight {
        case .red:
            redLightView.alpha = 1
        case .yellow:
            yellowLightView.alpha = 1
        case .green:
            greenLightView.alpha = 1
        }
        
        
        redLightView.layer.cornerRadius = redLightView.frame.size.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.size.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.size.width / 2
        startButtonView.layer.cornerRadius = 10
        
        redLightView.alpha = 0.3
        yellowLightView.alpha = 0.3
        greenLightView.alpha = 0.3
        
        startButtonView.setTitle("Start", for: .normal)
        
    }
    
    @IBAction func changeTheColor() {
        startButtonView.setTitle("Next", for: .normal)

    }
    
    
    
}
