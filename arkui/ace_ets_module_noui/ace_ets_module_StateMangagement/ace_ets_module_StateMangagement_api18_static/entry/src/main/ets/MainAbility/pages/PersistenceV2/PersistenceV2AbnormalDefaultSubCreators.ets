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
  Column, Entry, PersistenceV2, Text, Local, ObservedV2, Trace, ComponentV2,
} from '@kit.ArkUI';

@ObservedV2
class AbnSubRecord {
  @Trace tag: string = 'abn-sub';
}

@ObservedV2
class AbnRootRecord {
  @Trace title: string = 'abn-root';
  @Trace sub: AbnSubRecord = new AbnSubRecord();
}

@Entry
@ComponentV2
struct PersistenceV2AbnormalDefaultSubCreators {
  @Local rootDefault: AbnRootRecord = PersistenceV2.globalConnect<AbnRootRecord>({
    type: Class.from<AbnRootRecord>(),
    key: 'AbnRootDefSub_d',
    defaultCreator: (): AbnRootRecord => new AbnRootRecord(),
  })!;

  @Local rootUndefined: AbnRootRecord = PersistenceV2.globalConnect<AbnRootRecord>({
    type: Class.from<AbnRootRecord>(),
    key: 'AbnRootDefSub_u',
    defaultCreator: (): AbnRootRecord => new AbnRootRecord(),
    defaultSubCreators: undefined,
  })!;

  build() {
    Column() {
      Text(this.rootDefault.sub.tag).id('text_abn_sub_d')
      Text(this.rootUndefined.sub.tag).id('text_abn_sub_u')
    }
    .width('100%')
    .height('100%')
    .padding(16)
  }
}
