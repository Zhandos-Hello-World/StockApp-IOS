//
//  StockHeader.swift
//  StockApp-IOS
//
//  Created by Zhandos Baimurat on 20.11.2022.
//

import SnapKit

class StockHeader: UITableViewHeaderFooterView {
    // ------------------------------
    // MARK: - Properties
    // ------------------------------
    static let typeName = "\(StockHeader.self)"
    
    // ------------------------------
    // MARK: - UI components
    // ------------------------------
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Stocks"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    // ------------------------------
    // MARK: - Init
    // ------------------------------
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    // ------------------------------
    // MARK: - Setup views
    // ------------------------------
    private func setupView() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.trailing.leading.bottom.equalToSuperview()
        }
    }
    
    func setTitleText(text: String) {
        titleLabel.text = text
    }
}
