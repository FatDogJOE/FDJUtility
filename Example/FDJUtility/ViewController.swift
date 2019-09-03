//
//  ViewController.swift
//  FDJUtility
//
//  Created by Joe on 07/25/2019.
//  Copyright (c) 2019 Joe. All rights reserved.
//

import UIKit
import SnapKit
import FDJUtility

class PresentVC : UIViewController {
    
    let button : UIButton
    let complectionHandler : FDJTaskCompletion
    
    init(completion: @escaping FDJTaskCompletion) {
        self.button = UIButton(type: .custom)
        self.complectionHandler = completion
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.button)
        self.button.snp.makeConstraints { (mk) in
            mk.center.equalTo(self.view)
            mk.size.equalTo(CGSize(width: 100, height: 50))
        }
        self.button.setTitle("Dismiss", for: .normal)
        self.button.setTitleColor(UIColor.blue, for: .normal)
        self.button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true) {
            self.complectionHandler([:])
        }
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let task1 : FDJTaskOperation = {[weak self] (complection, info)  in
            let vc = PresentVC(completion: complection)
            self?.present(vc, animated: true, completion: nil)
        }
        
        let task2 : FDJTaskOperation = {[weak self] (complection, info) in
            let vc = PresentVC(completion: complection)
            self?.present(vc, animated: true, completion: nil)
        }
        
        let task3 : FDJTaskOperation = {[weak self] (complection, info) in
            let vc = PresentVC(completion: complection)
            self?.present(vc, animated: true, completion: nil)
        }
        
        let task4 : FDJTaskOperation = {[weak self] (complection, info) in
            let vc = PresentVC(completion: complection)
            self?.present(vc, animated: true, completion: nil)
        }
        
        let task5 : FDJTaskOperation = {[weak self] (complection, info) in
            let vc = PresentVC(completion: complection)
            self?.present(vc, animated: true, completion: nil)
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            FDJSerialTaskManager.shared.add(task: task1)
            FDJSerialTaskManager.shared.add(task: task2)
            FDJSerialTaskManager.shared.add(task: task3)
            FDJSerialTaskManager.shared.add(task: task4)
            FDJSerialTaskManager.shared.add(task: task5)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

