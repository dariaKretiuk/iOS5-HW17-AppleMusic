//
//  AlbumsHeaderView.swift
//  AppleMusicSearchUIKit
//
//  Created by Дарья Кретюк on 29.04.2022.
//

import UIKit

class AlbumsHeaderView: UICollectionReusableView {
    
    // MARK: - Elements
    
    static let identifier = "AlbumsHeaderView"
    
    private var name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var button: UIButton {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Все", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30
        return stackView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackView)
        stackView.addArrangedSubview(name)
//        stackView.addArrangedSubview(button)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 70),
            stackView.widthAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        name.text = nil
    }
    
    // MARK: - Private functions
    
    public func configure(with title: String) {
        name.text = title
    }
}
