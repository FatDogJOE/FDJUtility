//
//  FDJTaskManager.swift
//  FDJUtility
//
//  Created by mac on 2019/8/30.
//

import UIKit

public typealias FDJTaskCompletion = ([String:Any], Bool)->Void
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
            
            let complection : FDJTaskCompletion = { (completionInfo, shouldCancelOddTasks) in
                
                if shouldCancelOddTasks {
                    self.clear()
                }
                
                self.performNext(info: completionInfo)
                
            }
            
            task(complection, info)
        } else {
            self.currentTask = nil
        }
        
        objc_sync_exit(waitingTasks)
        
    }
    
    private func performNext(info:[String:Any]) {
        
        (self.queue ?? DispatchQueue.main).async {
            self.next(info: info)
        }
        
    }

    public func add(task:@escaping FDJTaskOperation) {
        
        let shouldPerformNext = (waitingTasks.count == 0 && self.currentTask == nil)
        
        objc_sync_enter(waitingTasks)
        
        waitingTasks.append(task)
        
        objc_sync_exit(waitingTasks)
        
        if shouldPerformNext {
            
            self.performNext(info: [:])
            
        }
    }
    
    public func batchAdd(tasks:[FDJTaskOperation]) {
        
        let shouldPerformNext = (waitingTasks.count == 0 && self.currentTask == nil)
        
        objc_sync_enter(waitingTasks)
        
        waitingTasks.append(contentsOf: tasks)
        
        objc_sync_exit(waitingTasks)
        
        if shouldPerformNext {
            
            self.performNext(info: [:])
            
        }
        
    }
    
    public func insert(task:@escaping FDJTaskOperation) {
        
        let shouldPerformNext = (waitingTasks.count == 0 && self.currentTask == nil)
        
        objc_sync_enter(waitingTasks)
        
        waitingTasks.insert(task, at: 0)
        
        objc_sync_exit(waitingTasks)
        
        if shouldPerformNext {
            
            self.performNext(info: [:])
            
        }
        
    }
    
    public func batchInsert(tasks:[FDJTaskOperation]) {
        
        let shouldPerformNext = (waitingTasks.count == 0 && self.currentTask == nil)
        
        objc_sync_enter(waitingTasks)
        
        waitingTasks.insert(contentsOf: tasks, at: 0)
        
        objc_sync_exit(waitingTasks)
        
        if shouldPerformNext {
            
            self.performNext(info: [:])
            
        }
        
    }
    
    public func clear() {
        
        objc_sync_enter(waitingTasks)
        
        waitingTasks.removeAll()
        
        objc_sync_exit(waitingTasks)
        
    }
    
}

extension FDJSerialTaskManager {
    
    @objc public func OC_BatchAdd(tasks:[Any]) {
        
        if let opTasks = (tasks as? [FDJTaskOperation]) {
            self.batchAdd(tasks: opTasks)
        }
        
    }
    
    @objc public func OC_BatchInsert(tasks:[Any]) {
        if let opTasks = (tasks as? [FDJTaskOperation]) {
            self.batchInsert(tasks: opTasks)
        }
    }
    
    @objc public func OC_Insert(task:@escaping FDJTaskOperation) {
        self.insert(task: task)
    }
    
    @objc public func OC_Add(task:@escaping FDJTaskOperation) {
        self.add(task: task)
    }
    
}

