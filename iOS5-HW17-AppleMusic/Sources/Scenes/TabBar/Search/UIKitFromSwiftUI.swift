//
//  UIKitFromSwiftUI.swift
//  iOS5-HW17-AppleMusic
//
//  Created by Дарья Кретюк on 04.05.2022.
//

import SwiftUI
import UIKit

struct UIKitFromSwiftUI: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let viewController = ThirdViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationItem.title = "Поиск"
        navigationController.navigationItem.searchController = UISearchController(searchResultsController: nil)
        navigationController.navigationItem.searchController?.searchBar.placeholder = "search"
        navigationController.navigationItem.searchController?.dimsBackgroundDuringPresentation = false
        navigationController.navigationItem.hidesSearchBarWhenScrolling = false
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}

struct UIKitFromSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UIKitFromSwiftUI()
    }
}
