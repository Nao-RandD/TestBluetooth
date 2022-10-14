//
//  ViewController.swift
//  TestBluetooth
//
//  Created by naoyuki.kan on 2022/10/14.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {
    var centralManager: CBCentralManager?
    var peripheral: CBPeripheral?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
}

extension ViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("Bluetoothの設定は", central.state)
        switch central.state {
        case .unauthorized:
            switch central.authorization {
            case .allowedAlways: break
            case .denied: break
            case .restricted: break
            case .notDetermined: break
            @unknown default:
                fatalError()
            }
        case .unknown: break
        case .unsupported:  break
        case .poweredOn:
            self.centralManager?.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey:true])
        case .poweredOff: break
        case .resetting: break
        @unknown default:
            print("知らない")
        }
    }
}
