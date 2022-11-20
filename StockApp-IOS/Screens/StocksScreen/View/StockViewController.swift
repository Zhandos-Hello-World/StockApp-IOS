//
//  ViewController.swift
//  StockApp-IOS
//
//  Created by Zhandos Baimurat on 20.11.2022.
//

import SnapKit

class StockViewController: UIViewController {
    // ------------------------------
    // MARK: - UI components
    // ------------------------------
    private lazy var stockTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(StockCell.self, forCellReuseIdentifier: StockCell.typeName)
        tableView.register(StockHeader.self, forHeaderFooterViewReuseIdentifier: StockHeader.typeName)
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.sectionFooterHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .white
        return tableView
    }()
    
    // ------------------------------
    // MARK: - Life cycle
    // ------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // ------------------------------
    // MARK: - Setup views
    // ------------------------------
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(stockTableView)
        setupConstraints()
    }
    
    func setupConstraints() {
        stockTableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(16)
        }
    }
}

extension StockViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: StockHeader.typeName) as? StockHeader else {
            return UITableViewHeaderFooterView()
        }
        return header
    }
}

extension StockViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StockCell.typeName, for: indexPath) as? StockCell else {
            return UITableViewCell()
        }
        return cell
    }
}
