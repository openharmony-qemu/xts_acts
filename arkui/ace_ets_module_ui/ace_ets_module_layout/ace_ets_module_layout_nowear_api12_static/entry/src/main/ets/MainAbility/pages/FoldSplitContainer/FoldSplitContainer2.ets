'use static';

/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Entry,
  Column,
  Component,
  Text,
  Color,
  FlexAlign,
  FontWeight,
  TextAlign,
  SafeAreaType,
  SafeAreaEdge
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import {
  FoldSplitContainer,
  PresetSplitRatio,
  ExtraRegionPosition,
  ExpandedRegionLayoutOptions,
  HoverModeRegionLayoutOptions,
  FoldedRegionLayoutOptions,
  HoverModeStatus,
  OnHoverStatusChangeHandler
} from '@ohos.arkui.advanced.FoldSplitContainer'

@Entry
@Component
struct FoldSplitContainer2 {
  expandedRegionLayoutOptions: ExpandedRegionLayoutOptions = {
    horizontalSplitRatio: PresetSplitRatio.LAYOUT_1V1,
    verticalSplitRatio: PresetSplitRatio.LAYOUT_2V3,
    isExtraRegionPerpendicular: false,
    extraRegionPosition: ExtraRegionPosition.BOTTOM
  };
  hoverModeLayoutOptions: HoverModeRegionLayoutOptions = {
    horizontalSplitRatio: PresetSplitRatio.LAYOUT_1V1,
    showExtraRegion: true,
    extraRegionPosition: ExtraRegionPosition.BOTTOM
  };
  foldedLayoutOptions: FoldedRegionLayoutOptions = {
    verticalSplitRatio: PresetSplitRatio.LAYOUT_2V3
  };
  @State hoverStatusStr: string = '';

  @Builder
  primaryRegion() {
    Column() {
      Text('primary region')
        .width('100%')
        .height(50)
        .textAlign(TextAlign.Center)
        .fontSize(16)
        .fontColor(Color.White)
    }.backgroundColor(Color.Orange).width('100%').height('80%')
  }

  @Builder
  secondaryRegion() {
    Column() {
      Text('secondary region')
        .width('100%')
        .height(50)
        .textAlign(TextAlign.Center)
        .fontSize(16)
        .fontColor(Color.White)
    }.backgroundColor(Color.Pink).width('100%').height('80%')
  }

  @Builder
  extraRegion() {
    Column() {
      Text('extra region')
        .width('100%')
        .height(50)
        .textAlign(TextAlign.Center)
        .fontSize(16)
        .fontColor(Color.White)
    }.backgroundColor(Color.Gray).width('100%').height('80%')
  }

  build() {
    Column() {
      FoldSplitContainer({
        primary: () => {
          this.primaryRegion()
        },
        secondary: () => {
          this.secondaryRegion()
        },
        extra: () => {
          this.extraRegion()
        },
        expandedLayoutOptions: this.expandedRegionLayoutOptions,
        hoverModeLayoutOptions: this.hoverModeLayoutOptions,
        foldedLayoutOptions: this.foldedLayoutOptions,
        onHoverStatusChange: (status: HoverModeStatus): void => {
          this.hoverStatusStr = 'hoverStatus:' + status;
          console.info('FoldSplitContainerTest2 onHoverStatusChange:' + status);
        }
      })
        .id('FoldSplitContainerTest2_FoldSplitContainer')
        .width('100%')
        .height('80%')

      Text(this.hoverStatusStr)
        .id('FoldSplitContainerTest2_hoverStatus')
        .fontSize(14)
        .margin({ top: 10 })
    }
    .width('100%')
    .height('80%')
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
  }
}
