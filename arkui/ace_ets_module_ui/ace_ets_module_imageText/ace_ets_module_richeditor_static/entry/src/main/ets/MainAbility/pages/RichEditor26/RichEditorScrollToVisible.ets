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
  Entry,
  Component,
  RichEditorController,
  Scroll,
  Column,
  RichEditor,
  Color,
  Row,
  Button,
  AppStorage,
} from '@kit.ArkUI';

@Entry
@Component
struct RichEditorScrollToVisible {
  controller: RichEditorController = new RichEditorController();
  build() {
    Scroll() {
      Column() {
        RichEditor({ controller: this.controller })
          .id('richEditor_scrollToVisible')
          .width('100%')
          .height('10%')
          .borderWidth(1)
          .borderColor(Color.Gray)
          .onReady(() => {
            let longText: string = '';
            for (let i: int = 0; i < 30; i++) {
              longText += 'TestContentLine' + i.toString() + '\n';
            }
            this.controller.addTextSpan(longText, {
              style: {
                fontSize: 30
              }
            });
          })

        Row(){
          Button('NoParam')
            .id('btn_scrollToVisible_no_param')
            .onClick(() => {
              try {
                this.controller.scrollToVisible();
                AppStorage.setOrCreate('scrollToVisibleNoParam','success')
              }catch (err) {
                console.log('scrollToVisible error'+err)
                AppStorage.setOrCreate('scrollToVisibleNoParam','failed')
              }

            })
            .width('30%')
          Button('UndefinedParam')
            .id('btn_scrollToVisible_undefined')
            .onClick(() => {
              try {
                this.controller.scrollToVisible(undefined);
                AppStorage.setOrCreate('scrollToVisibleUndefinedParam', 'success')
              } catch (err) {
                console.log('scrollToVisible error' + err)
                AppStorage.setOrCreate('scrollToVisibleUndefinedParam', 'failed')
              }
            })
            .width('30%')
          Button('NormalRange')
            .id('btn_scrollToVisible_normal_range')
            .onClick(() => {
              try {
                this.controller.scrollToVisible({ start: 30, end: 50 });
                AppStorage.setOrCreate('scrollToVisibleNormalRange', 'success')
              } catch (err) {
                console.log('scrollToVisible error' + err)
                AppStorage.setOrCreate('scrollToVisibleNormalRange', 'failed')
              }
            })
            .width('25%')
        }.height('5%')

        Row(){
          Button('StartNegative')
            .id('btn_scrollToVisible_start_negative')
            .onClick(() => {
              try {
                this.controller.scrollToVisible({ start: -1, end: 50 });
                AppStorage.setOrCreate('scrollToVisibleStartNegative', 'success')
              } catch (err) {
                console.log('scrollToVisible error' + err)
                AppStorage.setOrCreate('scrollToVisibleStartNegative', 'failed')
              }
            })
            .width('25%')

          Button('EndOverflow')
            .id('btn_scrollToVisible_end_overflow')
            .onClick(() => {
              try {
                this.controller.scrollToVisible({ start: 30, end: 99999 });
                AppStorage.setOrCreate('scrollToVisibleEndOverflow', 'success')
              } catch (err) {
                console.log('scrollToVisible error' + err)
                AppStorage.setOrCreate('scrollToVisibleEndOverflow', 'failed')
              }
            })
            .width('25%')

          Button('StartGreaterEnd')
            .id('btn_scrollToVisible_start_greater_end')
            .onClick(() => {
              try {
                this.controller.scrollToVisible({ start: 100, end: 10 });
                AppStorage.setOrCreate('scrollToVisibleStartGreaterEnd', 'success')
              } catch (err) {
                console.log('scrollToVisible error' + err)
                AppStorage.setOrCreate('scrollToVisibleStartGreaterEnd', 'failed')
              }
            })
            .width('25%')
        }.height('5%')

      }
      .width('100%')
      .height('100%')
    }
  }
}