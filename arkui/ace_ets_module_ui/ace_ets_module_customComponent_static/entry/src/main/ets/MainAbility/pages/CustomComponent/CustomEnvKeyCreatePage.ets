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

const envKeyStr = CustomEnvKey.create<string>();
const envKeyNum = CustomEnvKey.create<number>();
const envKeyBool = CustomEnvKey.create<boolean>();

@Entry
@ComponentV2
struct CustomEnvKeyCreatePage {
  build() {
    Column() {
      CustomEnvKeyCreateChild()
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@ComponentV2
struct CustomEnvKeyCreateChild {
  @CustomEnv('envKeyStr') propStr: string = 'str-default';
  @CustomEnv('envKeyNum') propNum: number = -1;
  @CustomEnv('envKeyBool') propBool: boolean = false;

  build() {
    Column() {
      Text('str:' + this.propStr).id('key_create_str')
      Text('num:' + this.propNum).id('key_create_num')
      Text('bool:' + this.propBool).id('key_create_bool')
    }
    .width('100%')
    .height('100%')
  }
}
