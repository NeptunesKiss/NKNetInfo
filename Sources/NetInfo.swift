//
//  NetInfo.swift
//  NetInfo
//
//  Created by Travasoni Giuseppe on 26/08/16.
//
//

import CoreFoundation
import CoreTelephony
import NetInfo
import SystemConfiguration.CaptiveNetwork

class NKNetInfo {
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
            setProxyProperties()
            
            if wifi {
                setWifiProperties()
            }
            if connected {
                radioTecnology = CTTelephonyNetworkInfo().currentRadioAccessTechnology
            }
        }
    }
}



extension NKNetInfo {
    
    fileprivate func setWifiProperties() {
        if Platform.isSimulator {
            SSID = "simulator_SSID"
            MACAddress = "simulator_MAC"
        }
        else {
            if let interfaces = CNCopySupportedInterfaces() as NSArray? {
                for interface in interfaces {
                    if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                        SSID = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String
                        MACAddress = interfaceInfo[kCNNetworkInfoKeyBSSID as String] as? String
                    }
                }
            }
        }
    }
    
    fileprivate func setProxyProperties() {
        
        if let proxySettings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as NSDictionary? {
            if let proxyPortNumber = proxySettings[kCFNetworkProxiesHTTPPort as String] as? NSNumber {
                proxyPort = String(describing: proxyPortNumber)
            }
            proxyAddress = proxySettings[kCFNetworkProxiesHTTPProxy as String] as? String
        }
        behindProxy = (proxyPort != nil && proxyAddress != nil)
        
    }
}
