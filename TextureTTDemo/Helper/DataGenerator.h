//
//  DataGenerator.h
//  TextureTTDemo
//
//  Created by ByteDance on 28/11/22.
//

#import <Foundation/Foundation.h>
#import "LiveRoomModel.h"

@interface DataGenerator : NSObject

+ (NSArray<LiveRoomModel*>*)generateDummyLiveRoom;

+ (NSMutableArray<LiveRoomButtonModel*>*)generateDummyButtons;

+ (NSArray<LiveViewerModel*>*)generateDummyViewers;

+ (NSMutableArray<LiveRoomTagModel*>*)generateDummyTags;

+ (LiveHostModel*)generateDummyHostForIndex:(NSInteger)index;

@end
