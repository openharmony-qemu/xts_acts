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

import { UIContext } from '@kit.ArkUI';

@Entry
@Component
struct IsWindowInfoInitializedTest {
  @State textLifecycle: string = 'lifecycle_result_not_executed'
  @State textNormal: string = 'normal_result_not_executed'
  @State textNull: string = 'null_result_not_executed'
  @State textUndefined: string = 'undefined_result_not_executed'
  @State textInstanceNull: string = 'instance_null_result_not_executed'
  @State textInstanceUndefined: string = 'instance_undefined_result_not_executed'

  aboutToAppear(): void {
    try {
      let uiContext: UIContext = this.getUIContext();
      let result: boolean = uiContext.isWindowInfoInitialized();
      this.textLifecycle = 'lifecycle_result_' + String(result);
    } catch (err) {
      this.textLifecycle = 'lifecycle_result_error';
    }
  }

  build() {
    Scroll() {
      Column() {
        Text('IsWindowInfoInitialized Test')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin(5)

        Text(this.textLifecycle).id('text_lifecycle_id').fontSize(8).maxLines(2)

        Button('check_normal').id('btn_normal').width(140).height(30).fontSize(10)
          .onClick(() => {
            try {
              let uiContext: UIContext = this.getUIContext();
              let result: boolean = uiContext.isWindowInfoInitialized();
              this.textNormal = 'normal_result_' + String(result);
            } catch (err) {
              this.textNormal = 'normal_result_error';
            }
          })
        Text(this.textNormal).id('text_normal_id').fontSize(8).maxLines(2)

        Button('check_null').id('btn_null').width(140).height(30).fontSize(10)
          .onClick(() => {
            try {
              let uiContext: ESObject = this.getUIContext();
              let result: ESObject = uiContext.isWindowInfoInitialized(null);
              this.textNull = 'null_result_' + String(result);
            } catch (err) {
              this.textNull = 'null_result_error';
            }
          })
        Text(this.textNull).id('text_null_id').fontSize(8).maxLines(2)

        Button('check_undefined').id('btn_undefined').width(140).height(30).fontSize(10)
          .onClick(() => {
            try {
              let uiContext: ESObject = this.getUIContext();
              let result: ESObject = uiContext.isWindowInfoInitialized(undefined);
              this.textUndefined = 'undefined_result_' + String(result);
            } catch (err) {
              this.textUndefined = 'undefined_result_error';
            }
          })
        Text(this.textUndefined).id('text_undefined_id').fontSize(8).maxLines(2)

        Button('check_instance_null').id('btn_instance_null').width(160).height(30).fontSize(10)
          .onClick(() => {
            try {
              let nullContext: ESObject = null;
              let result: ESObject = nullContext.isWindowInfoInitialized();
              this.textInstanceNull = 'instance_null_result_' + String(result);
            } catch (err) {
              this.textInstanceNull = 'instance_null_result_error';
            }
          })
        Text(this.textInstanceNull).id('text_instance_null_id').fontSize(8).maxLines(2)

        Button('check_instance_undefined').id('btn_instance_undefined').width(180).height(30).fontSize(10)
          .onClick(() => {
            try {
              let undefinedContext: ESObject = undefined;
              let result: ESObject = undefinedContext.isWindowInfoInitialized();
              this.textInstanceUndefined = 'instance_undefined_result_' + String(result);
            } catch (err) {
              this.textInstanceUndefined = 'instance_undefined_result_error';
            }
          })
        Text(this.textInstanceUndefined).id('text_instance_undefined_id').fontSize(8).maxLines(2)
      }
      .width('100%')
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .id('main_scroll')
  }
}
