/*
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
struct orphanCharOptimizationExample001{
  @State message: string = '凤舞龙飞凤舞龙飞凤舞';
  @State orphanCharOptimizationXTS: boolean | null | undefined = true;
  controller: RichEditorController = new RichEditorController();

  build() {
    Column() {
      Row() {
        Button('nu')
          .onClick(() => {
            this.orphanCharOptimizationXTS = null;
          })
          .id('null')
      }.height('5%')
      Row() {
        Text(this.message)
          .fontSize(20)
          .width('38%')
          .orphanCharOptimization(this.orphanCharOptimizationXTS)
          .id('jsText_null')
        TextArea({ text: this.message })
          .fontSize(20)
          .width('38%')
          .orphanCharOptimization(this.orphanCharOptimizationXTS)
          .id('jsTextArea_null')
      }

      Row() {
        TextInput({ text: this.message })
          .fontSize(20)
          .width('38%')
          .orphanCharOptimization(this.orphanCharOptimizationXTS)
          .id('jsTextInput_null')
        RichEditor({ controller: this.controller })
          .onReady(() => {
            this.controller.addTextSpan('凤舞龙飞凤舞龙飞凤舞',
              {
                style: {
                  fontColor: Color.Black,
                  fontSize: '20'
                },
              })
          })
          .id('jsRichEditor_null')
          .width('38%')
          .orphanCharOptimization(this.orphanCharOptimizationXTS)
      }


    }.height('100%').width('100%')
  }
}