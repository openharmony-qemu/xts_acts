/**
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

import { UIExtensionContentSession } from '@kit.AbilityKit';
import { uiExtension, window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
let storage = LocalStorage.getShared()

@Entry(storage)
@Component
struct Extension {

  @State message: boolean = false

  @Env(SystemProperties.WINDOW_AVOID_AREA) avoidAreasVp: window.UIEnvWindowAvoidAreaInfoVP;
  @Env(SystemProperties.WINDOW_AVOID_AREA_PX) avoidAreasPx: window.UIEnvWindowAvoidAreaInfoPX;
  @Env(SystemProperties.WINDOW_SIZE) sizeInVP: window.SizeInVP;
  @Env(SystemProperties.WINDOW_SIZE_PX) sizeInPX: window.Size;


  build() {
    Column() {
      Text(this.message + '')
        .id('HelloWorld')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Button('验证').onClick((event: ClickEvent) => {
        if (Math.abs(vp2px(this.sizeInVP.width) - 500) > 1) return
        if (Math.abs(vp2px(this.sizeInVP.height) - 500) > 1) return
        if (Math.abs(this.sizeInPX.width - 500) > 1) return
        if (Math.abs((this.sizeInPX.height - 500)) > 1) return
        if (this.avoidAreasVp.statusBar === null) return
        if (this.avoidAreasVp.cutout === null) return
        if (this.avoidAreasVp.keyboard === null) return
        if (this.avoidAreasVp.navigationIndicator === null) return
        this.message = true
      }).id('testEnv')

    }.width('100%').height('100%')
  }
}