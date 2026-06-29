'use static';

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

import {
  $r,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,RowOptions,
  Resource,
  Row,FlexAlign,
  Text,RowOptions,
  Bindable,
} from '@ohos.arkui.component';
import { State, } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { WithEnv,WithEnvAttribute } from '@ohos.arkui.WithEnv'
import { Env, SystemEnvKey, WritableEnvKey, Direction, CustomEnv, CustomEnvKey } from '@kit.ArkUI';
import i18n from '@ohos.i18n'

const ckString: CustomEnvKey<string> = CustomEnvKey.create<string>();

@Entry
@Component
struct WithEnvDirection {
  @State dirProvider:Direction = Direction.Auto
  @State languageValue: string = ''
  @State varString: string = 'parent value';

  aboutToAppear() {
    this.languageValue = i18n.System.getAppPreferredLanguage()
  }

  build() {
    Column({space:3} as ColumnOptions) {
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
        Row({space:3} as RowOptions){
          Text('01').width(60).backgroundColor(0xF5DEB3).id('WithEnvDirectionText1').height(15)
          Text('02').width(60).backgroundColor(0xD2B48C).id('WithEnvDirectionText2').height(15)
        }
        .padding(5)
        .backgroundColor('#77000000')
      }
      .env(WritableEnvKey.DIRECTION,this.dirProvider)
      WithEnv(){
        Row({space:3} as RowOptions){
          Text('01').width(60).backgroundColor(0xF5DEB3).id('WithEnvDirectionText3').height(15)
          Text('02').width(60).backgroundColor(0xD2B48C).id('WithEnvDirectionText4').height(15)
        }
        .padding(5)
        .backgroundColor('#77000000')
      }
      .customEnv(ckString, this.varString)

    }
    .height('100%')
    .width('100%')
  }
}
