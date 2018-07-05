import FluentSQLite
import Vapor
import Authentication // Make authenticatable

final class User: SQLiteModel {
    var id: Int?
    var email: String
    var password: String
    
    init(id: Int? = nil, email: String, password: String) {
        self.id = id
        self.email = email
        self.password = password
    }
    
}

extension User: Content {}
extension User: Migration {}

// Make User authenticatable
extension User: PasswordAuthenticatable {
    static var passwordKey: WritableKeyPath<User, String> {
        return \User.password // backslash lets the compiler know the class exists at the root?
    }
    
    static var usernameKey: WritableKeyPath<User, String> {
        return \User.email
    }
    
}

extension User: SessionAuthenticatable {}
