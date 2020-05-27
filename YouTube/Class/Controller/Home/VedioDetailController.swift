//
//  VedioDetailController.swift
//  YouTube
//
//  Created by Turbo on 2020/5/26.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class VedioDetailController: BaseViewController {
    
    var vedioId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Article Detail"
        self.setLeftImageNamed(name: "back", action: #selector(self.popBackController))
        
        if (!vedioId!.isEmpty) {
            print("vedioId-------> %@", vedioId!)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
