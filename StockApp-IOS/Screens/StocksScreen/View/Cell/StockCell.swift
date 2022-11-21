//
//  StockCell.swift
//  StockApp-IOS
//
//  Created by Zhandos Baimurat on 20.11.2022.
//

import SnapKit

final class StockCell: UITableViewCell {
    // ------------------------------
    // MARK: - Properties
    // ------------------------------
    static let typeName = "\(StockCell.self)"
    static let colorSecondary = UIColor(red: 0.94, green: 0.96, blue: 0.97, alpha: 1.0)

    // ------------------------------
    // MARK: - UI components
    // ------------------------------
    private lazy var iconView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "YNDX")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "btc"
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.text = "Bitcoin"
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Bitcoin"
        return label
    }()
    
    private lazy var changedLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .green
        label.textColor = UIColor(red: 0.14, green: 0.70, blue: 0.36, alpha: 1.00)
        label.text = "$0.32(4,3%)"
        return label
    }()
    
    private lazy var starButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "Path"), for: UIControl.State.normal)
        btn.setImage(UIImage(named: "PathFill"), for: .selected)
        return btn
    }()
    
    // ------------------------------
    // MARK: - Init
    // ------------------------------
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ------------------------------
    // MARK: - Setup views
    // ------------------------------
    
    private func setupViews() {
        [iconView,
         symbolLabel,
         nameLabel,
         priceLabel,
         changedLabel,
         starButton
        ].forEach(addSubview(_:))
        contentView.layer.cornerRadius = 16
        self.layer.cornerRadius = 16
        setupConstraints()
    }
    
    private func setupConstraints() {
        iconView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(8)
            make.width.height.equalTo(52)
        }
        
        symbolLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(14)
            make.leading.equalTo(iconView.snp.trailing).offset(12)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(symbolLabel.snp.leading)
            make.top.equalTo(symbolLabel.snp.bottom)
        }
        
        starButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(17)
            make.leading.equalTo(symbolLabel.snp.trailing).offset(6)
            make.width.height.equalTo(16)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(17)
            make.top.equalToSuperview().inset(14)
        }
        
        changedLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom)
            make.trailing.equalToSuperview().inset(12)
        }
    }
    
    //MARK: logic methods
    func configure(with stock: StockItemModelProtocol, index: Int) {
        symbolLabel.text = stock.symbol
        nameLabel.text = stock.name
        changedLabel.text = "$0.32(4,3%)"
        priceLabel.text = stock.price
        starButton.isSelected = stock.isFavourite
    }
}
