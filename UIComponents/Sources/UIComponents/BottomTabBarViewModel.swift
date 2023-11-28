//
//  BottomTabViewModel.swift
//  Knektu
//
//  Created by Helia on 10/14/23.
//

import Foundation

class BottomTabViewModel: ObservableObject {
    @Published var navItems: [BottomTabBarModel] = []
    
    func itemTapped(_ item: BottomTabBarModel) {
        print("Selected: \(item.title)")
    }
}
