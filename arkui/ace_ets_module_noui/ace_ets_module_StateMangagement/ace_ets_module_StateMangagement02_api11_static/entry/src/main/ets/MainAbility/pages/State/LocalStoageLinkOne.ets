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
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  Provide,
  Prop,
  ObjectLink,
  Observed,
  Consume,
  StorageProp,
  StorageLink,
  LocalStorage,
  LocalStorageProp,
  LocalStorageLink
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
AppStorage.clear()
// let storage224: LocalStorage = new LocalStorage({"PropA":1,"PropB":2} as Record<string, number>)


// @Entry(storage224)
// @Component
// struct LocalStoageLinkOne {
//   @LocalStorageLink('PropA') storLink1: number = 1
//   @LocalStorageLink('PropB') storLink2: number = 10
//   @State text1: string = ''
//   @State text2: string = ''
//   @State text3: string = ''
//   aboutToAppear() {
//     let uiContext = this.getUIContext();
//     try {
//       let router = uiContext.getRouter();
//       AppStorage.setOrCreate<Router>('LocalStoageLinkOne', router);
//     } catch (error: Error) {
//       console.log('error ' + error);
//     }
//   }
//   @State vae?: number = storage224.get('PropB')
//   build(){
//     Column(){
//       Button(`Has ${this.text1}`).onClick((e: ClickEvent)=>{
//         this.text1 = `Has1:${storage224.has('PropA')},Has2:${storage224.has('PropP')}`
//       }).key('button_has').height('5%')
//
//       Button(`Set ${this.text2}`).onClick((e: ClickEvent)=>{
//         this.text2 = `Set1:${storage224.set('PropA',2)},Set2:${storage224.set('PropP',2)}`
//       }).key('button_set').height('5%')
//
//       Button(`setOrCreate ${this.text3}`).onClick((e: ClickEvent)=>{
//         this.text3 = `setOrCreate1:${storage224.setOrCreate('PropA',50)},setOrCreate2:${storage224.setOrCreate('PropP',50)}`
//       }).key('button_setOrCreate').height('5%')
//
//
//       Text(`localstorage:${this.vae},storLink2:${this.storLink2}`)
//       .key('text_getValue1').height('5%')
//
//       Button(`点击动态更改本地初始值`).onClick((e: ClickEvent)=>{
//         this.storLink2 += 10
//         this.vae = storage224.get('PropB')
//       }).key('button_changeInitialValue').height('5%')
//
//       Button(`点击更改localstorage值`).onClick((e: ClickEvent)=>{
//         storage224.set('PropB', 666)
//         this.vae = storage224.get('PropB')
//       }).key('button_changeLocalStorageValue').height('5%')
//
//
//
//     }
//   }
// }
