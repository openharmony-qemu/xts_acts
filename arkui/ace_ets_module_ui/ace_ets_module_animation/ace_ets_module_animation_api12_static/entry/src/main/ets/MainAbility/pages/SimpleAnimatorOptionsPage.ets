/**
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
import animator, { AnimatorResult, AnimatorOptions, SimpleAnimatorOptions,PlayMode,FillMode } from '@ohos.animator';
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,
  Color,
  FlexAlign,
  ExpectedFrameRateRange,
  Scroll,
  ColumnOptions,
  Margin,
  AnimateParam
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import curves from '@ohos.curves';
import router from '@ohos.router';
import common from '@ohos.app.ability.common';
@Entry
@Component
struct SimpleAnimatorOptionsPage {
  private backAnimator: AnimatorResult | undefined = undefined
  @State cube_size: number = 50

  @State animator_duration:number = 3000;
  @State animator_delay:number = 0;
  @State animator_iterations:number = 1;
  @State animator_ease:string = 'ease';
  @State animator_direction: PlayMode = PlayMode.Normal;
  @State animator_fill:FillMode = FillMode.Backwards;
  @State startTime: number = 0;
  @State endTime: number = 0;
  @State testTime: number = 0;
  create(){
    if(this.backAnimator) {
      this.backAnimator!.finish();
    }

    this.backAnimator = animator.create(
      new SimpleAnimatorOptions(100, 200)
        .duration(this.animator_duration)
        .delay(this.animator_delay)
        .fill(this.animator_fill)
        .easing('ease')
        .iterations(this.animator_iterations)
        .direction(this.animator_direction)
    )

    if(!this.backAnimator) {
      return
    }

    this.backAnimator!.onFrame = (value:number) => {
      this.cube_size = value/2
    }

    this.backAnimator!.onFinish = ()=>{
      this.endTime = new Date().getTime();
      this.testTime = this.endTime - this.startTime;
      AppStorage.setOrCreate('testTime', this.testTime, Type.from<number>());
      AppStorage.setOrCreate('cube_size', this.cube_size, Type.from<number>());
    }

  }
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Column(){
      }.width(this.cube_size).height(this.cube_size).backgroundColor(Color.Black)

      Button('Play').onClick((e: ClickEvent)=>{
        this.create()
        this.backAnimator?.play()
        this.startTime = new Date().getTime();
      })
        .id('playId')
        .height('5%')

      Button('recover').onClick((e: ClickEvent) => {
        this.animator_duration = 1000;
        this.animator_delay = 0;
        this.animator_iterations = 1;
        this.startTime = 0;
        this.endTime = 0;
        this.animator_fill = FillMode.Backwards;
        this.cube_size = 50;
      }).id('recoverId').height('5%')

      Button('changeFillMode').onClick((e: ClickEvent)=> {
        this.animator_fill = FillMode.Forwards
      }).id('changeFillMode').height('5%')

      Button('changeDelay').onClick((e: ClickEvent)=>{
        this.animator_delay = 1000.5;
      }).id('changeDelayId').height('5%')

      Button('changeIterations').onClick((e: ClickEvent)=> {
        this.animator_iterations = 5;
      }).id('changeIterationsId').height('5%')

      Button('changeDirection').onClick((e: ClickEvent)=> {
        this.animator_fill = FillMode.Both;
        this.animator_direction = PlayMode.Alternate;
      }).id('changeDirectionId').height('5%')
    }
    .width('100%')
    .margin({ top: 15 } as Margin)
  }
}