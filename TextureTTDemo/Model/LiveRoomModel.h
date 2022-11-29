//
//  LiveRoomModel.h
//  TextureTTDemo
//
//  Created by ByteDance on 28/11/22.
//

#import "LiveHostModel.h"
#import "LiveViewerModel.h"
#import "LiveRoomTagModel.h"
#import "LiveRoomButtonModel.h"

@interface LiveRoomModel : NSObject

@property (nonatomic, strong) LiveHostModel *hostData;
@property (nonatomic, strong) NSURL* contentURL;
@property (nonatomic, strong) NSMutableArray<LiveRoomTagModel*> *roomTags;
@property (nonatomic, strong) NSArray<LiveViewerModel*> *viewerData;
@property (nonatomic, strong) NSMutableArray<LiveRoomButtonModel*> *buttons;

@end

