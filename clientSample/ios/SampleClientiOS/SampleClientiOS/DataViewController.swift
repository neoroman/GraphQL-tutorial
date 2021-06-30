//
//  DataViewController.swift
//  SampleClientiOS
//
//  Created by 민성홍 on 2021/06/30.
//

import UIKit

class DataViewController: UIViewController {

    var jsonDict: [ String : Any ] = [:] {
        didSet {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: jsonDict, options: [.prettyPrinted])
                if let aString = String(data: jsonData, encoding: .utf8) {
                    let setColor = NSAttributedString(string: aString)
                    self.dataText.attributedText = setColor
                }
            }
            catch {
                print("Something wrong...!")
            }
        }
    }
    @IBOutlet weak var dataText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension DataViewController {
    func setupUI() {
        Network.shared.apollo.fetch(query: GetUserInfoQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let userInfo = graphQLResult.data?.getUserInfo,
                   let data = userInfo[0] {
//                    self.dataText.text = "\(data)"
                    self.jsonDict = data.resultMap.jsonObject
                }

            case .failure(let error):
                self.showErrorAlert(title: "Network Error",
                                    message: error.localizedDescription)
            }
        }
    }
}

extension DataViewController {
    func showErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
