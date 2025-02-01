import UIKit

class UserDetailViewController: UITableViewController {

    private var user: User
    
    init(user: User) {
        self.user = user
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.name
        tableView.register(UserDetailImageCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(UserDetailImageCell.self, forCellReuseIdentifier: "ImageCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        }
        return UITableView.automaticDimension
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! UserDetailImageCell
            cell.configure(with: user)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.lineBreakMode = .byWordWrapping
            
            switch indexPath.row {
            case 1:
                cell.textLabel?.text = "Name: \(user.name)"
            case 2:
                cell.textLabel?.text = "Email: \(user.email)"
            case 3:
                cell.textLabel?.text = "Address: \(user.address.street), \(user.address.city)"
            case 4:
                cell.textLabel?.text = "Company: \(user.company.name)"
            default:
                break
            }
            return cell
        }
    }
}
