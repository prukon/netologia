//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 07.04.2023.
//


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        //Создаем windows
        let window = UIWindow(windowScene: windowScene)
        
        //Создаем объект profileViewcontroller
        let profileViewcontroller = ProfileViewController()
        let profileNovigationViewController = UINavigationController(rootViewController: profileViewcontroller)
        profileNovigationViewController.tabBarItem.title = "Profile"
        profileNovigationViewController.tabBarItem.image = UIImage(named: "square.and.arrow.up.circle.png")
        
        //Создаем объект feedViewController
        let feedViewController = FeedViewController()
        let feedNovigationViewController = UINavigationController(rootViewController: feedViewController)
        feedNovigationViewController.tabBarItem.title = "Feed"
        feedNovigationViewController.tabBarItem.image = UIImage(named: "square.and.arrow.up.circle.png")
        
        //Создаем объект tabViewController
        let tabViewController = UITabBarController()
        tabViewController.viewControllers = [profileNovigationViewController, feedNovigationViewController]
        tabViewController.tabBar.backgroundColor = UIColor.gray
        tabViewController.tabBar.tintColor = UIColor.blue
        
        //Устанавливаем NovigationViewController как rootController
        window.rootViewController =  tabViewController
        
        //Устанавливаем ранее созданное window как главное windows и делаем его видимым
        self.window = window
        window.makeKeyAndVisible()
    }
}
