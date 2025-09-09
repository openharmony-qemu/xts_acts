/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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



import drawing from '@ohos.graphics.drawing'
import { LengthMetrics } from '@kit.ArkUI'
import { Entry, Component, Column, Row, Button, ClickEvent, TextStyle, StyledString,  Text, CustomSpan, CustomSpanMeasureInfo, CustomSpanMetrics, DrawContext, CustomSpanDrawInfo, MutableStyledString,
  TextController, StyledStringKey, Color, FontStyle, FontWeight, CopyOptions} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { BusinessError } from '@ohos.base';
import { MeasureUtils, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'

let gUIContext: UIContext;

class MyCustomSpan extends CustomSpan {
  constructor(word: string, width: number, height: number) {
    super();
    this.word = word;
    this.width = width;
    this.height = height;
  }

  onMeasure(measureInfo: CustomSpanMeasureInfo): CustomSpanMetrics {
    console.log('CustomSpanMeasureInfo fontSize ' + measureInfo.fontSize);
    AppStorage.setOrCreate<number>('CustomSpanFontSize', measureInfo.fontSize);

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

  getWord() {
    return this.word;
  }

  width: number = 160;
  word: string = 'drawing';
  height: number = 10;
}

@Entry
@Component
struct styled_string_CustomSpan {
  customSpan1: MyCustomSpan = new MyCustomSpan('Hello', 80, 10);
  customSpan2: MyCustomSpan = new MyCustomSpan('World', 80, 40);
  style: MutableStyledString = new MutableStyledString(this.customSpan1);
  textStyle: MutableStyledString = new MutableStyledString('123');
  textController: TextController = new TextController();
  isPageShow: boolean = true;

  aboutToAppear() {
    gUIContext = this.getUIContext();
  }

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  build() {
    Row() {
      Column() {
        Text(undefined, { controller: this.textController })
          .copyOption(CopyOptions.InApp)
          .fontSize(30)

        Button('invalidate').onClick((e: ClickEvent) => {
          console.log('CustomSpan getWord ' + this.customSpan1.getWord())
          this.customSpan1.setWord('你好')
          this.customSpan1.invalidate()
          console.log('CustomSpan getWord ' + this.customSpan1.getWord())
          AppStorage.setOrCreate<string>('CustomSpanWord', this.customSpan1.getWord());
        }).id('invalidate')
      }
      .width('100%')
    }
    .height('100%')
  }
}