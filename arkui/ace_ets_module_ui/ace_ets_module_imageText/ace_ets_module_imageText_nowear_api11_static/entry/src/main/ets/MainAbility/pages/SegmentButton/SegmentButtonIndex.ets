/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
  Component,
  Column,
  ColumnOptions,
  CopyOptions,
  Text,
  Row,
  Button,
  TextSelectableMode
} from '@ohos.arkui.component'
import {
  State,

} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent, Position } from '@ohos.arkui.component';
import  AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../../../hypium/hypium';
import hilog from '@ohos.hilog';
import testsuite from '../../../../src/test/List.test'


@Entry
@Component
struct Index {
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  @State selectedIndexes1: Array<Double> | Array<Int> = [0]
  @State selectedIndexes2: Array<Double> | Array<Int> = [0]
  @State selectedIndexes3: Array<Double> | Array<Int> = [0]
  @State selectedIndexes4: Array<Double> | Array<Int> = [0]
  @State selectedIndexes5: Array<Double> | Array<Int> = [0]
  @State selectedIndexes6: Array<Double> | Array<Int> = [0]

  build() {
    Row() {
      Column({ space: 10 } as ColumnOptions) {
        
        
        
        
        
        
        Button('pop item').onClick((e:ClickEvent) => {
          
        }).height('5%')
        Button('shift item').onClick((e:ClickEvent) => {
          
        }).height('5%')
        Button('push item').onClick((e:ClickEvent) => {
          
        }).height('5%')
        Button('unshift item').onClick((e:ClickEvent) => {
          
        }).height('5%')
        Button('splice item').onClick((e:ClickEvent) => {
          
        }).height('5%')
        .onAppear(() => {
          let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
          let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
          hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
          hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
          Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
        })
      }
      .width('90%')
      .height('100%')
    }
    .height('100%')
    .position({ x: 10 } as Position)
  }
}