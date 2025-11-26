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
import { Demo01 } from './AtomicServiceSearchDemo01'
import { Demo02 } from './AtomicServiceSearchDemo02'
import { Demo03 } from './AtomicServiceSearchDemo03'
import { Demo04 } from './AtomicServiceSearchDemo04'
import { Demo05 } from './AtomicServiceSearchDemo05'
import {
  Entry,
  Component,
  Scroll,
  Column,
  Text,
  Color,
  Margin,
  TextDecorationType,
  TextDecorationStyle,
  Button,
  ButtonType,
  Alignment,
  ClickEvent,
  Padding,
  ForEach
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct AtomicServiceSearchTest {
  @State arr: double[] | Int[] = [1, 2, 3]
  @State current: number = 1
  @State selectWhich: number = 1;
  @State simpleList: Array<string> = [
    'Demo01：AtomicServiceSearchDemo01',
    'Demo02：AtomicServiceSearchDemo02',
    'Demo03：AtomicServiceSearchDemo03',
    'Demo04：AtomicServiceSearchDemo04',
    'Demo05：AtomicServiceSearchDemo05',
  ];

  build() {
    Scroll() {
      Column() {
        Text('AtomicServiceSearch').margin({ top: 40 } as Margin).decoration({
          type: TextDecorationType.Underline,
          color: Color.Black,
          style: TextDecorationStyle.SOLID
        })

        Scroll() {
          Column() {
            ForEach(this.simpleList, (item: string, index: int) => {
              Button(item)
                .width('100%')
                .height(30)
                .margin({ top: 5 } as Margin)
                .type(ButtonType.Normal)
                .borderRadius(10)
                .backgroundColor(this.selectWhich === index + 1 ? '#808080' : '#75878a')
                .align(Alignment.Start)
                .fontColor(Color.Black)
                .onClick((e: ClickEvent) => {
                  this.selectWhich = index + 1;
                })
            }, (item: string) => item)
          }.width('100%');
        }.height(180).margin({ bottom: 15 } as Margin);

        if (this.selectWhich === 1) {
          Demo01()
        }
        if (this.selectWhich === 2) {
          Demo02()
        }
        if (this.selectWhich === 3) {
          Demo03()
        }
        if (this.selectWhich === 4) {
          Demo04()
        }
        if (this.selectWhich === 5) {
          Demo05()
        }

      }.padding({ left: 16, right: 16 } as Padding)
    }

  }

  // private alert(message: string): void {
  //   AlertDialog.show({
  //     message: message
  //   })
  // }
}
