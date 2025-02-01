import Foundation

class UserViewModel {
    
    var users: [User] = []
    var filteredUsers: [User] = []
    
    func fetchUsers(completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            completion(false)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching users: \(error)")
                completion(false)
                return
            }
            
            guard let data = data else {
                completion(false)
                return
            }
            
            do {
                self.users = try JSONDecoder().decode([User].self, from: data)
                print(self.users)
                self.filteredUsers = self.users
                completion(true)
            } catch {
                print("Error decoding data: \(error)")
                completion(false)
            }
        }.resume()
    }
    
    func filterUsers(with searchText: String) {
        if searchText.isEmpty {
            filteredUsers = users
        } else {
            filteredUsers = users.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}
