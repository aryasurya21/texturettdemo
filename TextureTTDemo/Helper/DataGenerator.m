//
//  DataGenerator.m
//  TextureTTDemo
//
//  Created by ByteDance on 28/11/22.
//

#import <Foundation/Foundation.h>
#import "DataGenerator.h"

@implementation DataGenerator

+ (NSArray<LiveRoomModel *> *)generateDummyLiveRoom {
    LiveRoomModel *firstRoom = [[LiveRoomModel alloc] init];
    firstRoom.hostData = [DataGenerator generateDummyHostForIndex:0];
    NSString *firstVideoPath = [[NSBundle mainBundle] pathForResource:@"video1" ofType:@"mp4"];
    firstRoom.contentURL = [NSURL fileURLWithPath:firstVideoPath];
    firstRoom.buttons = [DataGenerator generateDummyButtons];
    firstRoom.roomTags = [DataGenerator generateDummyTags];
    firstRoom.viewerData = [DataGenerator generateDummyViewers];
    
    LiveRoomModel *secondRoom = [[LiveRoomModel alloc] init];
    secondRoom.hostData = [DataGenerator generateDummyHostForIndex:1];
    NSString *secondVideoPath = [[NSBundle mainBundle] pathForResource:@"video2" ofType:@"mp4"];
    secondRoom.contentURL = [NSURL fileURLWithPath:secondVideoPath];
    secondRoom.buttons = [DataGenerator generateDummyButtons];
    secondRoom.roomTags = [DataGenerator generateDummyTags];
    secondRoom.viewerData = [DataGenerator generateDummyViewers];
    
    [secondRoom.buttons removeObjectAtIndex:0];
    [secondRoom.roomTags removeObjectAtIndex:0];
    
    return @[firstRoom, secondRoom];
}

+ (LiveHostModel *)generateDummyHostForIndex:(NSInteger)index {
    LiveHostModel *host = [[LiveHostModel alloc] init];
    if(index == 0){
        host.hostName = @"Tiktok Shop1";
        host.hostAvatarURL = @"host_tiktok";
    } else {
        host.hostName = @"Douyin Shop1";
        host.hostAvatarURL = @"host_douyin";
    }
    host.currentRoomLike = @"50 likes";
    host.isFollowHost = index == 0;
    return host;
}

+ (NSMutableArray<LiveRoomTagModel *> *)generateDummyTags {
    LiveRoomTagModel *firstTag = [[LiveRoomTagModel alloc] init];
    firstTag.tagTitle = @"Shopping Ranking";
    firstTag.tagIconURL = @"tag_badge";
    
    LiveRoomTagModel *secondTag = [[LiveRoomTagModel alloc] init];
    secondTag.tagTitle = @"Rising Stars";
    secondTag.tagIconURL = @"tag_star";
    
    return [@[firstTag, secondTag] mutableCopy];
}

+ (NSMutableArray<LiveRoomButtonModel *> *)generateDummyButtons {
    LiveRoomButtonModel *shopButton = [[LiveRoomButtonModel alloc] init];
    shopButton.buttonTitle = @"Shop";
    shopButton.buttonIconURL = @"button_shop";
    shopButton.accessory = 17;
    
    LiveRoomButtonModel *collabButton = [[LiveRoomButtonModel alloc] init];
    collabButton.buttonTitle = @"Multi-guest";
    collabButton.buttonIconURL = @"button_teamwork";
    
    LiveRoomButtonModel *roseButton = [[LiveRoomButtonModel alloc] init];
    roseButton.buttonTitle = @"Rose";
    roseButton.buttonIconURL = @"button_rose";
    
    LiveRoomButtonModel *giftButton = [[LiveRoomButtonModel alloc] init];
    shopButton.buttonTitle = @"Gift";
    shopButton.buttonIconURL = @"button_gift";
    
    LiveRoomButtonModel *shareButton = [[LiveRoomButtonModel alloc] init];
    shareButton.buttonTitle = @"Shop";
    shareButton.buttonIconURL = @"button_share";
    
    return [@[shopButton, collabButton, roseButton, giftButton, shareButton] mutableCopy];
}

+ (NSArray<LiveViewerModel *> *)generateDummyViewers {
    LiveViewerModel *viewer = [[LiveViewerModel alloc] init];
    viewer.viewerAvatarURL = @"viewer";
    
    return @[viewer];
}

@end
