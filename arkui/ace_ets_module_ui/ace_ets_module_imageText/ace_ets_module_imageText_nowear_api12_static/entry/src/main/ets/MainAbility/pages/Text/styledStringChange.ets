/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry,
  Component,
  CustomSpan,
  CustomSpanMeasureInfo,
  CustomSpanMetrics,
  DrawContext,
  CustomSpanDrawInfo,
  TextController,
  InputType,
  TextAreaType,
  Resource,
  $r,
  TextStyle,
  Column,
  Margin,
  Text,
  TextInput,
  CopyOptions,
  EditableTextOnChangeCallback,
  PreviewText,
  TextChangeOptions
} from '@ohos.arkui.component'
import {
  State,
  
} from '@ohos.arkui.stateManagement'
import { UIContext } from "@ohos.arkui.UIContext";
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image'
import { LengthMetrics } from '@ohos.arkui.node';
import { UIContext } from "@ohos.arkui.UIContext";
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image'
import { LengthMetrics } from '@ohos.arkui.node';
const uiContext = new UIContext();
class MyCustomSpan extends CustomSpan {
  constructor(word: string, width: number, height: number) {
    super();
    this.word = word;
    this.width = width;
    this.height = height;
  }

  onMeasure(measureInfo: CustomSpanMeasureInfo): CustomSpanMetrics {
    return { width: this.width, height: this.height };
  }

  onDraw(context: DrawContext, options: CustomSpanDrawInfo) {
    let canvas = context.canvas;

    const brush = new drawing.Brush();
    
    const font = new drawing.Font();
    font.setSize(25);
    
    canvas.attachBrush(brush);
    canvas.drawRect({
      left: options.x + 10,
      right: options.x + UIContext.getFocusedUIContext()!.vp2px(this.width) - 10,
      top: options.lineTop + 10,
      bottom: options.lineBottom - 10
    });

    
    canvas.attachBrush(brush);
    
    canvas.detachBrush();
  }

  setWord(word: string) {
    this.word = word;
  }

  public width: number = 160;
  public word: string = 'drawing';
  public height: number = 10;
}

@Entry
@Component
struct styled_string_demo1 {
  @State text: string = ''
  @State text2: string = ''
  customSpan2: MyCustomSpan = new MyCustomSpan('change', 130, 10);
  customSpan1: MyCustomSpan = new MyCustomSpan('Hello', 80, 10);
  customSpan3: MyCustomSpan = new MyCustomSpan('World', 80, 40);
  
  
  
  textController: TextController = new TextController();
  imagePixelMap: image.PixelMap | undefined = undefined;
  isPageShow: boolean = true;

  @State inputType: InputType = InputType.Normal
  @State areaType: TextAreaType = TextAreaType.NORMAL

   aboutToAppear() {
    console.info('aboutToAppear initial imagePixelMap')
    this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.icon'))
  }

  private async getPixmapFromMedia(resource: Resource) {
    
    
    
    
    
    
    
    
    
    
    
    
  }

  onPageShow() {
    if (!this.isPageShow) {
      return
    }
    this.isPageShow = false;

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  }

  build() {
    Column() {

      Text(this.text)
        .key('changeText')
        .copyOption(CopyOptions.LocalDevice)
        .draggable(true)

      Text(this.text2)
        .key('changeText2')
        .copyOption(CopyOptions.LocalDevice)
        .draggable(true)

      TextInput({text: ''})
        .type(this.inputType)
        .height(100)
        .key('styledStringInput')
        .margin({ top:50 } as Margin)
        .onChange((value: String, previewText: PreviewText, options: TextChangeOptions) :void=> {
          this.text = 'change'
        } as EditableTextOnChangeCallback)
        .onPaste((): void => {
          this.text2 = 'paste'
        })

      Text(undefined, { controller: this.textController })
        .key('styledStringText')
        .draggable(true)
        .copyOption(CopyOptions.LocalDevice)
        .fontSize(30)
        .height(35)
        .margin(20)



    }.margin({ top: 50 } as Margin)
  }
}