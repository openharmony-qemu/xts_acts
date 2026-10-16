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
@ObservedV2
class CustomVal {
  @Trace public id: number = 123;
  @Trace public userName: string = 'admin';
}

const customStr = CustomEnvKey.create<string>();
const customNum = CustomEnvKey.create<number>();
const customBool = CustomEnvKey.create<boolean>();
const customObj = CustomEnvKey.create<CustomVal>();

@Entry
@ComponentV2
struct CustomEnvMultiType {
  @CustomEnv(customStr) customStrVarName: string = 'hello world';
  @CustomEnv(customNum) customNumVarName: number = 1;
  @CustomEnv(customBool) customBoolVarName: boolean = true;
  @CustomEnv(customObj) customObjVarName: CustomVal = new CustomVal();

  build() {
    Row() {
      Column() {
        Text(`customStrVarName type is ${typeof this.customStrVarName}`)
          .id('customEnvMultiType_dynamic_001')
          .height('5%')
          .margin(5)
        Text(`customNumVarName type is ${typeof this.customNumVarName}`)
          .id('customEnvMultiType_dynamic_002')
          .height('5%')
          .margin(5)
        Text(`customBoolVarName type is ${typeof this.customBoolVarName}`)
          .id('customEnvMultiType_dynamic_003')
          .height('5%')
          .margin(5)
        Text(`customObjVarName type is ${typeof this.customObjVarName}`)
          .id('customEnvMultiType_dynamic_004')
          .height('5%')
          .margin(5)
      }
      .width('100%')
    }
    .height('100%')
  }
}
