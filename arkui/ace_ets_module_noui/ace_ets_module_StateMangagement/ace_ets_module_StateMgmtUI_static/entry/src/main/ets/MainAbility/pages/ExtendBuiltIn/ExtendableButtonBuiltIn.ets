'use static'
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
import { ExtendableButton, ButtonOptions, Length, Entry, Component, Column, ResourceStr, ButtonType, ControlSize, State, ClickEvent } from '@kit.ArkUI';

class MyButton extends ExtendableButton {
  // 通用属性
  setButtonOptions(options?: ButtonOptions): this{
    super.setButtonOptions(options);
    // 添加自定义行为，如打印日志
    console.info('MyColumn: setButtonOptions');
    return this;
  }

  width(): this {
    super.width('100%');
    return this;
  }

  height(): this {
    super.height('100%');
    return this;
  }

  // 自定义属性
  newAttribute(): this {
    super.height('50%');
    super.width('30%');
    return this;
  }
}

@Entry
@Component
struct ExtendableButtonBuiltIn {
  @State str: string = 'add';

  build() {
    Column() {
      // 调用扩展组件
      MyButton(this.str, { controlSize: ControlSize.SMALL } as ButtonOptions)
        .type(ButtonType.Circle)
        .newAttribute() // 调用自定义属性
        .id('ExtendableButton_001')
        .onClick((e: ClickEvent) => {
          this.str += '!';
        })
      MyButton(this.str)
        .type(ButtonType.Normal)
        .width() // 调用重写属性
        .id('ExtendableButton_002')
        .onClick((e: ClickEvent) => {
          this.str += '~';
        })
      // 覆盖undefined
      MyButton(this.str, undefined)
        .newAttribute() // 调用自定义属性
        .id('ExtendableButton_003')
    }
  }
}
