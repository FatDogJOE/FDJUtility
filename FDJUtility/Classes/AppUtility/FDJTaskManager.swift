//
//  FDJTaskManager.swift
//  FDJUtility
//
//  Created by mac on 2019/8/30.
//

import UIKit

public typealias FDJTaskCompletion = ([String:Any]?, Bool)->Void
public typealias FDJTaskOperation = (@escaping FDJTaskCompletion, [String:Any]?)->Void

public class FDJSerialTask {
    
    public let operation : FDJTaskOperation
    
    public init(operation:@escaping FDJTaskOperation) {
        self.operation = operation
    }
    
    public func execute(info:[String:Any]?, completion:@escaping FDJTaskCompletion) {
        self.operation(completion, info)
    }
    
}

public class FDJSerialTaskQueue {
    
    public static let shared : FDJSerialTaskQueue = { return FDJSerialTaskQueue() }()
    
    var queue : DispatchQueue?
    var currentTask : FDJSerialTask?
    
    private var waitingTasks : [FDJSerialTask] = []
    
    
    private func next(info:[String:Any]?) {
        
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
            
            task.execute(info: info, completion: complection)
        } else {
            self.currentTask = nil
        }
        
        objc_sync_exit(waitingTasks)
        
    }
    
    private func performNext(info:[String:Any]?) {
        
        (self.queue ?? DispatchQueue.main).async {
            self.next(info: info)
        }
        
    }

    public func add(task:FDJSerialTask) {
        
        let shouldPerformNext = (waitingTasks.count == 0 && self.currentTask == nil)
        
        objc_sync_enter(waitingTasks)
        
        waitingTasks.append(task)
        
        objc_sync_exit(waitingTasks)
        
        if shouldPerformNext {
            
            self.performNext(info: [:])
            
        }
    }
    
    public func batchAdd(tasks:[FDJSerialTask]) {
        
        let shouldPerformNext = (waitingTasks.count == 0 && self.currentTask == nil)
        
        objc_sync_enter(waitingTasks)
        
        waitingTasks.append(contentsOf: tasks)
        
        objc_sync_exit(waitingTasks)
        
        if shouldPerformNext {
            
            self.performNext(info: [:])
            
        }
        
    }
    
    public func insert(task:FDJSerialTask) {
        
        let shouldPerformNext = (waitingTasks.count == 0 && self.currentTask == nil)
        
        objc_sync_enter(waitingTasks)
        
        waitingTasks.insert(task, at: 0)
        
        objc_sync_exit(waitingTasks)
        
        if shouldPerformNext {
            
            self.performNext(info: [:])
            
        }
        
    }
    
    public func batchInsert(tasks:[FDJSerialTask]) {
        
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

