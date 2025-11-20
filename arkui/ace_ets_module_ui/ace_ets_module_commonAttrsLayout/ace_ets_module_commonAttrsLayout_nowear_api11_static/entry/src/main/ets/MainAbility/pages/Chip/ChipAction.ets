/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// import { Chip, ChipSize } from '@ohos.arkui.component';
import { $r, Button, Column, ColumnOptions, Component, DragEvent, Entry, Image, Text, } from '@ohos.arkui.component';
import { AppStorage, Link, Prop, State, } from '@ohos.arkui.stateManagement';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct ChipAction {
  @State text: string = ''

  build() {
    Column() {
      Column() {
        // Chip({
        //   prefixIcon: {
        //     src: $r('app.media.icon'),
        //     size: { width: 16, height: 16 },
        //     fillColor: Color.Red,
        //   },
        //   label: {
        //     text: "操作块",
        //     fontSize: 16,
        //     fontColor: Color.Blue,
        //     fontFamily: "HarmonyOS Sans",
        //     labelMargin: { left: 4, right: 4 },
        //   },
        //   suffixIcon: {
        //     src: $r('app.media.icon'),
        //     size: { width: 16, height: 16 },
        //     fillColor: Color.Red,
        //     action:() => {
        //       this.text = 'action'
        //     }
        //   },
        //   size: ChipSize.NORMAL,
        //   allowClose: true,
        //   enabled: true,
        //   backgroundColor: '0x808080',
        // })
      }.width(120).borderWidth(1).key('ChipActionCol')

      Text(this.text).key('ChipAction')
    }
  }
}