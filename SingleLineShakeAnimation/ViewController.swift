//
//  ViewController.swift
//  SingleLineShakeAnimation
//
//  Created by Håkon Bogen on 24/04/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!

    @IBOutlet weak var numberOfSecondsSlider: UISlider!
    @IBOutlet weak var numberOfShakesSlider: UISlider!
    @IBOutlet weak var numberOfShakesLabel: UILabel!
    @IBOutlet weak var numberOfSecondsLabel: UILabel!

    var numberOfShakes = 5 {
        didSet(shakes) {
            numberOfShakesLabel.text = "\(shakes)"
        }
    }
    
    var numberOfSeconds: Float = 1.1 {
        didSet(seconds) {
            let numberFormatter = NSNumberFormatter()
            numberFormatter.maximumFractionDigits = 2
            numberFormatter.minimumIntegerDigits = 1
            numberOfSecondsLabel.text = "\(numberFormatter.stringFromNumber(NSNumber(float: seconds))!) seconds"
        }
    }

    @IBAction func didTapShakeVerticallyButton(sender: UIButton) {
        print("shaking vertically for \(numberOfShakes) shakes in \(numberOfSeconds) seconds")
        sender.shake(.Vertical)?.postAccessabilityNotification(text: "Register user before logging in")
        sender.shake(.Vertical, numberOfTimes: numberOfShakes, totalDuration: numberOfSeconds, completion: nil)?.postAccessabilityNotification(text: NSLocalizedString("shake accessability notification",  comment: "Inform the user that this view needs attention"))
    }

    @IBAction func didTapShakeHorizontallyButton(sender: UIButton) {
        print("shaking horizontally for \(numberOfShakes) shakes in \(numberOfSeconds) seconds")
        sender.shake(.Horizontal, numberOfTimes: numberOfShakes, totalDuration: numberOfSeconds, completion: nil)?.postAccessabilityNotification(text: NSLocalizedString("shake accessability notification",  comment: "Inform the user that this view needs attention"))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfShakesSlider.minimumValue = 1
        numberOfShakesSlider.maximumValue = 20
        numberOfSecondsSlider.minimumValue = 0.1
        numberOfSecondsSlider.maximumValue = 2
        numberOfSeconds = 0.4
        numberOfShakes = 5
    }


    @IBAction func numberOfShakesValueChanged(sender: UISlider) {
        let fullValue = Int(sender.value)
        numberOfShakes = fullValue
    }

    @IBAction func numberOfSecondsValueChanged(sender: UISlider) {
        numberOfSeconds = sender.value
    }

}

