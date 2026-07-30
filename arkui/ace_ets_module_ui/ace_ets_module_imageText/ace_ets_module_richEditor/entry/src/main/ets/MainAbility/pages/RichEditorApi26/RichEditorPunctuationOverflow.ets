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

@Entry
@Component
struct RichEditorPunctuationOverflow {
  controllerDefault: RichEditorController = new RichEditorController();
  controllerTrue: RichEditorController = new RichEditorController();
  controllerFalse: RichEditorController = new RichEditorController();
  controllerNull: RichEditorController = new RichEditorController();
  controllerUndefined: RichEditorController = new RichEditorController();
  build() {
    Row() {
      Column() {
        RichEditor({ controller: this.controllerDefault })
          .width('100%')
          .height('5%')
          .id('richEditor_punctuationOverflow_default')

        RichEditor({ controller: this.controllerTrue })
          .width('100%')
          .height('5%')
          .id('richEditor_punctuationOverflow_true')
          .punctuationOverflow(true)

        RichEditor({ controller: this.controllerFalse })
          .width('100%')
          .height('5%')
          .id('richEditor_punctuationOverflow_false')
          .punctuationOverflow(false)

        RichEditor({ controller: this.controllerNull })
          .width('100%')
          .height('5%')
          .id('richEditor_punctuationOverflow_null')
          .punctuationOverflow(null)

        RichEditor({ controller: this.controllerUndefined })
          .width('100%')
          .height('5%')
          .id('richEditor_punctuationOverflow_undefined')
          .punctuationOverflow(undefined)
      }
      .width('100%')
    }
    .height('100%')
  }
}