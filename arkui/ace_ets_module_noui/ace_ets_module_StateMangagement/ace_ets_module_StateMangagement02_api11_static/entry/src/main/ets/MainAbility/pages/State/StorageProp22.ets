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
// AppStorage.setOrCreate('propA',47)
// let storage22: LocalStorage = new LocalStorage({'propA':47} as Record<string, number>)
// let s: LocalStorage = new LocalStorage({'propB':32} as Record<string, number>)
//
// @Entry(storage22)
// @Component
// struct StorageProp22 {
//   @LocalStorageProp('propA') storProp: number = 12;
//   @State ku?: number = storage22.get('propA')
//
//   @LocalStorageProp('propB') storPropB: number = 4;
//   @State kuB?: number = storage22.get('propB')
//  aboutToAppear() {
//     let uiContext = this.getUIContext();
//     try {
//       let router = uiContext.getRouter();
//       AppStorage.setOrCreate<Router>('StorageProp22', router);
//     } catch (error: Error) {
//       console.log('error ' + error);
//     }
//   }
//   build(){
//     Column() {
//       Text(`LocalStorage值为${this.ku}`).key('lse1').height('5%')
//       // 测试localstorage单向数据绑定
//       Text(`当前值为${this.storProp}`).height('5%')
//         .key('text_sp')
//
//       Button(`button1`).width('100%').height('5%')
//         .key('btn_lse1')
//         .onClick((e: ClickEvent) => {
//           this.storProp += 1
//           this.ku = storage22.get('propA')
//         })
//
//
//       Text(`LocalStorage值为${this.kuB}`).key('lse2').height('5%')
//       // 测试页面存在多个localstorage的时候，组件只可访问被分配的localstorage
//       Text(`当前值为${this.storPropB}`).height('5%')
//         .key('text_spb')
//
//       Button(`button2`).width('100%').height('5%')
//         .key('btn_lse2')
//         .onClick((e: ClickEvent) => {
//           this.storPropB += 1
//           this.kuB = storage22.get('propB')
//         })
//     }
//   }
// }