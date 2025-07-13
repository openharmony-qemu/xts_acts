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
// } from '@ohos.arkui.stateManagement'
// import { UIContext, Router } from '@ohos.arkui.UIContext';
// import { AppStorage } from '@ohos.arkui.stateManagement';
// import hilog from "@ohos.hilog";
// AppStorage.clear()
// AppStorage.setOrCreate('PropA', 160);
// let storage38 = new LocalStorage();
// let link381: SubscribedAbstractProperty<number> = AppStorage.SetAndProp('PropA',47)
// let link382: SubscribedAbstractProperty<number> = AppStorage.SetAndProp('qqq',47)
//
// @Entry(storage38)
// @Component
// struct LocalStorage38 {
//   @State link1Date: number | undefined = 0;
//   @State link1Date2: number | undefined = 0;
//  aboutToAppear() {
//     let uiContext = this.getUIContext();
//     try {
//       let router = uiContext.getRouter();
//       AppStorage.setOrCreate<Router>('Storage38', router);
//     } catch (error: Error) {
//       console.log('error ' + error);
//     }
//   }
//   build() {
//     Column() {
//       Text('' + this.link1Date).id("text38_link1Date").height('5%')
//       Text('' + this.link1Date2).id("text38_link1Date2").height('5%')
//       Button(`click`).width('100%').height('5%')
//         .key("Storage38Btn")
//         .onClick((e: ClickEvent) => {
//           this.link1Date = link381.get()
//           this.link1Date2 = link382.get()
//
//         })
//     }
//   }
// }