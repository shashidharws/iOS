//
//  main.swift
//  Protocols and Delegates
//
//  Created by smuser on 23/12/19.
//  Copyright © 2019 smuser. All rights reserved.
//

protocol advancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate : advancedLifeSupport?
    
    func assessEmergency() {
        delegate?.performCPR()
    }
    
}

class Surgen: advancedLifeSupport {
    
    init(handler : EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("Surgen attends")
    }
}

struct Paramedic: advancedLifeSupport {
    init(handler : EmergencyCallHandler) {
        handler.delegate = self
    }

    func performCPR() {
        print("Paramedic attends")
    }
}

let em = EmergencyCallHandler()
let sur = Surgen(handler:em)

let par = Paramedic(handler: em)

em.assessEmergency()
