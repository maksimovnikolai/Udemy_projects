//
//  EggViewController.swift
//  EggTimerApp
//
//  Created by Nikolai Maksimov on 12.02.2024.
//

import UIKit
import AVFoundation

final class EggViewController: UIViewController {
    
    // MARK: Private Properties
    private lazy var titleLabel = makeLabel()
    private lazy var mainStackView: UIStackView = .makeStackView(
        axis: .vertical,
        distribution: .fillEqually,
        spacing: 20
    )
    
    private var progressView: UIProgressView!
    private var player: AVAudioPlayer!
    private lazy var timer = Timer()
    private var totalTime = 0
    private var secondsPassed = 0
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        setupMainStackViewConstraints()
        configureMainStacks()
    }
}

//MARK: - Logic
extension EggViewController {
    
    @objc
    private func buttonDidTap(_ sender: UIButton) {
        
        guard let currentTitle = sender.configuration?.title else { return }
        
        switch currentTitle {
        case EggInfo.soft.rawValue:
            totalTime = EggInfo.soft.eggTime
        case EggInfo.medium.rawValue:
            totalTime = EggInfo.medium.eggTime
        default:
            totalTime = EggInfo.hard.eggTime
        }
        
        progressView.progress = 0.0
        secondsPassed = 0
        titleLabel.text = currentTitle
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc
    private func updateTimer() {
        
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressView.setProgress(Float(totalTime), animated: true)
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound()
        }
    }
    
    private func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print(error.localizedDescription)
        }
    }
}

//MARK: - Configure UI
extension EggViewController {
    
    private func configureMainStacks() {
        [titleLabel, configureEggStackView(), makeProgressView()].forEach {
            mainStackView.addArrangedSubview($0)
        }
    }
    
    private func makeLabel() -> UILabel  {
        let label = UILabel()
        label.text = "How do you like yours eggs?"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        return label
    }
    
    private func configureEggStackView() -> UIStackView {
        let stack: UIStackView = .makeStackView(axis: .horizontal,
                                                distribution: .fillEqually,
                                                spacing: 20)
        
        let softEggView = configureEggView(title: .soft)
        let mediumEggView = configureEggView(title: .medium)
        let hardEggView = configureEggView(title: .hard)
        [softEggView, mediumEggView, hardEggView].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }
    
    private func configureEggView(title: EggInfo) -> UIView {
        let image = UIImageView.makeImageView(title: title)
        let button = UIButton.makeButton(withTitle: title)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        let view = EggView(imageView: image, button: button)
        return view
    }
    
    private func makeProgressView() -> UIView {
        let customView = UIView()
        progressView = UIProgressView(progressViewStyle: .bar)
        let transform : CGAffineTransform = CGAffineTransform(scaleX: 1.0, y: 6.0)
        progressView.transform = transform
        progressView.progress = 0.5
        progressView.progressTintColor = .systemRed
        progressView.trackTintColor = .systemGray
        customView.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        progressView.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 10).isActive = true
        progressView.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -10).isActive = true
        return customView
    }
}

//MARK: - Constraints
extension EggViewController {
    
    private func setupMainStackViewConstraints() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
