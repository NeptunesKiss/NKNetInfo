//
//  NetInfo.swift
//  NetInfo
//
//  Created by Travasoni Giuseppe on 26/08/16.
//
//

import CoreTelephony
import SystemConfiguration.CaptiveNetwork

class NetInfo {
    var connected: Bool = false
    var wifi: Bool = false
    var behindProxy: Bool = false
    var radioTecnology: String?
    var SSID: String?
    var MACAddress: String?
    var proxyAddress: String?
    var proxyPort: String?
    
    init() {
        if let reach = Reachability.init() {
            connected = reach.isReachable
            wifi = reach.isReachableViaWiFi
            if wifi {
                setWifiProperties()
                setProxyProperties()
            }
        }
    }
    
    fileprivate func setWifiProperties() {
        if Platform.isSimulator {
            SSID = "simulator_SSID"
            MACAddress = "simulator_MAC"
        }
        if let ifs = CNCopySupportedInterfaces() as? Array<CFString> {
            ifs.forEach({ ifnam in
                if let info = CNCopyCurrentNetworkInfo(ifnam) as? Dictionary<String, String> {
                    if let ssid = info["SSID"] {
                        SSID = ssid
                    }
                    if let mac = info["BSSID"] {
                        MACAddress = mac
                    }
                }
            })
        }
    }
    
    fileprivate func setProxyProperties() {
        
    }
}
