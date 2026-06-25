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

'use static';
import {
  Button, ClickEvent, Column, Entry, PersistenceV2, Text, Local,
  ObservedV2, Trace, ComponentV2,
} from '@kit.ArkUI';

@ObservedV2
class SubRecord {
  @Trace public tag: string = 'sub-init';
}

@ObservedV2
class RootRecord {
  @Trace public title: string = 'root';
  @Trace public sub: SubRecord = new SubRecord();
}

function makeSubCreators(): Map<Class, () => object> {
  let creators = new Map<Class, () => object>();
  creators.set(Class.from<SubRecord>(), (): object => new SubRecord());
  return creators;
}

@Entry
@ComponentV2
struct PersistenceV2DefaultSubCreators {
  @Local root: RootRecord = PersistenceV2.globalConnect<RootRecord>({
    type: Class.from<RootRecord>(),
    key: 'RootWithSubCreators',
    defaultCreator: (): RootRecord => new RootRecord(),
    defaultSubCreators: makeSubCreators(),
  })!;

  build() {
    Column() {
      Text(`title:${this.root.title}`).id('text_root_title')
      Text(`sub:${this.root.sub.tag}`).id('text_sub_tag')
      Button('touch-sub')
        .id('btn_touch_sub')
        .onClick((_e: ClickEvent) => {
          this.root.sub.tag += 'X';
        })
    }
    .width('100%')
    .height('100%')
    .padding(16)
  }
}
