import Vapor
import Leaf // added
import Routing // added


/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    // MARK: Authentication routes
    let userController = UserController()
    router.get("register", use: userController.renderRegister)
    router.post("register", use: userController.register)
    router.get("login", use: userController.renderLogin)
    
    // Authentication handler
    let authSessionRouter = router.grouped(User.authSessionsMiddleware())
    authSessionRouter.post("login", use: userController.login)
    
}

// Important: Your class or struct conforms to Content
struct Person: Content {
    var name: String
    var age: Int
}
