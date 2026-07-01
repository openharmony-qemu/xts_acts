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

import {
  Entry, ComponentV2, Column, CustomEnv, Text, CustomEnvKey, FlexAlign,
} from '@kit.ArkUI';

const envKeyUndefProbe = CustomEnvKey.create<undefined>();
const envKeyUndef = CustomEnvKey.create<string>();
const envKeyMissing = CustomEnvKey.create<string>();

@Entry
@ComponentV2
struct CustomEnvKeyAbnormalPage {
  build() {
    Column() {
      CustomEnvKeyAbnormalChild()
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@ComponentV2
struct CustomEnvKeyAbnormalChild {
  @CustomEnv('envKeyUndef') propUndef: string = 'undef-default';
  @CustomEnv('envKeyMissing') propMissing: string = 'missing-default';

  build() {
    Column() {
      Text('undef:' + this.propUndef).id('key_abn_undef')
      Text('missing:' + this.propMissing).id('key_abn_missing')
    }
    .width('100%')
    .height('100%')
  }
}
