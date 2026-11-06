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
import { EditorFixture } from '../../test/EditorFixture';

function createTextAreaController(): TextAreaController {
  if (canIUse('SystemCapability.ArkUI.ArkUI.Full')) {
    return new TextAreaController();
  }
  throw new Error('Real editor tests require ArkUI Full capability');
}

function createTextInputController(): TextInputController {
  if (canIUse('SystemCapability.ArkUI.ArkUI.Full')) {
    return new TextInputController();
  }
  throw new Error('Real editor tests require ArkUI Full capability');
}

@Entry
@Component
struct Index {
  @StorageLink('proxyText') private text: string = '';
  @StorageLink('proxyMultiline') private multiline: boolean = false;
  @StorageLink('proxyKeyboardVisible') private keyboardVisible: boolean = false;
  @StorageLink('proxyEnterKeyType') private enterKey: EnterKeyType = EnterKeyType.Done;
  private editor: TextAreaController = createTextAreaController();
  private input: TextInputController = createTextInputController();

  aboutToAppear(): void {
    EditorFixture.focus = () => {
      const editorId = this.multiline ? 'proxyMultilineEditor' : 'proxyEditor';
      this.getUIContext().getFocusController().requestFocus(editorId);
    };
    EditorFixture.blur = () => { this.getUIContext().getFocusController().requestFocus('focusSink'); };
    EditorFixture.focusNumber = () => { this.getUIContext().getFocusController().requestFocus('numberEditor'); };
    EditorFixture.readCaret = () => {
      try {
        return this.multiline ? this.editor.getCaretOffset() : this.input.getCaretOffset();
      } catch (error) {
        throw error as Error;
      }
    };
    EditorFixture.select = (start: number, end: number) => {
      if (this.multiline) {
        this.editor.setTextSelection(start, end);
      } else {
        this.input.setTextSelection(start, end);
      }
    };
    EditorFixture.uiReady = true;
  }

  build() {
    Column({ space: 12 }) {
      Text('输入法框架应用内自定义键盘测试').fontSize(20)
        .fontWeight(FontWeight.Medium).fontColor('#182431').width('100%').maxLines(2)
      Button('焦点隔离').id('focusSink').onFocus(() => { EditorFixture.onSinkFocus(); })
        .width('100%').height(44).fontSize(16).borderRadius(8).flexShrink(0)
      Text(this.multiline ? '多行文本输入' : '单行文本输入').fontSize(14).fontColor('#526171')
      if (this.multiline) {
        TextArea({ text: this.text, controller: this.editor })
        .id('proxyMultilineEditor')
        .width('100%').height(96).flexShrink(0)
        .onFocus(() => { EditorFixture.onEditorFocus(); })
        .onBlur(() => { EditorFixture.onEditorBlur(); })
        .onChange((text: string) => {
          this.text = text;
          EditorFixture.text = text;
        })
        .onTextSelectionChange((start: number, end: number) => { EditorFixture.cursor = end; })
        .onSubmit((action: EnterKeyType, event: SubmitEvent) => { EditorFixture.onSubmit(action, event); })
      } else {
        TextInput({ text: this.text, controller: this.input })
          .id('proxyEditor')
          .type(InputType.Normal)
          .enterKeyType(this.enterKey)
          .width('100%').height(48).flexShrink(0)
          .onFocus(() => { EditorFixture.onEditorFocus(); })
          .onBlur(() => { EditorFixture.onEditorBlur(); })
          .onChange((text: string) => {
            this.text = text;
            EditorFixture.text = text;
          })
          .onTextSelectionChange((start: number, end: number) => { EditorFixture.cursor = end; })
          .onSubmit((action: EnterKeyType, event: SubmitEvent) => { EditorFixture.onSubmit(action, event); })
      }
      if (this.keyboardVisible) {
        Column({ space: 12 }) {
          Text('应用内自定义键盘').fontSize(16).fontWeight(FontWeight.Medium)
          Button('输入 A').onClick(() => { EditorFixture.getClient().insertText('A'); })
            .width('100%').height(44).fontSize(16).borderRadius(8).flexShrink(0)
        }.id('proxyKeyboardPanel').width('100%').padding(16).borderRadius(12)
          .backgroundColor('#E8EEF8').flexShrink(0)
      }
      Text('数字输入').fontSize(14).fontColor('#526171')
      TextInput({ text: '12345' }).id('numberEditor').type(InputType.Number)
        .width('100%').height(48).flexShrink(0)
    }.width('100%').height('100%').padding(20).alignItems(HorizontalAlign.Start)
      .backgroundColor('#F5F7FA')
  }
}
