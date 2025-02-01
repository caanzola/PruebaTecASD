import UIKit

class UsersTableViewController: UITableViewController, UISearchBarDelegate {
    
    private var viewModel = UserViewModel()
    private var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        tableView.accessibilityIdentifier = "UsersTableView"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "Search by name"
        navigationItem.titleView = searchBar
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
        fetchUsers()
    }
    
    func fetchUsers() {
        viewModel.fetchUsers { [weak self] success in
            DispatchQueue.main.async {
                if success {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = viewModel.filteredUsers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserTableViewCell
        cell.configure(with: user)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.filteredUsers[indexPath.row]
        let detailVC = UserDetailViewController(user: user)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterUsers(with: searchText)
        tableView.reloadData()
    }
}
