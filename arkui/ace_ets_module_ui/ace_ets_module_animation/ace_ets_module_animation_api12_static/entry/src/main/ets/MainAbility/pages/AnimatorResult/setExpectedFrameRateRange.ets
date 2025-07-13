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
import animator, { AnimatorResult, AnimatorOptions  } from '@ohos.animator';
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
  Scroll
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
class ExpectedFrameRate implements ExpectedFrameRateRange{
  min: number = 0
  max: number = 0
  expected: number = 0
  constructor(min: number,max: number,expected: number) {
    this.min = min;
    this.max = max;
    this.expected = expected;
  }
}

@Entry
@Component
struct expectedFrameRateExample {
  private TAG: string = '[AnimatorTest]';
  private backAnimator: AnimatorResult | undefined = undefined;
  private flag: boolean = false;
  @State wid: number = 100;
  @State hei: number = 100;
  @State minText: string = '';
  @State maxText: string = '';
  private expectedFrameRate: ExpectedFrameRate = new ExpectedFrameRate(0,120,30)

  create() {
    let _this = this
    let options: AnimatorOptions  = {
      duration: 2000,
      easing: "ease",
      delay: 0,
      fill: "forwards",
      direction: "normal",
      iterations: 1,
      begin: 100,
      end: 200
    }
    this.backAnimator  = animator.create(options)
    if(this.backAnimator){
      this.backAnimator!.setExpectedFrameRateRange(_this.expectedFrameRate);
      this.backAnimator!.onFinish = () => {
        _this.flag = true
        console.info(_this.TAG, 'backAnimator onfinish')
      }
      this.backAnimator!.onRepeat = () => {
        console.info(_this.TAG, 'backAnimator repeat')
      }
      this.backAnimator!.onCancel = () => {
        console.info(_this.TAG, 'backAnimator cancel')
      }
      this.backAnimator!.onFrame = (value: number) => {
        _this.wid = value
        _this.hei = value
        this.minText = _this.expectedFrameRate.min + ''
        this.maxText = _this.expectedFrameRate.max + ''
      }
    }


  }
  aboutToDisappear() {
    // 由于backAnimator在onframe中引用了this, this中保存了backAnimator，
    // 在自定义组件消失时应该将保存在组件中的backAnimator置空，避免内存泄漏
    this.backAnimator = undefined;
  }

  @State text: string = ''

  build() {
    Scroll() {
      Column() {
        Column() {
          Column()
            .width(this.wid)
            .height(this.hei)
            .backgroundColor(Color.Red)
            .id('img')
        }
        .width('100%')
        .height(100)

        Column() {
          Text(this.minText)
            .id('min')
          Text(this.maxText)
            .id('max')
          Row() {
            Button('create')
              .id('create')
              .fontSize(30)
              .fontColor(Color.Black)
              .onClick((e: ClickEvent) => {
                this.create()
              })
          }
          .padding(10)

          Row() {
            Button('play')
              .id('play')
              .fontSize(30)
              .fontColor(Color.Black)
              .onClick((e: ClickEvent) => {
                this.flag = false
                if (this.backAnimator) {
                  this.backAnimator!.play()
                }
              })
          }
          .padding(10)

          Row() {
            Button('pause')
              .fontSize(30)
              .fontColor(Color.Black)
              .onClick((e: ClickEvent) => {
                if (this.backAnimator) {
                  this.backAnimator!.pause()
                }
              })
          }
          .padding(10)

          Row() {
            Button('finish')
              .fontSize(30)
              .fontColor(Color.Black)
              .onClick((e: ClickEvent) => {
                this.flag = true
                if (this.backAnimator) {
                  this.backAnimator!.finish()
                }
              })
          }
          .padding(10)
        }
      }
    }
  }
}