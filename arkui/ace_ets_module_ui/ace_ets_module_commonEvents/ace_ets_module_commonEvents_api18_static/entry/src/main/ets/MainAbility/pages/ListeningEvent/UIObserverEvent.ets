'use static';
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
  Column,
  Text,
  ForEach,
  Scroller,
  ScrollDirection,
  Color,
  Scroll,
  Margin,
  Edge,
  Row,
  TextAlign,
  BarState,
  ColumnOptions,
  Button,
  ClickEvent,
  GestureEvent,
  TapGesture
} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';
@Entry
@Component
struct click {
  @State cancel:string | undefined = ''
  @State observerEvent:string | undefined = ''
  @State observerGestureEvent:string | undefined = ''
  callBack1(event: ClickEvent, node?: FrameNode) {
    console.log("willClick-click,event:"+JSON.stringify(event))
    console.log("willClick-click,node:"+node?.getId())
    this.cancel = node?.getId()
    this.observerEvent = node?.getId()
    this.observerGestureEvent = node?.getId()
  }

  callBack2(event: GestureEvent, node?: FrameNode) {
    console.log("willClick-tap,event:"+JSON.stringify(event))
    console.log("willClick-tap,node:"+node?.getId())
    this.cancel = node?.getId()
    this.observerEvent = node?.getId()
    this.observerGestureEvent = node?.getId()
  }

  callBack3(event: ClickEvent, node?: FrameNode){
    console.log("didClick-click,event:"+JSON.stringify(event))
    console.log("didClick-click,node:"+node?.getId())
    this.cancel = node?.getId()
    this.observerEvent = node?.getId()
    this.observerGestureEvent = node?.getId()
  }

  callBack4(event: GestureEvent, node?: FrameNode){
    console.log("didClick-tap,event:"+JSON.stringify(event))
    console.log("didClick-tap,node:"+node?.getId())
    this.cancel = node?.getId()
    this.observerEvent = node?.getId()
    this.observerGestureEvent = node?.getId()
  }

  aboutToAppear(): void {
    let observer = this.getUIContext().getUIObserver();
    observer.on('willClick', this.callBack1)
    observer.on('willClick', this.callBack2)
    observer.on('didClick', this.callBack3)
    observer.on('didClick',this.callBack4)
  }
  build() {
    Column({space:20} as ColumnOptions){
      Row(){
        Text(this.cancel).id('cancel1')
        Text(this.observerEvent).id('observerEvent')
        Text(this.observerGestureEvent).id('observerGestureEvent')
      }
      Button("tap")
        .id("tap")
        .width('25%')
          .height('25%')
        .gesture(TapGesture().onAction(()=>{
          console.log("tap")
        }))
      Text("tap123456")
        .gesture(TapGesture().onAction(()=>{
          console.log("tap")
        }))
      Button("click")
        .id("click")
        .width('25%')
          .height('25%')
        .onClick((e: ClickEvent)=>{
          console.log("click")
        })

      Button("取消监听").onClick((e: ClickEvent)=>{
        let observer = this.getUIContext().getUIObserver();
        observer.off('willClick', this.callBack1)
        observer.off('willClick', this.callBack2)
        observer.off('didClick', this.callBack3)
        observer.off('didClick',this.callBack4)
      }).id("cancel")
    }.margin({left: '15%'} as Margin)
  }
}