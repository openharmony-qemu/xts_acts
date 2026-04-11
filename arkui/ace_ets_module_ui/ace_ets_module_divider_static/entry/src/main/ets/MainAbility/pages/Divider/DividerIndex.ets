'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry,
  Component,
  Column,
  Scroll,
  Divider,
  Text,
  LineCapStyle
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct DividerIndex {
  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.info('[ARKUI_NEW] DividerIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        Text('Divider default')
        Divider()
          .id('dividerDefault').key('dividerDefault')
          .width('100%')

        Text('Divider vertical true')
        Divider()
          .vertical(true)
          .id('dividerVerticalTrue').key('dividerVerticalTrue')
          .height('50vp')

        Text('Divider vertical false')
        Divider()
          .vertical(false)
          .id('dividerVerticalFalse').key('dividerVerticalFalse')
          .width('100%')

        Text('Divider color red')
        Divider()
          .color('#FF0000')
          .id('dividerColorRed').key('dividerColorRed')
          .width('100%')

        Text('Divider strokeWidth 5')
        Divider()
          .strokeWidth(5)
          .id('dividerStrokeWidth5').key('dividerStrokeWidth5')
          .width('100%')

        Text('Divider strokeWidth 10px')
        Divider()
          .strokeWidth('10px')
          .id('dividerStrokeWidth10px').key('dividerStrokeWidth10px')
          .width('100%')

        Text('Divider lineCap Butt')
        Divider()
          .lineCap(LineCapStyle.Butt)
          .id('dividerLineCapButt').key('dividerLineCapButt')
          .width('100%')

        Text('Divider lineCap Round')
        Divider()
          .lineCap(LineCapStyle.Round)
          .id('dividerLineCapRound').key('dividerLineCapRound')
          .width('100%')

        Text('Divider lineCap Square')
        Divider()
          .lineCap(LineCapStyle.Square)
          .id('dividerLineCapSquare').key('dividerLineCapSquare')
          .width('100%')
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
