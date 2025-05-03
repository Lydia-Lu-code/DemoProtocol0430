//
//  ViewModel.swift
//  DemoProtocol0430
//
//  Created by Lydia Lu on 2025/4/30.
//

import Foundation

class ViewModel {
    
    let dalegate: ChangeColorTheme?
    
    init(dalegate: ChangeColorTheme) {
        self.dalegate = dalegate
    }
    
    func changeView() {
        self.dalegate?.changeColor()
    }
    
    
}
