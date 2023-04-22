//
//  MainViewController.swift
//  RickAndMorty
//
//  Created by Cansu Özdizlekli on 4/20/23.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var locationCollectionView: UICollectionView!
    @IBOutlet weak var characterTableView: UITableView!
    let viewModel = MainViewModel()
    var residentsArr : [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .blue
        viewModelConfiguration()
        setupTableView()
        setupCollectionView()
        let isFirstTime = true
        UserDefaults.standard.set(isFirstTime, forKey: "isFirstTime")
    }
    
    private func setupCollectionView() {
        locationCollectionView.delegate = self
        locationCollectionView.dataSource = self
        locationCollectionView.showsHorizontalScrollIndicator = false
        locationCollectionView.register(LocationCollectionViewCell.self, forCellWithReuseIdentifier: LocationCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: view.frame.size.width/3, height: view.frame.size.height/7)
        locationCollectionView.collectionViewLayout = layout
    }

    private func setupTableView() {
        characterTableView.dataSource = self
        characterTableView.delegate = self
        characterTableView.showsVerticalScrollIndicator = false
        characterTableView.register(CharacterTableViewCell.nib, forCellReuseIdentifier: CharacterTableViewCell.identifier)
        characterTableView.backgroundColor = .green
    }
    
    private func viewModelConfiguration(){
        viewModel.getCharacters()
        viewModel.getLocations()
        viewModel.errorCallback = { [weak self] errorMessage in
            print("error",errorMessage)
        }
        viewModel.successCallback = { [weak self] in
            self?.locationCollectionView.reloadData()
//            self?.characterTableView.reloadData()
        }
    }
    
    private func CharactersFromViewModel(){
        print("array",residentsArr)
        if residentsArr.count == 1 {
            viewModel.getSingleCharacter(CharacterIdsArray: residentsArr)
        }else {
            viewModel.getMultipleCharacters(CharacterIdsArray: residentsArr)
        }
        viewModel.errorCallback = { [weak self] errorMessage in
            print("error",errorMessage)
        }
        viewModel.successCallback = { [weak self] in
            self?.characterTableView.reloadData()
        }
    }
    
    



}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("loc sayısı",viewModel.locationItems.count)
        return viewModel.locationItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationCollectionViewCell.identifier, for: indexPath) as? LocationCollectionViewCell else {
            fatalError()
        }
        cell.cellItem = viewModel.locationItems[indexPath.row]
        print("cansu1",cell.cellItem.name)

        cell.setupItems()

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? LocationCollectionViewCell {
            if cell.isSelected {
                cell.contentView.backgroundColor = .primaryPurple
                
                cell.isSelected.toggle()
                print("bunu secti",cell.cellItem.residents.forEach({ char in
                    let components = char.components(separatedBy: "https://rickandmortyapi.com/api/character/")
                    print(components)
                    components.forEach { ids in
                        if ids != ""{
                            residentsArr.append(Int(ids)!)
                        }
                    }
                }))
            }
        }
        print("didselect arr",residentsArr)
        CharactersFromViewModel()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? LocationCollectionViewCell {
            cell.contentView.backgroundColor = .clear
        }
    }
    
    
    

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.singleCharacterItem.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as? CharacterTableViewCell else {
            fatalError()
        }
        cell.cellItem = viewModel.singleCharacterItem[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CharacterDetailViewController()
        if let cell = tableView.cellForRow(at: indexPath) as? CharacterTableViewCell {
            if cell.isSelected {
                vc.selectedCharacter = cell.cellItem
            }
        }
        print("secildik")
        
        self.presentVC(to: vc)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as? CharacterTableViewCell else {
            fatalError()
        }
    }
    
    

}
