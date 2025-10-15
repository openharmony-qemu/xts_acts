/**
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
import {
  Entry,
  Component,
  Scroller,
  Column,
  GridLayoutOptions,
  ColumnOptions,
  NodeContainer,
  Text,
  Grid,
  HorizontalAlign,
  ForEach,
  GridItem,
  GridItemStyle,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from "@ohos.arkui.UIContext";
import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';

let scroller: Scroller = new Scroller()
let layoutOptions1: GridLayoutOptions = {
  regularSize: [1, 1],
  irregularIndexes: [0, 8],
  onGetIrregularSizeByIndex: (index: int) => {
    if (index === 0) {
      return [1, 5] as [int, int]
    }
    return [1, index % 6 + 1] as [int, int]
  },
  onGetRectByIndex: (index: int) => {
    if (index == 0) {
      return [0, 0, 1, 1] as [int, int, int, int]
    } else if (index == 1) {
      return [0, 1, 2, 2] as [int, int, int, int]
    } else if (index == 2) {
      return [0, 3, 3, 3] as [int, int, int, int]
    } else if (index == 3) {
      return [3, 0, 3, 3] as [int, int, int, int]
    } else if (index == 4) {
      return [4, 3, 2, 2] as [int, int, int, int]
    } else {
      return [5, 5, 1, 1] as [int, int, int, int]
    }
  }
} as GridLayoutOptions

class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    
    

    
    
    

    
    
    
    
    
    
    
    for (let a = 0; a < 25; a++) {
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    }

    
    
    
    return node
  }
}

@Entry
@Component
struct grid {
  @State numberIndex: number = 0;
  @State number1: String[] = ['0', '1', '2', '3', '4']
  private myNodeController: MyNodeController = new MyNodeController()

  build() {
    Column({ space: 10 } as ColumnOptions) {
      NodeContainer(this.myNodeController)
      Text('origin')
      Grid(scroller, layoutOptions1) {
        ForEach(this.number1, (day: string, index: int) => {
          ForEach(this.number1, (day: string, index: int) => {
            GridItem({ style: GridItemStyle.NONE }) {
              Text(day)
                .fontSize(16)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
                .focusable(true)
                .key(index + '1')
            }.backgroundColor(0xF9CF93)
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(4)
      .rowsGap(4)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height(300)
      .padding('4vp')
    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}