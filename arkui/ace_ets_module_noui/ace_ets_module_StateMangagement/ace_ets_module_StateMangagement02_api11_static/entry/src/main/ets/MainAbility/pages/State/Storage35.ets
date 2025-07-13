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
// AppStorage.setOrCreate('PropA', 121);
// let storage35 = new LocalStorage();
// let link351: SubscribedAbstractProperty<number> = AppStorage.link('PropA')
// let link352: SubscribedAbstractProperty<number> = AppStorage.link('sss')
// let link353 = link351.get()
//
// @Entry(storage35)
// @Component
// struct LocalStorage35 {
//   //@LocalStorageLink变量装饰器与LocalStorage中的'PropA'属性建立双向绑定
//   @StorageLink('PropA') storLink1: number = 1;
//   @State link1Date2: number | undefined = 0;
//  aboutToAppear() {
//     let uiContext = this.getUIContext();
//     try {
//       let router = uiContext.getRouter();
//       AppStorage.setOrCreate<Router>('Storage35', router);
//     } catch (error: Error) {
//       console.log('error ' + error);
//     }
//   }
//   build() {
//     Column() {
//       Text('' + link353).id("text35_link").height('5%')
//       Text('' + link352).id("text35_link2").height('5%')
//       Text('' + this.link1Date2).id("text35_link1Date2").height('5%')
//       Button(`click`).width('100%').height('5%')
//         .key("Storage35Btn")
//         .onClick((e: ClickEvent) => {
//           this.link1Date2 = this.storLink1
//         })
//     }
//   }
// }