/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import nativeNode from 'libnativerender.so'
import { NodeContent } from '@kit.ArkUI';

@Entry
@Component
struct EdgesPositionPage {
  // 初始化NodeContent对象。
  private rootSlot = new NodeContent();
  @State content: string = '';

  aboutToAppear(): void {
    nativeNode.createPositionEdgesNativeRoot(this.rootSlot, 'EdgesPosition')
  }

  build() {
    Column({space:5}) {
      Row() {
        Button('ReSetPosition').onClick(() => {
          nativeNode.reSetPositionEdges()
        }).key('EdgesPositionPage_ReSetPosition_Btn')
        Button('GetPosition').onClick(() => {
          this.content = nativeNode.getPositionEdges()
        }).key('EdgesPositionPage_GetPosition_Btn')
        Button('CopyPosition').onClick(() => {
          nativeNode.copyPositionEdges()
        }).key('EdgesPositionPage_CopyPosition_Btn')
      }

      Row() {
        Button('空指针').onClick(() => {
          nativeNode.setPositionEdgesIllegal_1()
        }).key('EdgesPositionPage_nullptr_Btn')
        Button('非Edges对象').onClick(() => {
          nativeNode.setPositionEdgesIllegal_2()
        }).key('EdgesPositionPage_notEdges_Btn')
        Button('空Edges对象').onClick(() => {
          nativeNode.setPositionEdgesIllegal_3()
        }).key('EdgesPositionPage_nullEdges_Btn')
      }

      Row() {
        Button('top').onClick(() => {
          nativeNode.setPositionEdges_top()
        }).key('EdgesPositionPage_top_Btn')
        Button('left').onClick(() => {
          nativeNode.setPositionEdges_left()
        }).key('EdgesPositionPage_left_Btn')
        Button('bottom').onClick(() => {
          nativeNode.setPositionEdges_bottom()
        }).key('EdgesPositionPage_bottom_Btn')
        Button('right').onClick(() => {
          nativeNode.setPositionEdges_right()
        }).key('EdgesPositionPage_right_Btn')
      }

      Row() {
        Button('负top').onClick(() => {
          nativeNode.setPositionEdges_top_negative()
        }).key('EdgesPositionPage_top_negative_Btn')
        Button('负left').onClick(() => {
          nativeNode.setPositionEdges_left_negative()
        }).key('EdgesPositionPage_left_negative_Btn')
        Button('负bottom').onClick(() => {
          nativeNode.setPositionEdges_bottom_negative()
        }).key('EdgesPositionPage_bottom_negative_Btn')
        Button('负right').onClick(() => {
          nativeNode.setPositionEdges_right_negative()
        }).key('EdgesPositionPage_right_negative_Btn')
      }

      Row() {
        Button('上&左').onClick(() => {
          nativeNode.setPositionEdges_top_left()
        }).key('EdgesPositionPage_top_left_Btn')
        Button('上&右').onClick(() => {
          nativeNode.setPositionEdges_top_right()
        }).key('EdgesPositionPage_top_right_Btn')
        Button('左&下').onClick(() => {
          nativeNode.setPositionEdges_left_bottom()
        }).key('EdgesPositionPage_left_bottom_Btn')
        Button('下&右').onClick(() => {
          nativeNode.setPositionEdges_bottom_right()
        }).key('EdgesPositionPage_bottom_right_Btn')
        Button('上&下').onClick(() => {
          nativeNode.setPositionEdges_top_bottom()
        }).key('EdgesPositionPage_top_bottom_Btn')
        Button('左&右').onClick(() => {
          nativeNode.setPositionEdges_left_right()
        }).key('EdgesPositionPage_left_right_Btn')
      }

      Row() {
        Button('上&左&下').onClick(() => {
          nativeNode.setPositionEdges_top_left_bottom()
        }).key('EdgesPositionPage_top_left_bottom_Btn')
        Button('上&左&右').onClick(() => {
          nativeNode.setPositionEdges_top_left_right()
        }).key('EdgesPositionPage_top_left_right_Btn')
        Button('上&下&右').onClick(() => {
          nativeNode.setPositionEdges_top_bottom_right()
        }).key('EdgesPositionPage_top_bottom_right_Btn')
        Button('左&下&右').onClick(() => {
          nativeNode.setPositionEdges_left_bottom_right()
        }).key('EdgesPositionPage_left_bottom_right_Btn')
      }

      Row() {
        Button('上&左&下&右').onClick(() => {
          nativeNode.setPositionEdges_top_left_bottom_right()
        }).key('EdgesPositionPage_top_left_bottom_right_Btn')
      }

      Text(this.content).key('EdgesPositionPage_position_content')

      Row() {
        ContentSlot(this.rootSlot)
      }.layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }
}
