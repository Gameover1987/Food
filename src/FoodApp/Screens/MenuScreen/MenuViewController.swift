
import UIKit
import SnapKit

final class MenuViewControler : UIViewController {

    private let names = ["Stacy", "Steve", "Tanya", "Evgeniy", "Sasha", "Kristy", "Ira", "Andrew", "Ed"]

    private lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CitySelectorTableViewCell.self, forCellReuseIdentifier: CitySelectorTableViewCell.identifier)
        tableView.register(BannersTableViewCell.self, forCellReuseIdentifier: BannersTableViewCell.identifier)
        tableView.register(FoodTableViewCell.self, forCellReuseIdentifier: FoodTableViewCell.identifier)
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = Colors.menuBackground
        
        tableView.sectionHeaderTopPadding = 0
        tableView.sectionFooterHeight = 0.0
        tableView.sectionHeaderHeight = 0.0
        
        tableView.allowsSelection = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        
        view.backgroundColor = Colors.menuBackground

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.reloadData()
    }
}

extension MenuViewControler : UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 2) {
            let header = FoodCategoriesTableHeader()
            header.update(categories: ["Pizza", "Steak", "Soup", "Salad"])
            return header
        }
        
        return nil
    }
}

extension MenuViewControler : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: CitySelectorTableViewCell.identifier, for: indexPath) as! CitySelectorTableViewCell
            return cell
        }
        
        if (indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: BannersTableViewCell.identifier, for: indexPath) as! BannersTableViewCell
            return cell
        }
        
        if (indexPath.section == 2) {
            let cell = tableView.dequeueReusableCell(withIdentifier: FoodTableViewCell.identifier, for: indexPath) as! FoodTableViewCell
            return cell
        }
        
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return names.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (indexPath.section == 0) {
            return 30
        }
        
        if (indexPath.section == 1) {
            return 112
        }
        
        if (indexPath.section == 2) {
            return 172
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 2) {
            return 80
        }
        
        return 0
    }
}
