//
//  ViewController.swift
//  Example-OSX
//
//  Created by Andrew Shepard on 4/28/15.
//  Copyright (c) 2015 Andrew Shepard. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var locationLabel: NSTextField!
    
    let locationTracker = LocationTracker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.updateLocationLabel("Unknown")
        
        self.locationTracker.addLocationChangeObserver { (result) -> () in
            switch result {
            case .success(let location):
                let coordinate = location.physical.coordinate
                let locationString = "\(coordinate.latitude), \(coordinate.longitude)"
                self.updateLocationLabel(locationString)
            case .failure:
                self.updateLocationLabel("Failure")
            }
        }
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func updateLocationLabel(_ text: String) -> Void {
        self.locationLabel.stringValue = "Location: \(text)"
    }
}

