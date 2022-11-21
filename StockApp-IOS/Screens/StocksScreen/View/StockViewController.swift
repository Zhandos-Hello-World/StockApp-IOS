//
//  ViewController.swift
//  StockApp-IOS
//
//  Created by Zhandos Baimurat on 20.11.2022.
//

import SnapKit

class StockViewController: UIViewController {
    
    // ------------------------------
    // MARK: - Proporties
    // ------------------------------
    private let presenter: StockPresenterProtocol
    
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
    // MARK: - Init
    // ------------------------------
    init(presenter: StockPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // ------------------------------
    // MARK: - Life cycle
    // ------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadView()
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
        return presenter.itemsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StockCell.typeName, for: indexPath) as? StockCell else {
            return UITableViewCell()
        }
        cell.configure(with: presenter.model(for: indexPath), index: indexPath.row)
        return cell
    }
}


extension StockViewController: StockViewProtocol {
    func updateCell(for indexPath: IndexPath) {
        stockTableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func updateView() {
        stockTableView.reloadData()
    }
    
    func updateView(withLoader isLoading: Bool) {
        
    }
    
    func updateView(withError message: String) {
        
    }
    
    
}
