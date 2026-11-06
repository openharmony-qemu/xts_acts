/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Third {
  private controller: RichEditorController = new RichEditorController();
  private controller1: RichEditorController = new RichEditorController();
  private controller2: RichEditorController = new RichEditorController();
  private controller3: RichEditorController = new RichEditorController();

  build() {
    Column() {
      Row(){
        RichEditor({
          controller: this.controller
        }).width('45%')
          .height('100%')
          .id('RichEditor1')
          .borderWidth(1)
          .borderColor('#CCCCCC')
          .backgroundColor('#0FFFFFF')
          .onClick(() => {
            this.insertText(this.controller);
          })
        RichEditor({
          controller: this.controller1
        }).width('45%')
          .height('100%')
          .id('RichEditor2')
          .borderWidth(1)
          .borderColor('#CCCCCC')
          .backgroundColor('#0FFFFFF')
          .onClick(() => {
            this.insertImageWithTag(this.controller1);
          })
      }.width('100%')
      .height('25%')
      Row(){
        RichEditor({
          controller: this.controller2
        }).width('45%')
          .height('100%')
          .id('RichEditor3')
          .borderWidth(1)
          .borderColor('#CCCCCC')
          .backgroundColor('#0FFFFFF')
          .onClick(() => {
            this.insertSymbolSpan(this.controller2);
          })
        RichEditor({
          controller: this.controller3
        }).width('45%')
          .height('100%')
          .id('RichEditor4')
          .borderWidth(1)
          .borderColor('#CCCCCC')
          .backgroundColor('#0FFFFFF')
          .onClick(() => {
            this.insertText(this.controller3);
            this.insertImageWithTag(this.controller3);
            this.insertSymbolSpan(this.controller3);
          })
      }.width('100%')
      .height('25%')
    }.id('Column2')
  }

  insertText(controller: RichEditorController): void {
    try {
      controller.addTextSpan('RichEditor');
      console.info('====> insertText: RichEditor');
    } catch (err) {
      let error = err as BusinessError;
      console.info(`====> insertText error: ${error.code},${error.message}`);
    }
  }

  insertImageWithTag(controller: RichEditorController): void {
    try {
      let options: RichEditorImageSpanOptions = {
        imageStyle: {
          size: [60, 60]
        },
        imageTag: 'image_tag_001'
      };
      controller.addImageSpan($r('app.media.app_icon'), options);
      console.info('====> insertImageWithTag: imageTag = image_tag_001');
    } catch (err) {
      let error = err as BusinessError;
      console.info(`====> insertText error: ${error.code},${error.message}`);
    }
  }

  insertSymbolSpan(controller: RichEditorController): void {
    try {
      controller.addSymbolSpan($r('sys.symbol.chevron_right'));
      console.info('====> SymbolSpan: <');
    } catch (err) {
      let error = err as BusinessError;
      console.info(`====> insertText error: ${error.code},${error.message}`);
    }
  }

}
