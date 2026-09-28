'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Row, ComponentV2, Component, Column, Text, Button, CustomEnv, ObservedV2, Trace, Require, CustomEnvKey, Param } from '@kit.ArkUI';
import { WithEnv, WithEnvAttribute } from '@ohos.arkui.WithEnv';

@ObservedV2
export class CustomValue {
  @Trace defaultVal: string = 'hello';
}

const custom = CustomEnvKey.create<CustomValue>();

@Entry
@Component
struct CustomEnvV1ToV2 {
  @CustomEnv('custom') defaultMessage: CustomValue = new CustomValue();

  build() {
    Column() {
      Text(this.defaultMessage.defaultVal)
        .id('customEnvV1ToV2_001')
        .height('5%')
        .fontSize(20)
      Button('update')
        .id('customEnvV1ToV2_002')
        .height('5%')
        .onClick(() => {
          this.defaultMessage.defaultVal = 'hello world';
        })
      Child({ message: this.defaultMessage })
        .id('customEnvV1ToV2_003')
        .height('5%')
    }
    .height('100%')
    .width('100%')
  }
}

@ComponentV2
struct Child {
  @Require @Param message: CustomValue;

  build() {
    Column() {
      Text(`Child Value is : ${this.message.defaultVal}`)
        .id('customEnvV1ToV2_004')
        .height('5%')
        .fontSize(20)
    }
    .height('100%')
    .width('100%')
  }
}
