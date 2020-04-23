//
//  FeedViewController.swift
//  Mendelugram
//
//  Created by Pacek on 20/04/2019.
//

import UIKit

class FeedViewController: UIViewController {

    var coordinator: FeedCoordinator?
    var viewModel: PhotosCollectionViewModeling!

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()

        viewModel.didUpdatePhotos = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.updatePhotos()
    }

}

private extension FeedViewController {

    func setup() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PhotoTableViewCell.nib, forCellReuseIdentifier: PhotoTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension FeedViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPhotos()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photo = viewModel.photo(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.identifier, for: indexPath) as! PhotoTableViewCell
        cell.configure(with: PhotoTableViewCell.Input(
            avatar: UIImage(avatarId: photo.author.avatarId),
            authorName: photo.author.name,
            locationName: photo.locationName,
            photo: UIImage(photoId: photo.photoId)
        ))
        return cell
    }

}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.select(photo: viewModel.photo(at: indexPath.row))
    }
}
