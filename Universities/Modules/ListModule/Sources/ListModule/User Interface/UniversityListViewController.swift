//
//  UniversityListViewController.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit
import Utils
import Common

// MARK: - PlayerListViewController
public final class UniversityListViewController: UIViewController, UniversityListViewable, PresentableListView {
    public var presenter: UniversityListPresenterProtocol?
    
    
    // MARK: - Properties
    @IBOutlet weak var UniversityTableView: UITableView!
    @IBOutlet weak var bottomActionButton: UIButton!
    
    private var barButtonItem: UIBarButtonItem!
    
    lazy public var loadingView = LoadingView.initToView(view)
    
    lazy public var emptyView: EmptyView = {
        let emptyView = EmptyView.initToView(view, infoText: "There aren't any Universities.")
        emptyView.delegate = self
        return emptyView
    }()
    
    // MARK: - View life cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
    // MARK: - Selectors
    @objc private func selectUniversities() {
        presenter?.selectUniversities()
    }

    
}

// MARK: - Configuration
extension UniversityListViewController: UniversityListViewConfigurable {
    public func configureTitle(_ title: String) {
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
    
    func setBottomActionButtonTitle(_ title: String) {
        bottomActionButton.setTitle(title, for: .normal)
    }
    
    func setBottomActionButtonState(isEnabled: Bool) {
        bottomActionButton.isEnabled = isEnabled
    }
    
    public func setupTableView() {
        UniversityTableView.tableFooterView = UIView()
    }
    
    public func setViewInteraction(_ enabled: Bool) {
        view.isUserInteractionEnabled = enabled
    }
}

// MARK: - Reload
extension UniversityListViewController: UniversityListViewReloadable {
    public func reloadData() {
        UniversityTableView.reloadData()
    }
    
    func reloadRow(_ row: Int) {
        let indexPath = IndexPath(row: row, section: 0)
        UniversityTableView.reloadRows(at: [indexPath], with: .none)
    }
}

// MARK: - EmptyViewable
extension UniversityListViewController: EmptyViewable {
    public func showEmptyView() {
        UniversityTableView.isHidden = true
        emptyView.isHidden = false
    }
    
    public func hideEmptyView() {
        UniversityTableView.isHidden = false
        emptyView.isHidden = true
    }
    
    public func retryAction() {
        presenter?.retry()
    }
}

// MARK: - UITableViewDelegate | UITableViewDataSource
extension UniversityListViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRows ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: UniversityTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UniversityTableViewCell") as? UniversityTableViewCell else {
            return UITableViewCell()
        }
        
        guard presenter != nil else { return UITableViewCell()}

        let index = indexPath.row
        let cellPresenter = presenter!.cellPresenter(at: index)
        let university = presenter!.university(at: index)
        
        cellPresenter.view = cell
        cellPresenter.configure(with: university)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectRow(at: indexPath.row)
    }
    
}

// MARK: - Loadable
extension UniversityListViewController: Loadable {}

// MARK: - Error Handler
extension UniversityListViewController: ErrorHandler {}

