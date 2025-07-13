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
//   MutableStyledString,
//   ColorFilter,
//   ClickEvent,
//   Component,
//   RichEditor,
//   Column,
//   Text,
//   ImageSpan,
//   Visibility,
//   $r,
//   FlexAlign,
//   HorizontalAlign,
//   RichEditorStyledStringController,
//   RichEditorStyledStringOptions,
//   ColumnOptions,
//   ImageAttachment,
//   Button,
//   Row,
//   Margin,
//   Scroll,
//   Gauge,
//   FontWeight,
//   TextAlign,
//   Color,
//   TextOverflow,
//   LoadingProgressConfiguration,
//   WrappedBuilder,
//   LoadingProgress,
//   Builder
// } from '@ohos.arkui.component';
// import { UIContext, Router } from '@ohos.arkui.UIContext';
// import { AppStorage, State } from '@ohos.arkui.stateManagement';
// class MyLoadingProgressStyle implements ContentModifier<LoadingProgressConfiguration> {
//   public enableLoading: boolean = false
//   constructor(enableLoading: boolean){
//     this.enableLoading = enableLoading
//   }
//   applyContent(): WrappedBuilder<[LoadingProgressConfiguration]>{
//     return wrapBuilder(buildLoadingProgress)
//   }
// }
// @Builder
// function buildLoadingProgress(config: LoadingProgressConfiguration){
//   Column() {
//     Text('config.enableLoading是：' + (config.contentModifier as MyLoadingProgressStyle).enableLoading).fontColor(0x106836).fontSize(14).id('loadingProgressContentModifierKey01')
//   }
// }
// @Entry
// @Component
// struct LoadingProgressDemoExample {
//   build(){
//     Column({ space: 5 } as ColumnOptions) {
//       LoadingProgress()
//         .color('#106836')
//         .size({ width: 150 })
//         .contentModifier(new MyLoadingProgressStyle(true))
//     }.width('100%').margin({ top: 5 } as Margin)
//   }
// }