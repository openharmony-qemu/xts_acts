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
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  TextTimerController,
  TextTimer
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TextTimerPage {
  @State isCountDown: boolean = true
  @State count: long = 50000
  @State format: string = 'mm:ss.SS'
  @State start: string = ''
  @State pause: string = ''
  @State reset: string = ''
  @State utc: number = 0
  @State elapsedTime: number = 0
  textTimerController: TextTimerController = new TextTimerController()
  messageManager: MessageManager<number | string | long> = new MessageManager<number | string | long>()
  messageManagerBoolean: MessageManager<boolean> = new MessageManager<boolean>()

  onPageShow() {
    console.info('TextTimer onPageShow')
    AppStorage.setOrCreate<MessageManager<number | string | long >>("messageManager", this.messageManager);
    let callback: Callback<number | string | long> = (message: Message<number | string | long>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'count') {
        this.count = message.value as long
      }
      if (message.name == 'format') {
        this.format = message.value as String
      }
      if (message.name == 'start') {
        this.start = message.value as String
      }
      if (message.name == 'pause') {
        this.pause = message.value as String
      }
      if (message.name == 'reset') {
        this.reset = message.value as String
      }
    }
    this.messageManager.registerCallback(callback)

    AppStorage.setOrCreate<MessageManager<boolean>>("messageManagerBoolean", this.messageManagerBoolean);
    let callback1: Callback<boolean> = (message: Message<boolean>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'isCountDown') {
        this.isCountDown = message.value
      }
    }
    this.messageManagerBoolean.registerCallback(callback1)
  }

  build() {
    Column() {
      TextTimer({ controller: this.textTimerController })
        .fontColor(Color.Black)
        .key('default')
        .id('default')
        .fontSize(40)
        .onTimer((utc: long, elapsedTime: long) => {
          console.info('textTimer notCountDown utc is：' + utc + ', elapsedTime: ' + elapsedTime)
        })
        .height('20%')
      TextTimer({ controller: this.textTimerController, isCountDown: this.isCountDown, count: this.count })
        .format(this.format)
        .fontColor(Color.Black)
        .key('textTimer')
        .id('textTimer')
        .fontSize(50)
        .onTimer((utc: long, elapsedTime: long) => {
          this.utc = utc
          this.elapsedTime = elapsedTime
          console.info('textTimer notCountDown utc is：' + utc + ', elapsedTime: ' + elapsedTime)
        })
        .height('20%')
      Row() {
        Text('start:' + this.start).fontSize(20).key('start').id('start').width('45%')
        Text('pause:' + this.pause).fontSize(20).key('pause').id('pause').width('45%')
      }.height('10%')

      Row() {
        Text('reset:' + this.reset).fontSize(20).key('reset').id('reset').width('45%')
        Text(this.utc.toString()).fontSize(20).key('utcNum').id('utcNum').width('45%')
      }.height('10%')

      Text(this.elapsedTime.toString()).fontSize(20).margin(10).key('elapsedTime').id('elapsedTime').height('10%')
      Row() {
        Button("start").onClick((e: ClickEvent) => {
          console.log('start===========')
          this.start = 'succ'
          this.textTimerController.start()
        })
        Button("pause").onClick((e: ClickEvent) => {
          console.log('pause===========')
          this.pause = 'succ'
          this.textTimerController.pause()
        })
        Button("reset").onClick((e: ClickEvent) => {
          console.log('reset===========')
          this.reset = 'succ'
          this.textTimerController.reset()
        })
      }.height('10%')
    }.width('100%').height('100%')
  }
}