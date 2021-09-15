//
//  ViewController.swift
//  ShareExtension
//
//  Created by Sohel Rana on 15/9/21.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIDocumentInteractionControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var webView: WKWebView!
    let link = "https://github.com/soheltanvir0699"
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: link)!))
        imgView.image = UIImage(named: "messi")
    }


    @IBAction func shareWebLink(_ sender: Any) {
        let activityController = UIActivityViewController(activityItems: [link], applicationActivities: nil)
        activityController.completionWithItemsHandler = {(nil, completed, _, error) in
            if completed {
                print("completed")
            }else {
                print("cancled")
            }
            
        }
        present(activityController, animated: true, completion: nil)
    }
    @IBAction func shareImg(_ sender: Any) {
        
        guard let image = UIImage(named: "messi") else {
            return
        }
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.completionWithItemsHandler = { (nil, completed, _, error) in
            if completed {
                print("completed")
            }else {
                print("cancled")
            }
        }
        present(activityController, animated: true, completion: nil)
    }
    @IBAction func sharePdf(_ sender: Any) {
        guard let pdf = Bundle.main.url(forResource: "linalg_notes", withExtension: "pdf") else {
            return
        }
        
        let controller = UIDocumentInteractionController(url: pdf)
        controller.delegate = self
        controller.presentPreview(animated: true)
        
    }
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
}

