//
//  CollectionSearchViewCell.swift
//  AppleMusicSearchUIKit
//
//  Created by Дарья Кретюк on 30.04.2022.
//

import UIKit

class CollectionSearchViewCell: UICollectionViewCell {
    
    // MARK: - Elements
    
    static let identifier = "CollectionSearchViewCell"
    
    private let albumImageViewContainer: UIView = {
       let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    let albumImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        return img
    }()
    
    var additionalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var nameAlbum: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var nameArtist: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
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
        nameArtist.text = nil
        stackView.backgroundColor = nil
    }
    
    // MARK: - Private functions
    
    private func setupHierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(additionalLabel)
        stackView.addArrangedSubview(nameAlbum)
        stackView.addArrangedSubview(nameArtist)
        stackView.addArrangedSubview(albumImageView)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            albumImageView.widthAnchor.constraint(equalToConstant: 375),
            albumImageView.heightAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    // MARK: - Configure cell
    
    public func configure(with model: SearchCell) {
        albumImageView.backgroundColor = Metrics.color.randomElement()
        additionalLabel.text = model.additionalInfo
        nameAlbum.text = model.name
        nameArtist.text = model.nameAlbum
    }
}
