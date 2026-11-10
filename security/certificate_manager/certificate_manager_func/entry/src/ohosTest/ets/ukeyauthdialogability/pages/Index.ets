/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import UkeyAuthExtensionContext from '@ohos.security.UkeyAuthExtensionContext';

@Entry
@Component
struct UkeyAuthIndex {
  @State message: string = 'UKey Auth Dialog'
  private storage?: LocalStorage = this.getUIContext().getSharedLocalStorage();
  private context?: UkeyAuthExtensionContext = this.storage?.get<UkeyAuthExtensionContext>('context');
  aboutToAppear() {
    setTimeout(() => {
      this.context?.terminateSelfWithResult({
        resultCode: 0
      })
    }, 3000)
  }
  build() {
    Column() {
      Text(this.message)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 40 })
      Button('认证')
        .type(ButtonType.Capsule)
        .margin({ top: 20 })
        .width('60%')
        .backgroundColor('#0D9FFB')
        .onClick(() => {
          this.context?.terminateSelf()
        })

      Button('取消')
        .type(ButtonType.Capsule)
        .margin({ top: 10 })
        .width('60%')
        .onClick(() => {
          this.context?.terminateSelfWithResult({
            resultCode: 29700002
          })
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
