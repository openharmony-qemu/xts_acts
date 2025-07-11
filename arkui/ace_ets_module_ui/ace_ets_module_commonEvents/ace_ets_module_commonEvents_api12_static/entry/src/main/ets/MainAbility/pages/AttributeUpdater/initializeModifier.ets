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
import {
  Entry,
  Component,
  Column,
  Row,
  Text,
  ColumnOptions,
  TouchType,
  CustomBuilder,
  DragItemInfo,
  Color,
  Button,
  TouchEvent,
  Margin,
  Scroll,
  GestureEvent,
  LongPressGesture,
  TapGesture,
  ClickEvent,
  FlexAlign,
  ButtonAttribute
} from '@ohos.arkui.component'
import { State, AppStorage, LocalStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
//import { AttributeUpdater } from '@ohos.arkui.modifier'

let para: Record<string, string> = { 'initializeModifierFlag': 'start' };
// let storage: LocalStorage = new LocalStorage(para);
let storage: LocalStorage = new LocalStorage();


// class MyButtonModifier extends AttributeUpdater<ButtonAttribute> {
//   initializeModifier(instance: ButtonAttribute): void {
//     instance.backgroundColor('#ff2787d9')
//       .width('50%')
//       .height(30)
//     storage.set('initializeModifierFlag', 'initializeModifier succ');
//   }
// }

@Entry
@Component
struct InitializeModifier1 {
  //modifier: MyButtonModifier = new MyButtonModifier()
  @State text1: string = 'start';



  build() {
    Row() {
      Column() {
        Button(this.text1).id("initializeModifier_id")
          //.attributeModifier(this.modifier)
          .onClick((e:ClickEvent)=>{
            // this.text1 = storage.get('initializeModifierFlag')! as string
            //this.modifier.attribute?.height(50)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}