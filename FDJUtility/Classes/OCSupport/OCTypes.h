//
//  OCTypes.h
//  Pods
//
//  Created by mac on 2019/9/3.
//

#ifndef OCTypes_h
#define OCTypes_h

typedef void(^TaskOCCompletion)(NSDictionary<NSString *, id> * info, BOOL shouldCancelOddTasks);
typedef void(^TaskOCOperation)(TaskOCCompletion completion, NSDictionary<NSString *, id> * info);

#endif /* OCTypes_h */
