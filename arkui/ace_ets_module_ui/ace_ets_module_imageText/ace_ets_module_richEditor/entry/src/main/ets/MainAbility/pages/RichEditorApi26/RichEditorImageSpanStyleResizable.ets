/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
struct RichEditorImageSpanStyleResizable {
  controllerSlice: RichEditorController = new RichEditorController();
  controllerNull: RichEditorController = new RichEditorController();
  controllerUndefined: RichEditorController = new RichEditorController();
  controllerDefault: RichEditorController = new RichEditorController();

  private storeResizable(ctrl: RichEditorController, key: string): void {
    let spans: (RichEditorImageSpanResult | RichEditorTextSpanResult)[] = ctrl.getSpans();
    if (spans.length <= 0) {
      AppStorage.setOrCreate(key, 'no_span');
      return;
    }
    let imgSpan: RichEditorImageSpanResult = spans[0] as RichEditorImageSpanResult;
    if (imgSpan.imageStyle === undefined) {
      AppStorage.setOrCreate(key, 'no_style');
      return;
    }
    let resizableVal: ResizableOptions | undefined = imgSpan.imageStyle.resizable;
    if (resizableVal === undefined) {
      AppStorage.setOrCreate(key, 'style_ok');
      return;
    }
    AppStorage.setOrCreate(key, JSON.stringify(resizableVal));
  }

  private addImageWithResizable(
    ctrl: RichEditorController,
    resizableValue: ResizableOptions | null | undefined,
    useResizable: boolean
  ): void {
    let style: RichEditorImageSpanStyle = { size: [50, 50] };
    if (useResizable) {
      style.resizable = resizableValue as ResizableOptions;
    }
    ctrl.addImageSpan($r('app.media.icon'), { imageStyle: style });
  }

  @Builder
  editorBlock(
    btnId: string,
    editorId: string,
    storageKey: string,
    ctrl: RichEditorController,
    resizableValue: ResizableOptions | null | undefined,
    useResizable: boolean
  ) {
    Button(storageKey)
      .id(btnId)
      .width('100%')
      .height('5%')
      .onClick(() => {
        this.storeResizable(ctrl, storageKey);
      })
    RichEditor({ controller: ctrl })
      .id(editorId)
      .width('100%')
      .height('8%')
      .borderWidth(1)
      .borderColor(Color.Gray)
      .onReady(() => {
        this.addImageWithResizable(ctrl, resizableValue, useResizable);
      })
  }

  build() {
    Scroll() {
      Column({ space: 5 }) {
        this.editorBlock(
          'btn_imageSpanStyle_resizable_slice',
          'richEditor_imageSpanStyle_resizable_slice',
          'imageSpanStyle_resizable_slice',
          this.controllerSlice,
          { slice: { left: 1, right: 1, top: 1, bottom: 1 } },
          true
        )
        this.editorBlock(
          'btn_imageSpanStyle_resizable_default',
          'richEditor_imageSpanStyle_resizable_default',
          'imageSpanStyle_resizable_default',
          this.controllerDefault,
          undefined,
          false
        )
        this.editorBlock(
          'btn_imageSpanStyle_resizable_null',
          'richEditor_imageSpanStyle_resizable_null',
          'imageSpanStyle_resizable_null',
          this.controllerNull,
          null,
          true
        )
        this.editorBlock(
          'btn_imageSpanStyle_resizable_undefined',
          'richEditor_imageSpanStyle_resizable_undefined',
          'imageSpanStyle_resizable_undefined',
          this.controllerUndefined,
          undefined,
          true
        )
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}
