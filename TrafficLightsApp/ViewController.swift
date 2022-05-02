//
//  ViewController.swift
//  TrafficLightsApp
//
//  Created by Yaroslav on 02.05.2022.
//

import UIKit

enum ColorLight {
    case red
    case yellow
    case green
}

// MARK: - ViewController
class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak private var redColorView: UIView!
    @IBOutlet weak private var yellowColorView: UIView!
    @IBOutlet weak private var greenColorView: UIView!
    
    @IBOutlet weak private var startButton: UIButton!
    
    // MARK: - Properties
    private var currentColor = ColorLight.red
    private let lightOn: CGFloat = 1
    private let lightOff: CGFloat = 0.3
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        setupViewsFrame()
    }
}

// MARK: - Action
private extension ViewController {
    @IBAction func startAction() {
        startButton.setTitle("NEXT", for: .normal)
        switch currentColor {
        case .red:
            redColorView.alpha = lightOn
            greenColorView.alpha = lightOff
            currentColor = .yellow
        case .yellow:
            yellowColorView.alpha = lightOn
            redColorView.alpha = lightOff
            currentColor = .green
        case .green:
            greenColorView.alpha = lightOn
            yellowColorView.alpha = lightOff
            currentColor = .red
        }
    }
}

// MARK: - Private Extension
private extension ViewController {
    func setupUI() {
        setupButton()
        setupLight()
    }
    
    func setupViewsFrame() {
        redColorView.layer.cornerRadius = redColorView.frame.width / 2
        yellowColorView.layer.cornerRadius = yellowColorView.frame.width / 2
        greenColorView.layer.cornerRadius = greenColorView.frame.width / 2
    }
    
    func setupButton() {
        startButton.setTitle("START", for: .normal)
        startButton.layer.cornerRadius = 10
        startButton.titleLabel?.textColor = .white
        startButton.backgroundColor = .blue
    }
    
    func setupLight() {
        redColorView.alpha = lightOff
        yellowColorView.alpha = lightOff
        greenColorView.alpha = lightOff
    }
}

