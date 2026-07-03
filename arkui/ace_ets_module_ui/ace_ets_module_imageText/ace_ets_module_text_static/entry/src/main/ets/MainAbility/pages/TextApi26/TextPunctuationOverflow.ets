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
  AttributeModifier,TextAttribute,Entry,
  Component,Row,Column,Text,
} from '@kit.ArkUI';

class TextPunctuationOverflowModifier implements AttributeModifier<TextAttribute> {
  public punctuationOverflowValue: boolean | undefined;

  constructor(value: boolean | undefined) {
    this.punctuationOverflowValue = value;
  }

  applyNormalAttribute(instance: TextAttribute): void {
    instance.punctuationOverflow(this.punctuationOverflowValue);
  }
}

@Entry
@Component
struct TextPunctuationOverflow {
  modifierTrue: TextPunctuationOverflowModifier =
    new TextPunctuationOverflowModifier(true);

  build() {
    Row() {
      Column() {
        Text('Hello World')
          .width('100%')
          .height('5%')
          .id('text_punctuationOverflow_default')

        Text('Hello World')
          .width('100%')
          .height('5%')
          .id('text_punctuationOverflow_true')
          .punctuationOverflow(true)

        Text('Hello World')
          .width('100%')
          .height('5%')
          .id('text_punctuationOverflow_false')
          .punctuationOverflow(false)
        
        Text('Hello World')
          .width('100%')
          .height('5%')
          .id('text_punctuationOverflow_undefined')
          .punctuationOverflow(undefined)

        Text('Hello World')
          .width('100%')
          .height('5%')
          .id('text_punctuationOverflow_modifier_true')
          .attributeModifier(this.modifierTrue)
      }
      .width('100%')
    }
    .height('100%')
  }
}
