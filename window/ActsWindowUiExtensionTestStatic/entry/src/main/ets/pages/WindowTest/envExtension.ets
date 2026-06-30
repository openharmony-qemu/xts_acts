'use static';
/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State, Env} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'

import { UIExtensionContentSession } from '@kit.AbilityKit';
import uiExtension from '@ohos.arkui.uiExtension';
import { BusinessError } from '@kit.BasicServicesKit';
import window from '@ohos.window';

@Entry
@Component
struct Extension {

  @State message: boolean = false
  private storage: LocalStorage | undefined = this.getUIContext()?.getSharedLocalStorage();


  @Env('ReadonlyEnvKey.WINDOW_AVOID_AREA') avoidAreasVp: window.UIEnvWindowAvoidAreaInfoVP;
  @Env('ReadonlyEnvKey.WINDOW_AVOID_AREA_PX') avoidAreasPx: window.UIEnvWindowAvoidAreaInfoPX;
  @Env('ReadonlyEnvKey.WINDOW_SIZE') sizeInVP: window.SizeInVP;
  @Env('ReadonlyEnvKey.WINDOW_SIZE_PX') sizeInPX: window.Size;

  build() {
    Column() {
      Text(this.message + '')
        .id('HelloWorld')
        .fontSize(20)

      Button('验证').onClick(() => {
        if (Math.abs(this.sizeInVP.width - 500) > 1) return
        if (Math.abs((this.sizeInVP.height - 500)) > 1) return
        if (this.sizeInPX.width <= 0) return
        if (this.sizeInPX.height <= 0) return
        if (this.avoidAreasVp.statusBar === null) return
        if (this.avoidAreasVp.cutout === null) return
        if (this.avoidAreasVp.keyboard === null) return
        if (this.avoidAreasVp.navigationIndicator === null) return
        this.message = true
      }).id('testEnv')

    }.width('100%').height('100%')
  }
}