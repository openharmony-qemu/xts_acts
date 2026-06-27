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
import i18n from '@ohos.i18n'

const ckString: CustomEnvKey<string> = CustomEnvKey.create<string>();

@Entry
@Component
struct WithEnvDirection {
  @State dirProvider:Direction|undefined = undefined
  @State languageValue: string = ''
  @State varString: string = 'parent value';

  aboutToAppear() {
    this.languageValue = i18n.System.getAppPreferredLanguage()
  }

  build() {
    Column({space:3}) {
      Row(){
        Button('SetLtr')
          .id('SetDirectionLtrButton')
          .onClick(()=>{
            this.dirProvider = Direction.Ltr
          })
          .width(80)
          .height(15)
        Button('SetAuto')
          .id('SetDirectionAutoButton')
          .onClick(()=>{
            this.dirProvider = Direction.Auto
          })
          .width(80)
          .height(15)
      }
      Row(){
        Button('SetRtl')
          .id('SetDirectionRtlButton')
          .onClick(()=>{
            this.dirProvider = Direction.Rtl
          })
          .width(80)
          .height(15)
        Button('SetUndefined')
          .id('SetDirectionUndefinedButton')
          .onClick(()=>{
            this.dirProvider = undefined
          })
          .width(90)
          .height(15)
      }
      Button('设置维吾尔语')
        .id('SetLanguageUg')
        .onClick(() => {
          console.log('getAppPreferredLanguage last ' + i18n.System.getAppPreferredLanguage())
          i18n.System.setAppPreferredLanguage('ug')
        })
        .width(100)
        .height(15)
      Button('设置汉语')
        .id('SetLanguageUg')
        .onClick(() => {
          console.log('getAppPreferredLanguage last ' + i18n.System.getAppPreferredLanguage())
          i18n.System.setAppPreferredLanguage('zh-Hans')
        })
        .width(100)
        .height(15)

      WithEnv(){
        Row({space:3}){
          Text('01').width(60).backgroundColor(0xF5DEB3).id('WithEnvDirectionText1').height(15)
          Text('02').width(60).backgroundColor(0xD2B48C).id('WithEnvDirectionText2').height(15)
        }
        .padding(5)
        .backgroundColor('#77000000')
      }
      .env(WritableEnvKey.DIRECTION,this.dirProvider)
      .customEnv(ckString, this.varString)
      WithEnv(){
        Row({space:3}){
          Text('01').width(60).backgroundColor(0xF5DEB3).id('WithEnvDirectionText3').height(15)
          Text('02').width(60).backgroundColor(0xD2B48C).id('WithEnvDirectionText4').height(15)
        }
        .padding(5)
        .backgroundColor('#77000000')
      }
      .customEnv(null,null)
      .env(null,null)
      WithEnv(){
        Row({space:3}){
          Text('01').width(60).backgroundColor(0xF5DEB3).id('WithEnvDirectionText5').height(15)
          Text('02').width(60).backgroundColor(0xD2B48C).id('WithEnvDirectionText6').height(15)
        }
        .padding(5)
        .backgroundColor('#77000000')
      }
      .customEnv(undefined,undefined)
      .env(undefined,undefined)
    }
    .height('100%')
    .width('100%')
  }
}

