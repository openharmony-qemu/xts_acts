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
import { Entry, Row, ComponentV2, Column, Text, Button, CustomEnv, Local, IMonitor, Monitor, CustomEnvKey } from '@kit.ArkUI';
import { WithEnv, WithEnvAttribute } from '@ohos.arkui.WithEnv';

const custom = CustomEnvKey.create<string>();

@Entry
@ComponentV2
struct CustomEnvMonitor {
  @Local message: string = 'Hello';
  @Local num1: int =1;

  build() {
    Row() {
      Column() {
        Button('change message')
          .id('customenvMonitor_001')
          .height('5%')
          .onClick(() => {
            this.message = 'Hello World';
          })
        WithEnv() {
          Child()
        }.customEnv(custom, this.message)
      }
      .width('100%')
    }
    .height('100%')
  }
}

@ComponentV2
struct Child {
  @CustomEnv('custom') message: string = 'CustomEnv';num1: int = 2

  @Monitor(['message','num1'])
  onStrChange(m: IMonitor) {
    m.dirty.forEach((path: string) => {
      this.num1++
      console.info(`[CustomEnv] value ${path} has changed from ${m.value<string>(path)?.before} to ${m.value<string>(path)?.now}`);
    })
  }

  build() {
    Column() {
      Text(`message:${this.message},${this.num1}`)
        .id('customenvMonitor_002')
        .height('5%')
    }
  }
}
