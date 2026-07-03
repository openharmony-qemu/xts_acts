'use static';

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

import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  Color,
  Text,
  Builder,
  Row,
  ColumnOptions,
  Blank,
  Margin,
  Circle,
  Resource
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import drawing from '@ohos.graphics.drawing';
import { UIContext,DrawModifier,DrawContext} from '@kit.ArkUI';

class MyFullDrawModifier extends DrawModifier {
  public scaleX: number = 1;
  public scaleY: number = 1;
  public scaleTStr: string = '1';
  public uiContext: UIContext;

  constructor(uiContext: UIContext) {
    super();
    this.uiContext = uiContext;
  }

  drawForeground(context: DrawContext): void {
    this.scaleTStr = 'drawForeground'
    const brush = new drawing.Brush();
    brush.setColor({
      alpha: 255,
      red: 255,
      green: 255,
      blue: 0
    });
    console.info('create drawForeground');
    context.canvas.attachBrush(brush);
    const halfWidth = context.size.width / 2;
    const halfHeight = context.size.width / 2;
    context.canvas.drawRect({
      left: this.uiContext.vp2px(halfWidth - 30 * this.scaleX),
      top: this.uiContext.vp2px(halfHeight - 30 * this.scaleY),
      right: this.uiContext.vp2px(halfWidth + 30 * this.scaleX),
      bottom: this.uiContext.vp2px(halfHeight + 30 * this.scaleY)
    });
  }
}

@Entry
@Component
struct CircleFillStroke {
  private fullModifier: MyFullDrawModifier = new MyFullDrawModifier(this.getUIContext());

  build() {
    Column({space:5} as ColumnOptions) {
      Text('text')
        .id('TextDrawModifier')
        .height(20)
        .drawModifier(this.fullModifier)
      Text('text')
        .height(20)
        .drawModifier(undefined)
      Circle({ width: 50, height: 50 })
        .id('CircleFillStroke1')
        .fill(Color.Green)
        .stroke(1)
      Circle({ width: 50, height: 50 })
        .id('CircleFillStroke2')
        .fill(undefined)
        .stroke(undefined)
    }
    .width('100%')
    .height('100%')
  }
}
