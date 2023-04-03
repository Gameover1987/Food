
import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        self.window = window
       
        let tabBarController = UITabBarController()
        
        let menuController = MenuViewControler()
        menuController.tabBarItem.title = "Меню"
        menuController.tabBarItem.image = UIImage(named: "Menu")
        
        let contactsController = ContactsViewController()
        contactsController.tabBarItem.title = "Контакты"
        contactsController.tabBarItem.image = UIImage(named: "Contacts")
        
        let profileController = ProfileViewController()
        profileController.tabBarItem.title = "Профиль"
        profileController.tabBarItem.image = UIImage(named: "Profile")
        
        let shoppingCartController = ShoppingCartViewController()
        shoppingCartController.tabBarItem.title = "Корзина"
        shoppingCartController.tabBarItem.image = UIImage(named: "ShoppingCart")
        
        let controllers = [menuController, contactsController, profileController, shoppingCartController]
        
        UITabBar.appearance().tintColor = Colors.tabBarTint
        
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width:tabBarController.tabBar.frame.size.width, height: 0.5))
        lineView.backgroundColor = .gray
        tabBarController.tabBar.addSubview(lineView)
        
        tabBarController.setViewControllers(controllers, animated: false)
        tabBarController.tabBar.backgroundColor = .white
        
        window.rootViewController = tabBarController
        window.overrideUserInterfaceStyle = .light
        window.makeKeyAndVisible()
        
        return true
    }
}
