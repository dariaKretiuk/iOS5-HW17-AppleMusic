//
//  CollectionSearch.swift
//  AppleMusicSearchUIKit
//
//  Created by Дарья Кретюк on 30.04.2022.
//

import UIKit

class CollectionSearch: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Elements
    
    static let identifier = "CollectionSearch"
    
    lazy var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: viewLayout)
        return collectionView
    }()
    
    lazy var bottomLine: CALayer = {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: -3, width: view.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.f5cac5.cgColor
        return bottomLine
    }()
    
    private var models: SearchCollection
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayouts()
        setupCollection()
        collectionView.reloadData()
    }
    
    // MARK: - Initilal
    
    required init(model: SearchCollection) {
        self.models = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Settings
    
    private func setupView() {
        view.backgroundColor = .white
        title = models.name
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func setupCollection() {
        collectionView.collectionViewLayout = createLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionSearchViewCell.self, forCellWithReuseIdentifier: CollectionSearchViewCell.identifier)
        collectionView.register(CollectionFavoritesSearchViewCell.self, forCellWithReuseIdentifier: CollectionFavoritesSearchViewCell.identifier)
        collectionView.register(CollectionNewSearchViewCell.self, forCellWithReuseIdentifier: CollectionNewSearchViewCell.identifier)
        collectionView.register(AlbumsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    // MARK: - CompositionalLayout
    
    func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0: return self.firstKindSectionCreateLayout(with: sectionIndex)
            case 1: return self.firstKindSectionCreateLayout(with: sectionIndex)
            default:
                return self.secondSectionCreateLayout(with: sectionIndex)
            }
        }
    }
    
    private func firstKindSectionCreateLayout(with numberSection: Int) -> NSCollectionLayoutSection {
        //  ITEM
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(numberSection == 0 ? 375 : 230),
                                              heightDimension: .absolute(300))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)
                
        //  GROUP
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(numberSection == 0 ? 0.9 : 0.56),
                                               heightDimension: .fractionalHeight(numberSection == 0 ? 0.42 : 0.37))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
        //  SECTION
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: numberSection == 0 ? 10 : 0, leading: 15, bottom: 0, trailing: 15)
        section.orthogonalScrollingBehavior = .groupPaging
        
        if numberSection != 0 {
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [header]
        }
        return section
    }
    
    private func secondSectionCreateLayout(with numberSection: Int) -> NSCollectionLayoutSection {
        var section: NSCollectionLayoutSection
        var nestedGroup: NSCollectionLayoutGroup
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 15)
        // group - vertical
        let innerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.8))
        let innerGroup = NSCollectionLayoutGroup.vertical(layoutSize: innerGroupSize, subitem: item, count: 4)
        // group - horizontal
        let nestedGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.55))
        nestedGroup = NSCollectionLayoutGroup.horizontal(layoutSize: nestedGroupSize, subitems: [innerGroup])
        
        section = NSCollectionLayoutSection(group: nestedGroup)
        section.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 15)
        section.orthogonalScrollingBehavior = .groupPaging
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    // MARK: - Data Source and Delegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return models.searchCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.searchCell[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models.searchCell[indexPath.section][indexPath.row]
        
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionSearchViewCell.identifier, for: indexPath) as? CollectionSearchViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: model)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionFavoritesSearchViewCell.identifier, for: indexPath) as? CollectionFavoritesSearchViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: model)
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionNewSearchViewCell.identifier, for: indexPath) as? CollectionNewSearchViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as? AlbumsHeaderView else {
            return UICollectionReusableView()
        }
        header.layer.addSublayer(bottomLine)

        switch indexPath.section {
        case 0: header.configure(with: "")
        case 1: header.configure(with: "Избранные плейлисты")
        default: header.configure(with: "Лучшие новые треки")
        }

        return header
    }
}
