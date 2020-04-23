//
//  GridViewController.swift
//  Mendelugram
//
//  Created by Pacek on 20/04/2019.
//

import UIKit

class GridViewController: UIViewController {

    var coordinator: GridCoordinator?
    var viewModel: PhotosCollectionViewModeling!

    @IBOutlet private weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()

        viewModel.didUpdatePhotos = { [weak self] in
            self?.collectionView.reloadData()
        }
        viewModel.updatePhotos()
    }

}

private extension GridViewController {

    func setup() {
        let photosPerRow = 3
        let side = (Int(UIScreen.main.bounds.width) / photosPerRow) - 1
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: side, height: side)
            layout.minimumLineSpacing = 1
            layout.minimumInteritemSpacing = 1
        }

        collectionView.register(PhotoCollectionViewCell.nib, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension GridViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfPhotos()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photo = viewModel.photo(at: indexPath.item)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        cell.configure(with: PhotoCollectionViewCell.Input(
            photo: UIImage(photoId: photo.photoId)
        ))
        return cell
    }

}

extension GridViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.select(photo: viewModel.photo(at: indexPath.row))
    }
}
