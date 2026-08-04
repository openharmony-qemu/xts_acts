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

import { uiObserver, window,display, WithEnv, WithEnvAttribute } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';
import { common } from '@kit.AbilityKit';

const testKey = CustomEnvKey.create<string | number>();
const testKey1 = CustomEnvKey.create<number>();
const testKey2 = CustomEnvKey.create<boolean>();
const testKey3 = CustomEnvKey.create<undefined>();
const testKey4 = CustomEnvKey.create<null>();
const testKey5 = CustomEnvKey.create<number>();
const testKey6 = CustomEnvKey.create<number>();
const testKey7 = CustomEnvKey.create<TestEnum>();
const testKey8 = CustomEnvKey.create<customEnvObj>();
const testKey9 = CustomEnvKey.create<Array<string>>();
const testKey10 = CustomEnvKey.create<CustomEnvValue>();
const testKey11 = CustomEnvKey.create<string>();

enum TestEnum {
  Enum1 = 'enum1',
  Enum2 = 'enum2'
}

interface customEnvObj {
  aa: string
}

class CustomEnvValue {
  public id: number = 123
  public username: string = 'class pass'
}

@Entry
@ComponentV2
struct Index {
  @Local num1: string = 'WithEnv传递值'
  @Local num2: customEnvObj = { aa:'11' }
  @Local unionVal: string | number = 999;
  @Local undefValue: undefined = undefined;
  @Local numVal: number = 123;
  @Local boolVal: boolean = true;
  @Local undefVal: undefined = undefined;
  @Local nullVal: null = null;
  @Local zeroVal: number = 0;
  @Local negativeVal: number = -123;
  @Local enumVal: TestEnum = TestEnum.Enum1;
  @Local objVal: customEnvObj = { aa: '初始对象值' };
  @Local arrayVal: Array<string> = ['1', '2', '3'];
  @Local classVal: CustomEnvValue = new CustomEnvValue();
  @Local stringVal: string = '初始字符串值';

  @Local isFirstState: boolean = true;

  build() {
    Column() {
      Button('update')
        .id('CustomEnvBtn')
        .fontSize(10)
        .onClick(()=> {
          this.undefValue = undefined;
          this.unionVal = this.isFirstState ?'union pass': '更新后的联合值';
          this.numVal = this.numVal === 123 ? 456 : 123;
          this.boolVal = !this.boolVal;
          this.zeroVal = this.zeroVal === 0 ? 100 : 0;
          this.negativeVal = this.negativeVal === -123 ? -456 : -123;
          this.enumVal = this.enumVal === TestEnum.Enum1 ? TestEnum.Enum2 : TestEnum.Enum1;
          this.objVal = { aa: this.objVal.aa === '初始对象值' ? 'object pass' : '初始对象值' };
          this.arrayVal.push('newvalue')
          this.classVal = this.classVal.id === 123
            ? { id: 456, username: '更新后的类实例' }
            : { id: 123, username: 'class pass' };
          this.stringVal = this.stringVal === '初始字符串值' ? 'string pass' : '初始字符串值';
          this.isFirstState = !this.isFirstState;
          this.nullVal = null;
        })

      WithEnv() {
        Child()
      }
      .customEnv(testKey8, this.num2)
      .customEnv(testKey, this.unionVal)
      .customEnv(testKey1, this.numVal)
      .customEnv(testKey2, this.boolVal)
      .customEnv(testKey3, this.undefVal)
      .customEnv(testKey4, this.nullVal)
      .customEnv(testKey5, this.zeroVal)
      .customEnv(testKey6, this.negativeVal)
      .customEnv(testKey7, this.enumVal)
      .customEnv(testKey8, this.objVal)
      .customEnv(testKey9, this.arrayVal)
      .customEnv(testKey10, this.classVal)
      .customEnv(testKey11, this.stringVal)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .margin(5)
    .padding(5)
  }
}

@ComponentV2
struct Child {
  // 联合
  @CustomEnv(testKey) unionType: string | number = 'union pass' + 123;

  // number/boolean/undefined/null
  @CustomEnv(testKey1) numType: number = 123;
  @CustomEnv(testKey2) boolType: boolean = true;
  @CustomEnv(testKey3) undefType: undefined = undefined;
  @CustomEnv(testKey4) nullType: null = null;

  // 0/负数
  @CustomEnv(testKey5) zeroType: number = 0;
  @CustomEnv(testKey6) negativeType: number = -123;

  // enum
  @CustomEnv(testKey7) enumType: TestEnum = TestEnum.Enum1;

  // object
  @CustomEnv(testKey8) objType: customEnvObj  = { aa:'object pass' }

  // build in
  @CustomEnv(testKey9) arrayType: Array<string> = ['1', '2'];

  // class
  @CustomEnv(testKey10) classType: CustomEnvValue = new CustomEnvValue();

  // string
  @CustomEnv(testKey11) correctType: string = 'string pass';

  build() {
    Column() {
      Text('string：' + this.correctType)
        .id('text1')
        .fontSize(10)
      Text('number：' + this.numType)
        .id('text2')
        .fontSize(10)
      Text('boolean：' + this.boolType)
        .id('text3')
        .fontSize(10)
      Text('undefined：' + this.undefType)
        .id('text4')
        .fontSize(10)
      Text('null：' + this.nullType)
        .id('text5')
        .fontSize(10)
      Text('0：' + this.zeroType)
        .id('text6')
        .fontSize(10)
      Text('负数：' + this.negativeType)
        .id('text7')
        .fontSize(10)
      Text('enum：' + this.enumType)
        .id('text8')
        .fontSize(10)
      Text('联合：' + this.unionType)
        .id('text9')
        .fontSize(10)
      Text('build in：' + this.arrayType.join(','))
        .id('text10')
        .fontSize(10)
      Text('class：id=' + this.classType.id + ', username=' + this.classType.username)
        .id('text11')
        .fontSize(10)
      Text('object：' + this.objType.aa)
        .id('text12')
        .fontSize(10)
    }
  }
}