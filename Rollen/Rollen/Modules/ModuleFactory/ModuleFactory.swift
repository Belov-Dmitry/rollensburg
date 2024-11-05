//
//  ModuleFactory.swift
//  Rollen
//
//  Created by Dmitry Belov on 04.11.2024.
//

import UIKit

struct ModuleFactory {
    //MARK: - Onboarding flow
    static func makeOnboardingFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController) {
        let onboardingCoordinator = OnboardingCoordinator(finishDelegate: finishDelegate, navigationController: navigationController, type: .onboarding)
        coordinator.addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    static func makeOnboarding(coordinator: OnboardingCoordinator) -> OnboardingViewController {
        let viewModel = OnboardingViewModel(coordinator: coordinator)
        let onboardingViewController = OnboardingViewController(viewModel: viewModel)
        return onboardingViewController
    }
    
    //MARK: - SignIn flow
    static func makeSignInFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController) {
        let signInCoordinator = SignInCoordinator(finishDelegate: finishDelegate, navigationController: navigationController, type: .signIn)
        coordinator.addChildCoordinator(signInCoordinator)
        signInCoordinator.start()
    }
    
    static func makeSignIn(coordinator: SignInCoordinator) -> SignInViewController {
        let viewModel = SignInViewModel(coordinator: coordinator)
        let signInViewController = SignInViewController(viewModel: viewModel)
        return signInViewController
    }
    
    
    //MARK: - Main flow
    static func makeMainFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate) -> TabBarController{
        let profileNavigationController = UINavigationController()
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 0)
        let profileCoordinator = ProfileCoordinator(navigationController: profileNavigationController, type: .profile)
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        let mainNavigationController = UINavigationController()
        mainNavigationController.tabBarItem = UITabBarItem(title: "Main", image: UIImage(systemName: "house"), tag: 1)
        let mainCoordinator = MainCoordinator(navigationController: mainNavigationController, type: .main)
        mainCoordinator.finishDelegate = finishDelegate
        mainCoordinator.start()
        
        let cartNavigationController = UINavigationController()
        cartNavigationController.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "basket"), tag: 2)
        let cartCoordinator = CartCoordinator(navigationController: cartNavigationController, type: .cart)
        cartCoordinator.finishDelegate = finishDelegate
        cartCoordinator.start()
        
        coordinator.addChildCoordinator(profileCoordinator)
        coordinator.addChildCoordinator(mainCoordinator)
        coordinator.addChildCoordinator(cartCoordinator)
        
        let tabBarControllers = [profileNavigationController, mainNavigationController, cartNavigationController]
        let tabBarViewController = TabBarController(tabBarControllers: tabBarControllers)
        return tabBarViewController
    }
    
    static func makeMain(coordinator: OnboardingCoordinator) -> OnboardingViewController {
        let viewModel = OnboardingViewModel(coordinator: coordinator)
        let onboardingViewController = OnboardingViewController(viewModel: viewModel)
        return onboardingViewController
    }
}