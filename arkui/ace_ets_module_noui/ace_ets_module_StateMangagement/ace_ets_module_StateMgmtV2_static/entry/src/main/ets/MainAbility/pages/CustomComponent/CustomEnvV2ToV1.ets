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
import { Entry, Row, ComponentV2, Component, Column, Text, Button, CustomEnv, ObservedV2, Trace, Require, PropRef, CustomEnvKey } from '@kit.ArkUI';
import { WithEnv, WithEnvAttribute } from '@ohos.arkui.WithEnv';

@ObservedV2
export class CustomValue {
  @Trace defaultVal: string = 'hello';
}

const custom = CustomEnvKey.create<string>();
const customObj = CustomEnvKey.create<CustomValue>();

@Entry
@ComponentV2
struct CustomEnvV2ToV1 {
  @CustomEnv('custom') defaultMessage: string = 'parent Value';
  @CustomEnv('customObj') defaultObj: CustomValue = new CustomValue();

  build() {
    Column() {
      Text(`Parent Value is :${this.defaultMessage}`)
        .id('customEnvV2ToV1_001')
        .height('5%')
        .fontSize(20)
      Child({ message: this.defaultMessage })
        .id('customEnvV2ToV1_002')
        .height('5%')
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct Child {
  @Require @PropRef message: string;

  build() {
    Column() {
      Text(`Child value is :${this.message}`)
        .id('customEnvV2ToV1_003')
        .height('5%')
        .fontSize(20)
    }
    .height('100%')
    .width('100%')
  }
}
