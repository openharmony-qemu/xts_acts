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
  AttributeModifier,TextInputAttribute,
  Entry,Component,Row,Column,TextInput,
} from '@kit.ArkUI';

class TextInputPunctuationOverflowModifier implements AttributeModifier<TextInputAttribute> {
  public punctuationOverflowValue: boolean | undefined;

  constructor(value: boolean | undefined) {
    this.punctuationOverflowValue = value;
  }

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.punctuationOverflow(this.punctuationOverflowValue);
  }
}

@Entry
@Component
struct TextInputPunctuationOverflow {
  modifierTrue: TextInputPunctuationOverflowModifier =
    new TextInputPunctuationOverflowModifier(true);

  build() {
    Row() {
      Column() {
        TextInput()
          .width('100%')
          .height('5%')
          .id('textinput_punctuationOverflow_default')

        TextInput()
          .width('100%')
          .height('5%')
          .id('textinput_punctuationOverflow_true')
          .punctuationOverflow(true)

        TextInput()
          .width('100%')
          .height('5%')
          .id('textinput_punctuationOverflow_false')
          .punctuationOverflow(false)

        TextInput()
          .width('100%')
          .height('5%')
          .id('textinput_punctuationOverflow_undefined')
          .punctuationOverflow(undefined)

        TextInput()
          .width('100%')
          .height('5%')
          .id('textinput_punctuationOverflow_modifier_true')
          .attributeModifier(this.modifierTrue)
      }
      .width('100%')
    }
    .height('100%')
  }
}
