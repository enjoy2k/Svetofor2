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
    
    enum Lights {
        case red
        case yellow
        case green
        case off
    }
    var currentLight = Lights.red
    var lightAlphaValues: [Lights: CGFloat] = [
            .red: 0.3,
            .yellow: 0.3,
            .green: 0.3,
            .off: 0.3
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func setupLightViews() {
                let lightViews = [redLightView, yellowLightView, greenLightView]
                let cornerRadius = redLightView.frame.size.width / 2
                lightViews.forEach { $0?.layer.cornerRadius = cornerRadius }
                lightViews.forEach { $0?.alpha = lightAlphaValues[.off] ?? 0}
            }
        setupLightViews()
        
        startButtonView.layer.cornerRadius = 10
    }
    
    @IBAction func changeTheColor() {
        UIView.animate(withDuration: 0.3) {
            switch self.currentLight {
            case .red:
                self.redLightView.alpha = 1
                self.startButtonView.setTitle("Next", for: .normal)
                self.currentLight = .yellow
            case .yellow:
                self.redLightView.alpha = 0.3
                self.yellowLightView.alpha = 1
                self.currentLight = .green
            case .green:
                self.yellowLightView.alpha = 0.3
                self.greenLightView.alpha = 1
                self.currentLight = .off
                self.startButtonView.setTitle("Finish", for: .normal)
            case .off:
                self.greenLightView.alpha = 0.3
                self.startButtonView.setTitle("Start", for: .normal)
                self.currentLight = .red
            }
        }
    }
}
