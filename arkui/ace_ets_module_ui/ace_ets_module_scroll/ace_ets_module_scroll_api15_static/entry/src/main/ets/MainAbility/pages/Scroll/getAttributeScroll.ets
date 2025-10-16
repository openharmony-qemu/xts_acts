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
  Column,
  Component,
  Color,
  Text,
  LengthMetrics,
  Scroller,
  NodeContainer,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  FontWeight,
  Button,
  ButtonType,
  ClickEvent
} from '@ohos.arkui.component'
import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';
import { UIContext } from '@ohos.arkui.UIContext';
import { State } from '@ohos.arkui.stateManagement'

class MyNodeController extends NodeController {
  public scroller: Scroller = new Scroller()

  makeNode(uiContext: UIContext): FrameNode | null {
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    return null
  }
}

@Entry
@Component
struct ScrollAttribute1 {
  private myNodeController: MyNodeController = new MyNodeController();
  scroller: Scroller = new Scroller();
  @State num1: number = 0

  build() {
    Column() {
      Button('clickTypeNode')
        .id('scroll_get_click')
        .onClick((e: ClickEvent) => {
          const node = this.getUIContext().getFrameNodeById('typeNode_scroll');
          console.info('isModifiable:' + node?.isModifiable());
          if (node) {
            console.info('ScrollAttribute1 TypeNode is exist')
            
            
            
            
            
            
            
            console.info('bindController TypeNode is exist:new Scroller')

          } else {
            console.info('ScrollAttribute1 TypeNode is null')
          }
        })

      Button('clickTypeNode')
        .id('scroll_bind_click')
        .onClick((e: ClickEvent) => {
          const node = this.getUIContext().getFrameNodeById('typeNode_scroll');
          console.info('isModifiable:' + node?.isModifiable());
          if (node) {
            console.info('bindController TypeNode is exist:new Scroller')
            try {
              
              this.scroller.fling(-1000)
              console.info('bindController TypeNode currentOffset:' + this.scroller.currentOffset()!.yOffset)
            } catch (e) {
              console.error('TypeNode error:' + e)
            }

          } else {
            console.info('ScrollAttribute1 TypeNode is null')
          }
        })

      Text('ScrollFling: ' + this.num1)
        .id('scroll_fling_text')
        .onClick((e: ClickEvent) => {
          this.num1 = Math.round(this.scroller.currentOffset()!.yOffset)
        })
      NodeContainer(this.myNodeController)

    }
    
    .width('100%')
    .height('100%')
  }
}
