//
//  ThirdViewController.swift
//  AppleMusicSearchUIKit
//
//  Created by Дарья Кретюк on 29.04.2022.
//

import UIKit

class ThirdViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Elements
    
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: viewLayout)
        return collectionView
    }()
    
    private var models: [[Search]] = [AppleMusicModel().getSearch()]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayouts()
        setupCollection()
        collectionView.reloadData()
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        view.backgroundColor = .white
        navigationItem.title = "Поиск"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.placeholder = "Ваша медиатека"
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
        collectionView.register(SearchViewCell.self, forCellWithReuseIdentifier: SearchViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    // MARK: - CompositionalLayout
    
    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in

            var section: NSCollectionLayoutSection
            var nestedGroup: NSCollectionLayoutGroup
            
            // item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 5, leading: 0, bottom: 0, trailing: 10)
            
            // group - horizontal
            let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(80))
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitem: item, count: 2)
            
            // group - vertical
            let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.94), heightDimension: .fractionalHeight(0.9))
            let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize, subitems: [horizontalGroup])

            section = NSCollectionLayoutSection(group: verticalGroup)
            section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
            section.orthogonalScrollingBehavior = .groupPaging
            
            return section
        }
    }
    
    // MARK: - Data Source and Delegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print(models.count)
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(models[section].count)
        return models[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.section][indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchViewCell.identifier, for: indexPath) as? SearchViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: model)
        cell.delegate = self
        return cell
    }
    
    // MARK: - Actions
    
    @objc func addTapped() {
        print("""
            Добавить:
        - Новый альбом
        - Новую папку
        - Новый общие альбом
        """)
    }
}

extension ThirdViewController: SearchViewCellDelegate {
    
    func tapButtonAction(model: SearchCollection) {
        navigationController?.pushViewController(CollectionSearch(model: model), animated: true)
    }
}

