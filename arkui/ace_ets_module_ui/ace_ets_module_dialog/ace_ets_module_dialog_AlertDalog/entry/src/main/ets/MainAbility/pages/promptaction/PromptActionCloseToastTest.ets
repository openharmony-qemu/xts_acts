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

import promptAction from '@ohos.promptAction';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct PromptActionCloseToastTest {
  @State toastTestResult: string = 'Ready for testing';
  @State lastError: string = '';
  @State currentToastId: number = 0;

  build() {
    Row() {
      Column() {
        Text('PromptAction CloseToast Test Page')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)

        Text('Test Result: ' + this.toastTestResult)
          .fontSize(10)
          .id('toast_test_result')

        Text('Last Error: ' + this.lastError)
          .fontSize(10)
          .fontColor(Color.Red)
          .id('toast_last_error')

        Text('Current Toast ID: ' + this.currentToastId)
          .fontSize(10)
          .fontColor(Color.Blue)
          .id('current_toast_id')
        

        // ========== 创建Toast用于测试关闭 ==========
        Text('=== Create Toast for Testing ===')
          .fontSize(10)
          .fontWeight(FontWeight.Medium)

        Button('Create Toast for Testing')
          .id('btn_create_toast')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              promptAction.showToast({
                message: 'Test Toast for Closing',
                duration: 3000
              })
              this.toastTestResult = 'Toast created';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.toastTestResult = 'Toast creation: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // ========== closeToast 测试 ==========
        Text('=== closeToast Method Tests ===')
          .fontSize(10)
          .fontWeight(FontWeight.Medium)

        // Test closeToast with valid ID
        Button('Close Toast with Valid ID')
          .id('btn_closetoast_valid')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              promptAction.closeToast(this.currentToastId);
              this.toastTestResult = 'closeToast valid ID: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.toastTestResult = 'closeToast valid ID: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test closeToast with invalid ID
        Button('Close Toast with Invalid ID (99999)')
          .id('btn_closetoast_invalid')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              promptAction.closeToast(99999);
              this.toastTestResult = 'closeToast invalid ID: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.toastTestResult = 'closeToast invalid ID: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // ========== null/undefined 参数测试 ==========
        Text('=== Null/Undefined Tests ===')
          .fontSize(10)
          .fontWeight(FontWeight.Medium)

        // Test closeToast with null ID
        Button('Close Toast with null ID')
          .id('btn_closetoast_null')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              // Test passing null as toastId parameter
              promptAction.closeToast(null);
              this.toastTestResult = 'closeToast null: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.toastTestResult = 'closeToast null: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })

        // Test closeToast with undefined ID
        Button('Close Toast with undefined ID')
          .id('btn_closetoast_undefined')
          .width('80%')
          .height('5%')
          .onClick(() => {
            try {
              // Test passing undefined as toastId parameter
              promptAction.closeToast(undefined);
              this.toastTestResult = 'closeToast undefined: SUCCESS';
              this.lastError = '';
            } catch (error) {
              let err = error as BusinessError;
              this.toastTestResult = 'closeToast undefined: FAILED';
              this.lastError = `code: ${err.code}, message: ${err.message}`;
            }
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}