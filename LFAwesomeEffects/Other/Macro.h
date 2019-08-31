//
//  Macro.h
//  LFAwesomeEffects
//
//  Created by chunf on 2019/8/28.
//  Copyright © 2019 chunf. All rights reserved.
//

#ifndef Macro_h
#define Macro_h


#define screenW ([UIScreen mainScreen].bounds.size.width)
#define screenH ([UIScreen mainScreen].bounds.size.height)

#define statusBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define navBarHeight 44.0
#define topHeight (statusBarHeight + navBarHeight)
#define tabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height > 20 ? 83.0f : 49.0f)

#endif /* Macro_h */
