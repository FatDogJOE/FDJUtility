//
//  FDJTaskManager.swift
//  FDJUtility
//
//  Created by mac on 2019/8/30.
//

import UIKit

public typealias FDJTaskCompletion = ([String:Any])->Void
public typealias FDJTaskOperation = (@escaping FDJTaskCompletion, [String:Any])->Void

public class FDJSerialTaskManager: NSObject {
    
    @objc public static let shared : FDJSerialTaskManager = { return FDJSerialTaskManager() }()
    
    var queue : DispatchQueue?
    var currentTask : FDJTaskOperation?
    
    private var waitingTasks : [FDJTaskOperation] = []
    
    
    private func next(info:[String:Any]) {
        
        objc_sync_enter(waitingTasks)
        
        if let task = waitingTasks.first {
            
            self.currentTask = task
            
            _ = self.waitingTasks.removeFirst()
            
            let complection : FDJTaskCompletion = { (completionInfo) in
                
                if let workQueue = self.queue {
                    workQueue.async {
                        self.next(info: completionInfo)
                    }
                }else {
                    DispatchQueue.main.async {
                        self.next(info: completionInfo)
                    }
                }
                
            }
            
            task(complection, info)
        } else {
            self.currentTask = nil
        }
        
        objc_sync_exit(waitingTasks)
        
    }

    @objc public func add(task:@escaping FDJTaskOperation) {
        
        let shouldPerformNext = (waitingTasks.count == 0 && self.currentTask == nil)
        
        objc_sync_enter(waitingTasks)
        
        waitingTasks.append(task)
        
        objc_sync_exit(waitingTasks)
        
        if shouldPerformNext {
            
            if let workQueue = self.queue {
                workQueue.async {
                    self.next(info: [:])
                }
            }else {
                DispatchQueue.main.async {
                    self.next(info: [:])
                }
            }
            
        }
    }
    
    @objc public func insert(task:@escaping FDJTaskOperation) {
        
        let shouldPerformNext = (waitingTasks.count == 0 && self.currentTask == nil)
        
        objc_sync_enter(waitingTasks)
        
        waitingTasks.insert(task, at: 0)
        
        objc_sync_exit(waitingTasks)
        
        if shouldPerformNext {
            
            if let workQueue = self.queue {
                workQueue.async {
                    self.next(info: [:])
                }
            }else {
                DispatchQueue.main.async {
                    self.next(info: [:])
                }
            }
            
        }
        
    }
    
    @objc public func clear() {
        
        objc_sync_enter(waitingTasks)
        
        waitingTasks.removeAll()
        
        objc_sync_exit(waitingTasks)
        
    }
    
}

