//
//  ListOfMovieView.swift
//  Movies
//
//  Created by Akel Barbosa on 18/03/23.
//

import Foundation
import UIKit
 
class ListOfMovieView: UIViewController {
    var presenter: ListOfMoviePresentable
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.estimatedRowHeight = UITableView.automaticDimension
        table.rowHeight = 200
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(MovieCellView.self, forCellReuseIdentifier: MovieCellView.identifer)
        return table
    }()

    init(presenter: ListOfMoviePresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupTableView()
        presenter.onViewAppear()
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.frame
    }
    
    private func setupTableView() {
        tableView.dataSource = self

    }
    
}

extension ListOfMovieView: ListOfMovieUI {
    func update(movies: [ListOfMovieViewModel]) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}

extension ListOfMovieView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCellView.identifer, for: indexPath) as? MovieCellView else {return UITableViewCell()}

        cell.configure(with: presenter.viewModels[indexPath.row])
        return cell
    }
    
}
