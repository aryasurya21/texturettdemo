//
//  LiveHostModel.h
//  TextureTTDemo
//
//  Created by ByteDance on 28/11/22.
//

#import <Foundation/Foundation.h>

@interface LiveHostModel : NSObject

@property (nonatomic, copy) NSString* hostAvatarURL;
@property (nonatomic, copy) NSString* hostName;
@property (nonatomic, copy) NSString* currentRoomLike;
@property (nonatomic, assign) BOOL isFollowHost;

@end
