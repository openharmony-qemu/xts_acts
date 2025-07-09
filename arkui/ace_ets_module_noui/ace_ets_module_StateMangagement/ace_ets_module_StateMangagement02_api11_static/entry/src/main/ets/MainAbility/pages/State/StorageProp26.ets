// /**
//  * Copyright (c) 2025 Huawei Device Co., Ltd.
//  * Licensed under the Apache License, Version 2.0 (the "License");
//  * you may not use this file except in compliance with the License.
//  * You may obtain a copy of the License at
//  *
//  *     http://www.apache.org/licenses/LICENSE-2.0
//  *
//  * Unless required by applicable law or agreed to in writing, software
//  * distributed under the License is distributed on an "AS IS" BASIS,
//  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  * See the License for the specific language governing permissions and
//  * limitations under the License.
//  */
// import {
//   Entry,
//   Column,
//   Component,
//   Button,
//   ClickEvent,
//   ForEach,
//   Text,
//   Row,
//   Flex,
//   FlexDirection,
//   ItemAlign,
//   FlexAlign,
//   Builder,
//   NavPathStack,
//   FontWeight,
//   Navigation,
//   NavDestination,
//   NavigationMode,
//   ButtonType,
//   Color,
//   DatePicker
// } from '@ohos.arkui.component'
// import {
//   State,
//   Watch,
//   Link,
//   Provide,
//   Prop,
//   ObjectLink,
//   Observed,
//   Consume,
//   StorageProp,
//   StorageLink,
//   LocalStorage,
//   LocalStorageProp,
//   LocalStorageLink,
//   Observed,
//   Environment
// } from '@ohos.arkui.stateManagement'
// import { UIContext, Router } from '@ohos.arkui.UIContext';
// import { AppStorage } from '@ohos.arkui.stateManagement';
// import hilog from "@ohos.hilog";
// AppStorage.clear()
// let storage26: LocalStorage = new LocalStorage({"PropA":1} as Record<string, number>)
//
// @Entry(storage26)
// @Component
// struct StorageProp26 {
//   @LocalStorageProp('') storProp1: number = 1
//   @State num: number = 0;
//   @State a?: number = storage26.get("PropA");
//  aboutToAppear() {
//     let uiContext = this.getUIContext();
//     try {
//       let router = uiContext.getRouter();
//       AppStorage.setOrCreate<Router>('StorageProp26', router);
//     } catch (error: Error) {
//       console.log('error ' + error);
//     }
//   }
//   build() {
//     Column() {
//       Text(`childPropA: ${this.storProp1}`).key('childPropA').height('5%')
//       Button('点击连续改变storage的值').key('son1PropA').height('5%')
//         .onClick((e: ClickEvent) => {
//           this.storProp1 += 1;
//         })
//       Text(`fatherPropA: ${this.a}`).key('fatherPropA').height('5%')
//       Button(`fatherPropA`).height('5%')
//         .key("button221")
//         .onClick((e: ClickEvent) => {
//           storage26.set('PropA', 34)
//           this.a = storage26.get("PropA")
//         })
//
//     }
//   }
// }
