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


import drawing from '@ohos.graphics.drawing'
import { CustomSpan, CustomSpanMeasureInfo, CustomSpanMetrics, DrawContext, CustomSpanDrawInfo, Canvas,} from '@ohos.arkui.component'
import { UIContext } from '@ohos.arkui.UIContext'
const uiContext = new UIContext();
export class MyCustomSpan extends CustomSpan {
  constructor(word: string, width: number, height?: number) {
    super();
    this.word = word;
    this.width = width;
    this.height = height as number;
  }

  onMeasure(measureInfo: CustomSpanMeasureInfo): CustomSpanMetrics {
    return { width: this.width, height: this.height };
  }

  onDraw(context: DrawContext, drawInfo: CustomSpanDrawInfo) {
    let canvas = context.canvas;

    const brush = new drawing.Brush();
    
    const font = new drawing.Font();
    font.setSize(25);
    
    canvas.attachBrush(brush);
    canvas.drawRect({
      left: drawInfo.x + 10,
      right: drawInfo.x + UIContext.getFocusedUIContext()!.vp2px(this.width) - 10,
      top: drawInfo.lineTop + 10,
      bottom: drawInfo.lineBottom - 10
    });

    
    canvas.attachBrush(brush);
    
    canvas.detachBrush();
  }

  setWord(word: string) {
    this.word = word;
  }

  private width: number = 160;
  private word: string = 'drawing';
  private height: number = 10;
}
