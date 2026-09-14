'use static';
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
import { Entry, Component, Column, Text, ClickEvent, UIUtils, Button } from '@kit.ArkUI';

export interface Info {
  name: string,
  age: int
}

export interface Person {
  info: Info
}

@Entry
@Component
struct SVDeepListenMakeObserved {
  // 深度观察
  person: Person = UIUtils.makeObserved({ info: { name: 'Jack', age: 25 } as Info } as Person) as Person;

  build() {
    Column() {
      Text(`allowDeep(true)info.name: ${this.person.info.name}`)
        .id('allowDeep_true_infoNameText')
        .height('5%')
      Button('change name')
        .id('allowDeep_true_changNameButton')
        .height('5%')
        .onClick(() => {
          this.person.info.name = 'Jackson'; // 由于是深度观察，第二层属性变化也会触发刷新。
        })
      Button('replace info')
        .id('replaceInfoButton')
        .height('5%')
        .onClick(() => {
          this.person.info = { name: 'Tom', age: 25 } as Info; // 触发刷新，属于第一层属性变化
        })

    }
  }
}