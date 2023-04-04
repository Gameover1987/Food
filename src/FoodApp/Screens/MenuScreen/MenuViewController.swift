
import UIKit
import SnapKit

final class MenuViewControler : UIViewController {
    
    private let menuViewModel: MenuViewModel
    
    private lazy var citySelector: CitySelectorView = {
        let citySelector = CitySelectorView()
        return citySelector
    }()
    
    private lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
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
    
    init(menuViewModel: MenuViewModel) {
        self.menuViewModel = menuViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        
        view.backgroundColor = Colors.menuBackground

        view.addSubview(citySelector)
        citySelector.arrange()
        citySelector.snp.makeConstraints { make in
            make.left.top.right.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(40)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(citySelector.snp.bottom)
            make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }

        tableView.reloadData()

        menuViewModel.load { [weak self] result in
            guard let self = self else {return}

            self.tableView.reloadData()
        }
    }
}

extension MenuViewControler : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 1) {
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
            let cell = tableView.dequeueReusableCell(withIdentifier: BannersTableViewCell.identifier, for: indexPath) as! BannersTableViewCell
            return cell
        }
        
        if (indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: FoodTableViewCell.identifier, for: indexPath) as! FoodTableViewCell
            let food = menuViewModel.foodCollection[indexPath.row]
            cell.update(by: food)
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
            return menuViewModel.foodCollection.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        if (indexPath.section == 0) {
            return 112
        }
        
        if (indexPath.section == 1) {
            return 172
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 1) {
            return 80
        }
        
        return 0
    }
}
