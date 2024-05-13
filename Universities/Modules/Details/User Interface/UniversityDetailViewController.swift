//
//  UniversityDetailViewController.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit

// MARK: - PlayerDetailViewController
final class UniversityDetailViewController: UIViewController, UniversityDetailViewable {

    // MARK: - Properties
    @IBOutlet weak var universityDetailTableView: UITableView!
    
    var presenter: UniversityDetailPresenterProtocol!
    private var barButtonItem: UIBarButtonItem!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
}

// MARK: - Configuration
extension UniversityDetailViewController: UniversityDetailViewConfigurable {
    func configureTitle(_ title: String) {
        self.title = title
    }
    func setupBarButtonItem(title: String) {
        barButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(selectUniversities))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    func setBarButtonState(isEnabled: Bool) {
        barButtonItem.isEnabled = isEnabled
    }
    
    func setBarButtonTitle(_ title: String) {
        barButtonItem.title = title
    }
    
    // MARK: - Selectors
    @objc private func selectUniversities() {
        presenter?.selectUniversity()
    }
    
    
    func setViewInteraction(_ enabled: Bool) {
        view.isUserInteractionEnabled = enabled
    }
}
    
// MARK: - Reload
extension UniversityDetailViewController: UniversityDetailViewReloadable {
    func reloadData() {
        universityDetailTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource | UITableViewDelegate
extension UniversityDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityDetailTableViewCell") as? UniversityDetailTableViewCell else {
            return UITableViewCell()
        }
        
        let cellPresenter = UniversityDetailTableViewCellPresenter(view: cell)
        cellPresenter.configure(with: presenter.rowDetails(at: indexPath))

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        presenter.titleForHeaderInSection(section)
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        presenter.selectRow(at: indexPath)
//    }
}
