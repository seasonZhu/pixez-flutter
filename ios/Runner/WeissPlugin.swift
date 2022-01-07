//
//  WeissPlugin.swift
//  Runner
//
//  Created by dy on 2022/1/6.
//

import Foundation
import WebKit

import Flutter

public class WeissPlugin {

    private static let weissChannel = "com.perol.dev/weiss"
    
    private static let tag = "weiss"
    
    private static var port = "9876"
    
    
  public static func bind(controller : FlutterViewController){
        let channel = FlutterMethodChannel(name: "com.perol.dev/weiss",
                                                  binaryMessenger: controller.binaryMessenger)
        channel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            switch call.method {
            case "start":
                if let dict = call.arguments as? [String: String] {
                    let p = dict["port"] ?? "9876"
                    port = p
                    let map = dict["map"] ?? ""
                    start(port: port, map: map)
                }
            case "proxy":
                proxy()
            case "stop":
                stop()
            default:
                break
            }
            result(true)
        })
    }
    
    private static func start(port: String, map: String) {
        print("WeissPlugin start")
    }
    
    private static func proxy() {
        print("WeissPlugin proxy")
    }
    
    private static func stop() {
        print("WeissPlugin stop")
    }
    
}
