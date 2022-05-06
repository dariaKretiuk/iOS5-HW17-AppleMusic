//
//  CollectionNewSearchViewCell.swift
//  AppleMusicSearchUIKit
//
//  Created by Дарья Кретюк on 04.05.2022.
//

import UIKit

class CollectionNewSearchViewCell: UICollectionViewCell {
    
    // MARK: - Elements
    
    static let identifier = "CollectionNewSearchViewCell"
    
    lazy var bottomLine: CALayer = {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 85, y: 0, width: 295, height: 2)
        bottomLine.backgroundColor = UIColor.f5cac5.cgColor
        return bottomLine
    }()
    
    public let threeDotImageViewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let threeDotImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "list.bullet.circle")
        img.contentMode = .right
        img.contentMode = .scaleAspectFill
        img.tintColor = .black
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    public let albumImageViewContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .clear
        return view
    }()
    
    let albumImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .left
        img.contentMode = .scaleToFill
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        return img
    }()
    
    var nameMusic: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var nameArtist: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        return stackView
    }()
    
    let stackViewInfo: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayouts()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        albumImageView.image = nil
        nameMusic.text = nil
        stackView.backgroundColor = nil
    }
    
    // MARK: - Private functions
    
    private func setupHierarchy() {
        contentView.layer.addSublayer(bottomLine)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(albumImageViewContainer)
        albumImageViewContainer.addSubview(albumImageView)
        stackView.addArrangedSubview(stackViewInfo)
        stackViewInfo.addArrangedSubview(nameMusic)
        stackViewInfo.addArrangedSubview(nameArtist)
        stackView.addArrangedSubview(threeDotImageViewContainer)
        threeDotImageViewContainer.addSubview(threeDotImageView)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            albumImageViewContainer.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            albumImageViewContainer.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
            albumImageViewContainer.widthAnchor.constraint(equalToConstant: 70),
            albumImageViewContainer.heightAnchor.constraint(equalToConstant: 70),
            albumImageView.centerYAnchor.constraint(equalTo: albumImageViewContainer.centerYAnchor),
            albumImageView.heightAnchor.constraint(equalToConstant: 70),
            albumImageView.widthAnchor.constraint(equalToConstant: 70),
            stackViewInfo.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            stackViewInfo.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 10),
            nameArtist.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 25),
            threeDotImageViewContainer.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            threeDotImageViewContainer.widthAnchor.constraint(equalToConstant: 20),
            threeDotImageViewContainer.heightAnchor.constraint(equalToConstant: 20),
            threeDotImageView.centerYAnchor.constraint(equalTo: threeDotImageViewContainer.centerYAnchor),
            threeDotImageView.trailingAnchor.constraint(equalTo: threeDotImageViewContainer.trailingAnchor, constant: 50),
            threeDotImageView.widthAnchor.constraint(equalToConstant: 20),
            threeDotImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    // MARK: - Configure cell
    
    public func configure(with model: SearchCell) {
        albumImageView.backgroundColor = Metrics.color.randomElement()
        nameMusic.text = model.name
        nameArtist.text = model.additionalInfo
    }
}
