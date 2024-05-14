//
//  UniversityDetailViewController.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit
import Common

// MARK: - PlayerDetailViewController
public final class UniversityDetailViewController: UIViewController, UniversityDetailViewable {


    // MARK: - Properties
    @IBOutlet weak var universityDetailTableView: UITableView!
    
    public var presenter: UniversityDetailPresenterProtocol!
    private var barButtonItem: UIBarButtonItem!
    
    // MARK: - View life cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
}

// MARK: - Configuration
extension UniversityDetailViewController: UniversityDetailViewConfigurable {
    public func configureTitle(_ title: String) {
        self.title = title
    }
    public func setupBarButtonItem(title: String) {
        barButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(selectUniversities))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    public func setBarButtonState(isEnabled: Bool) {
        barButtonItem.isEnabled = isEnabled
    }
    
    public func setBarButtonTitle(_ title: String) {
        barButtonItem.title = title
    }
    
    // MARK: - Selectors
    @objc private func selectUniversities() {
        presenter?.selectUniversity()
    }
    
    
    public func setViewInteraction(_ enabled: Bool) {
        view.isUserInteractionEnabled = enabled
    }
}
    
// MARK: - Reload
extension UniversityDetailViewController: UniversityDetailViewReloadable {
    public func reloadData() {
        universityDetailTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource | UITableViewDelegate
extension UniversityDetailViewController: UITableViewDataSource, UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSections
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection(section)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityDetailTableViewCell") as? UniversityDetailTableViewCell else {
            return UITableViewCell()
        }
        
        let cellPresenter = UniversityDetailTableViewCellPresenter(view: cell)
        cellPresenter.configure(with: presenter.rowDetails(at: indexPath))

        return cell
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        presenter.titleForHeaderInSection(section)
    }

}
