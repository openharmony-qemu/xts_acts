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

import { WithEnv,WithEnvAttribute } from '@ohos.arkui.WithEnv'

@Entry
@Component
struct WithEnvDirection {
  @State dirProvider:Direction|undefined = undefined

  build() {
    Column() {
      Button('dirProvider=' + this.dirProvider)
       .id('WithEnvDirectionButton')
      .onClick(()=>{
        if(this.dirProvider == undefined) {
          this.dirProvider = Direction.Auto
        } else if(this.dirProvider == Direction.Auto) {
          this.dirProvider = Direction.Ltr
        } else if(this.dirProvider == Direction.Ltr) {
          this.dirProvider = Direction.Rtl
        } else if(this.dirProvider == Direction.Rtl) {
          this.dirProvider = undefined
        }
      })

      WithEnv(){
        Row(){
          Text('01').width('20%').backgroundColor(0xF5DEB3).id('WithEnvDirectionText1')
          Text('23').width('20%').backgroundColor(0xD2B48C)
          Text('45').width('20%').backgroundColor(0xF5DEB3)
          Text('67').width('20%').backgroundColor(0xD2B48C)
        }
        .padding(10)
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor('#77000000')
      }
      .env(WritableEnvKey.DIRECTION,this.dirProvider)
    }
    .height('100%')
    .width('100%')
  }
}

