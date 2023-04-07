//
//  ProfileViewController.swift
//  Netology_IB_Instruments2
//
//  Created by Evgeniy Ustyan on 06.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private var myView: ProfileView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        myView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView
        
        view.addSubview(myView)
        
        
        
//        ProfileView = Bundle.main.loadNibNamed("ProfileView", owner: nil)?.first as? ProfileView
//        view.addSubview(ProfileView)

        
    }
    


}
