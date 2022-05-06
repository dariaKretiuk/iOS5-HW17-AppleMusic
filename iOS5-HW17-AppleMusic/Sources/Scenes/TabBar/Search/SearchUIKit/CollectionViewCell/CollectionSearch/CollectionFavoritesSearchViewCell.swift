//
//  CollectionFavoritesSearchViewCell.swift
//  AppleMusicSearchUIKit
//
//  Created by Дарья Кретюк on 30.04.2022.
//

import UIKit

class CollectionFavoritesSearchViewCell: UICollectionViewCell {
    
    // MARK: - Elements
    
    static let identifier = "CollectionFavoritesSearchViewCell"
    
    let albumImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        img.backgroundColor = Metrics.color.randomElement()
        return img
    }()
    
    var additionalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var nameAlbum: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
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
        nameAlbum.text = nil
        stackView.backgroundColor = nil
    }
    
    // MARK: - Private functions
    
    private func setupHierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(albumImageView)
        stackView.addArrangedSubview(additionalLabel)
        stackView.addArrangedSubview(nameAlbum)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            albumImageView.widthAnchor.constraint(equalToConstant: 230),
            albumImageView.heightAnchor.constraint(equalToConstant: 230)
        ])
    }
    
    // MARK: - Configure cell
    
    public func configure(with model: SearchCell) {
        albumImageView.backgroundColor = Metrics.color.randomElement()
        additionalLabel.text = model.additionalInfo
        nameAlbum.text = model.name
    }
}

