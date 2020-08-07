//
//  DetailViewController.swift
//  Project9
//
//  Created by Helton Isac Torres Galindo on 25/07/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let detailItem = detailItem else {return}
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
        body {
            font-size: 150%;
        }
        #div {
            padding:20;
            background:#8FC332;
        }
        </style>
        </head>
        <body>
        <div id="div"><center><b>\(detailItem.title)</b></center></div>
        \(detailItem.body)
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
        
    }
}
