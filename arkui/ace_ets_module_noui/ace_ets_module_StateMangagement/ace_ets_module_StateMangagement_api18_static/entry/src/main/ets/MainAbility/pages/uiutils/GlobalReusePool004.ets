'use static';
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
import {
  UIUtils,
  IReusableInfo,
  ReusableV2,
  ComponentV2,
  Param,
  Text,
  Reusable,
  Component,
  Consume,
  Link,
  LocalStoragePropRef,
  State,
  Provide,
  PropRef,
  StoragePropRef,
  ObjectLink,
  Entry,
  Local,
  Column,
  Button,
  Consumer,
  AppStorage,
  Color,
  Provider,
  Observed,
  Track,
  ReuseObject
} from '@kit.ArkUI';


@Observed
class V1ObjectLink {
  @Track public age: number;
  constructor(age: number) {
    this.age = age;
  }
}



@Reusable
@Component
struct SubChildGlobalV1 {
  @Link v1Link: number;
  @Consume('ee') v1Provide: number = 10;
  @LocalStoragePropRef('ww') v1LocalStoragePropRef: number = 10;
  @State v1State: number = 10;
  @PropRef v1PropRef: number = 10;
  @StoragePropRef('qq') v1StoragePropRef: number = 10;
  @ObjectLink v1ObjectLink:V1ObjectLink
  @Provide provideTest: number = 10;

  aboutToAppear(){
    console.info('SubChildGlobalV1 aboutToAppear')
  }
  aboutToReuse(params: ReuseObject) {
    AppStorage.setOrCreate('GlobalReuse004', true)
    console.info('SubChildGlobalV1 aboutToReuse');
  }

  aboutToRecycle() {
    console.info('SubChildGlobalV1 aboutToRecycle');
  }

  aboutToDisappear() {
    console.info('SubChildGlobalV1 aboutToDisappear');
  }

  build() {
    Column(){
      Text(`SubChildGlobalV1  @Consume: ${this.v1Provide},@Link: ${this.v1Link},@LocalStoragePropRef: ${this.v1LocalStoragePropRef},@Provide: ${this.v1Provide},@State: ${this.v1State},@PropRef: ${this.v1PropRef},@StoragePropRef: ${this.v1StoragePropRef},@ObjectLink: ${this.v1ObjectLink.age}`)
        .id('SubChildGlobalV1_001')
        .height('5%')
        .margin({
          top: 10,
          left: 10,
          bottom: 20,
          right: 10
        })
      Button('装饰器数据修改')
        .height('5%')
        .margin({
          top: 20,
          left: 10,
          bottom: 20,
          right: 10
        })
        .id('SubChildGlobalV1_002')
        .onClick(() => {
          this.v1Link++;
          this.v1Provide++;
          this.v1ObjectLink.age++;
          this.v1PropRef++;
          this.v1State++;


        })
    }


  }
}

@Entry
@Component({ reusePool: ReusePoolOwnership.PER_INSTANCE, poolAccepts: ['SubChildGlobalV1'] })
struct GlobalReuse004 {
  @State v1State: number = 100;
  @State boolVal: boolean = false;


  build() {
    Column() {
      Button('切换组件')
        .height('5%')
        .id('GlobalReuse004Change')
        .onClick(() => {
          this.boolVal = !this.boolVal;
        })
      Text(`@State: ${this.v1State}`)
        .id('GlobalReuse004_001')
        .height('5%')
        .margin({
          top: 10,
          left: 10,
          bottom: 20,
          right: 10
        })
      Button('增加 +10')
        .id('GlobalReuse004_002')
        .height('5%')
        .margin({
          top: 10,
          left: 10,
          bottom: 20,
          right: 10
        })
        .onClick(() => {
          this.v1State += 10;
        })

      if (this.boolVal) {
        Text('ChildGlobal001组件')
          .height('5%')
        ChildGlobal001({ v1Link: this.v1State})
      }
    }
  }
}

@Component
struct ChildGlobal001 {
  @Link v1Link: number
  @State v1ObjectLink: V1ObjectLink = new V1ObjectLink(100)
  @State age1: number = 0;
  @State age2: number = 0;
  @State age3: number = 0;
  @State age4: number = 0;
  @Provide({ allowOverride: true, alias: 'ee' }) v1Provide: number = 11;
  aboutToAppear() {
    console.info('ChildGlobal001 aboutToAppear');
  }

  aboutToDisappear() {
    console.info('ChildGlobal001 aboutToDisappear');
  }

  build() {
    Column() {
      Text(`ChildGlobal001 @Link: ${this.v1Link},@v1PropRef: ${this.age1},@v1State: ${this.age2},@v1ObjectLink: ${this.v1ObjectLink.age},@v1Provide: ${this.v1Provide}`)
        .id('ChildGlobal001_001')
        .height('5%')

      Button(`ChildGlobal001 @Link  += 10`)
        .id('ChildGlobal001_005')
        .height('5%')
        .onClick(() => {
          this.v1Link += 10;
        })
      SubChildGlobalV1({v1PropRef:this.age1,v1State:this.age2, v1Link:this.v1Link,v1ObjectLink: this.v1ObjectLink })
    }
  }
}