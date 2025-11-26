'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  XComponent,
  XComponentOptions
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { Hypium } from '../../../../hypium/hypium';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import testsuite from '../../../../main/src/test/List.test';

@Entry
@Component
struct XComponentTest {
  //private xcomponentContext1: Record<string, () => object> = {};
  //private xcomponentContext2: Record<string, () => object> = {};
  private xcomponentId1: string = 'xcomponentId1';
  private xcomponentId2: string = 'xcomponentId2';
  @State private isHidden: boolean = false;
  @State private changeSize: boolean = true;
  @State private flag: boolean = true;
  @State private xcomponentHeight: number = 300;
  @State private xcomponentWidth: number = 720;
  private offset_x: number = 0.000;
  private offset_y: number = 610.000;
  private index: number = 0;
  private callback_: number = 0;
  private type_: number = 5;
  private touchTypeDown: number = 0;
  private touchTypeUp: number = 1;
  private touchTypeMove: number = 2;
  private touchTypeCancel: number = 3;

  aboutToAppear() {
    setTimeout(() => {
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      let abilityDelegatorArguments = abilityDelegatorRegistry.getArguments()
      console.info('start run testcase!!!')
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
    }, 2000)
  }

  onPageShow() {
      console.info("xclog start run testcase!!!!");
  }

  build() {
    Flex({direction: FlexDirection.Column,alignItems: ItemAlign.Center}) {
      Button('ChangeColor')
        .key('changeXcColor')
        .onClick((e:ClickEvent) => {
          // if (this.xcomponentContext1) {
          //   this.xcomponentContext1.changeColor();
          // }
        })
        .width('300px')
        .height('60px')
      Button('ChangeShape')
        .onClick((e:ClickEvent) => {
          // if (this.xcomponentContext1) {
          //   this.xcomponentContext1.changeShape();
          //   console.info('xclog changshape1');
          // }
        })
        .width('300px')
        .height('60px')

      // XComponent({ id: this.xcomponentId1, type: 'texture', libraryname: 'nativerender'})
      //   .onLoad((context: Record<string, () => object>) => {
      //     console.info("xclog xcomponent1 build");
      //     this.xcomponentContext1 = context;
      //     AppStorage.setOrCreate<Record<string, () => object>>('xcomponentContext1',this.xcomponentContext1);
      //     AppStorage.setOrCreate<string>('xcomponentId1',this.xcomponentId1);
      //     AppStorage.setOrCreate<number>('xcomponentHeight',this.xcomponentHeight) ;
      //     AppStorage.setOrCreate<number>('xcomponentWidth',this.xcomponentWidth);
      //     AppStorage.setOrCreate<number>('touchTypeDown',this.touchTypeDown);
      //     AppStorage.setOrCreate<number>('touchTypeUp',this.touchTypeUp);
      //     AppStorage.setOrCreate<number>('type_',this.type_);
      //     AppStorage.setOrCreate<number>('index',this.index);
      //     AppStorage.setOrCreate<number>('touchTypeMove',this.touchTypeMove);
      //     AppStorage.setOrCreate<number>('touchTypeCancel',this.touchTypeCancel);
      //     AppStorage.setOrCreate<number>('offset_x',this.offset_x);
      //     AppStorage.setOrCreate<number>('offset_y',this.offset_y);
      //   })
      //   .width(this.xcomponentWidth+'px')
      //   .height(this.xcomponentHeight+'px')
      //   .key('xc_num1')
      //   .onDestroy((event:() => void) => {
      //     AppStorage.setOrCreate<boolean>('flag', false);
      //     console.info("xclog xcomponet flag: " + globalThis.flag);
      //   })

      Button('ChangeXComponentSizeTest')
        .key('changeXcSize')
        .width('300px')
        .height('60px')
        .onClick( (e:ClickEvent) => {

          if (this.changeSize) {
            this.xcomponentHeight = 250;

          } else
          {
            this.xcomponentHeight = 300;
          }
          this.changeSize = !this.changeSize;
        })

      Button('ChangeColor')
        .onClick((e:ClickEvent) => {
          // if (this.xcomponentContext2) {
          //   this.xcomponentContext2.changeColor();
          // }
        })
        .width('300px')
        .height('60px')

      Button('ChangeShape')
        .onClick((e:ClickEvent) => {
          // if (this.xcomponentContext2) {
          //   this.xcomponentContext2.changeShape();
          // }
        })
        .width('300px')
        .height('60px')

      // XComponent({ id: this.xcomponentId2, type: 'texture', libraryname: 'nativerender'})
      //   .onLoad((context: Record<string, () => object>) => {
      //     console.info("xclog xcomponent_2 build");
      //     this.xcomponentContext2 = context;
      //     AppStorage.setOrCreate<Record<string, () => object>>('xcomponentContext2', this.xcomponentContext2);
      //     AppStorage.setOrCreate<string>('xcomponentId2', this.xcomponentId2);
      //     AppStorage.setOrCreate<number>('xcomponentHeight',this.xcomponentHeight);
      //     AppStorage.setOrCreate<number>('callback_',this.callback_);
      //     AppStorage.setOrCreate<number>('xcomponentWidth', this.xcomponentWidth);
      //     AppStorage.setOrCreate<number>('offset_x',this.offset_x);
      //     AppStorage.setOrCreate<number>('offset_y',this.offset_y);
      //   })
      //   .width(this.xcomponentWidth+'px')
      //   .height(this.xcomponentHeight+'px')
      //   .onDestroy(() => {
      //   })
    }
    .width('720px')
    .height('1200px')
  }
}