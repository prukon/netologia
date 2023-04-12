//
//  SceneDelegate.swift
//  Базовые UI компоненты lesson4
//
//  Created by Evgeniy Ustyan on 07.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
//        Создаем windows
        let window = UIWindow(windowScene: windowScene)

//        Создаем объект ViewController
        let profileViewcontroller = ProfileViewController()
        
        //Создаем UINovigationViewController
        let profileNovigationViewController = UINavigationController(rootViewController: profileViewcontroller)
        profileNovigationViewController.tabBarItem.title = "Profile"
//        profileNovigationViewController.tabBarItem.image(UIImage(named: "square.and.arrow.up.circle"))
        
        let settingViewController = SettingViewController()
        settingViewController.tabBarItem.title = "Setting"
//        settingViewController.tabBarItem.image(UIImage(named: "square.and.arrow.up"))
        
        let tabViewController = UITabBarController()
        tabViewController.viewControllers = [profileNovigationViewController, settingViewController]
        tabViewController.tabBar.backgroundColor = UIColor.gray
        tabViewController.tabBar.tintColor = UIColor.blue
        
//        устанавливаем NovigationViewController как rootController
        window.rootViewController =  tabViewController
        
//        Устанавливаем ранее созданное window как главное windows и делаем его видимым
        self.window = window
        window.makeKeyAndVisible()
        
        
    }

}

