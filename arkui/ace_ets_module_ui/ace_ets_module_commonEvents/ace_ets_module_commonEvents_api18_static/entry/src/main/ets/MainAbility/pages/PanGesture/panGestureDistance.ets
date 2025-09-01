/*
 *  Copyright (c) 2025 Huawei Device Co., Ltd.
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */
import {
  Alignment,
  BaseGestureEvent,
  Color,
  Column,
  Component,
  Entry,
  GestureEvent,
  GestureModifier,
  GestureRecognizer,
  PanRecognizer,
  Row,
  TapGestureHandler,
  Text,
  UIGestureEvent
} from '@ohos.arkui.component';
import { AppStorage, Link, Prop, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

class MyButtonModifier implements GestureModifier {
  supportDoubleTap: boolean = true

  applyGesture(event: UIGestureEvent): void {
    if (this.supportDoubleTap) {


    } else {


    }
  }
}

@Entry
@Component
struct distance {
  @State getDis: number | null = null
  @State getDis1: number | null = null
  @State getmap: string = ""
  @State modifier: MyButtonModifier = new MyButtonModifier()

  build() {
    Column() {

      Column() {
        Text("distance:" + this.getDis).key('distance')
        Text("distance1:" + this.getDis1).key('distance1')
        Text("map:" + this.getmap).key('map')
        Text("map:" + this.getmap).key('modifierMap')
      }

      Row()
        .id('getDistance')
        .width("50%")
        .height("25%")
        .borderWidth(3)
        .backgroundColor(Color.Yellow)


      Row()
        .id('modifierGetDistance')
        .width("50%")
        .height("25%")
        .borderWidth(3)
        .backgroundColor(Color.Blue)


        .gestureModifier(this.modifier)
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Center)
  }
}
