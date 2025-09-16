
/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import {UIContext} from '@ohos.arkui.UIContext';
import { NodeController, FrameNode, ComponentContent, typeNode } from '@kit.ArkUI';
import common from '@ohos.app.ability.common';
import { Entry, Column, Component, Flex, ClickEvent, Scroller, Color,ResourceColor, OnScrollFrameBeginHandlerResult, Row,
  Image, TextAlign, Scroll, ScrollState, ForEach, EdgeEffect, FontWeight, Margin, Length, LocalizedMargin, FontStyle, Builder,
  Text, Button, ClickEvent, List, ListItem, ListItemGroup, BarState, Padding, TextDecorationType, wrapBuilder} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

class Params {
  public text: string = ""
  public fontColor: ResourceColor = Color.Red
  public fontSize: string | double = 16
  public fontWeight: int | FontWeight | string = FontWeight.Normal
  public margin: Margin | Length | LocalizedMargin = 10
  public fontStyle: FontStyle | undefined = FontStyle.Normal
  public type: number

  constructor(text: string, fontColor: ResourceColor, fontSize: string | double,
    fontWeight: int | FontWeight | string, margin: Margin | Length | LocalizedMargin,
    fontStyle: FontStyle | undefined , type: number){
    this.text = text;
    this.fontColor = fontColor;
    this.fontSize = fontSize;
    this.fontWeight = fontWeight;
    this.margin = margin;
    this.fontStyle = fontStyle || FontStyle.Normal;
    this.type = type;
  }
}

@Builder
function buildTest(params: Params){
  Column() {
    Text(params.text)
      .key('buildTest' + params.type)
      .fontColor(params.fontColor)
      .fontSize(params.fontSize)
      .fontWeight(params.fontWeight)
      .margin(params.margin)
      .fontStyle(params.fontStyle)
      .decoration({ type: TextDecorationType.None, color: '#4B0082' })
  }
}

@Entry
@Component
struct Index {
  aboutToAppear(){
    console.info('start run testcase!!!!')
    console.info('start run testcase!!!')
  }

  private timeTable: TimeTable[] = [
    {
      title: '星期一',
      projects: ['语文', '数学', '英语']
    } as TimeTable,
  ]

  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  @State isDark: boolean = false;
  uicontext: UIContext = this.getUIContext()
  build() {
    Scroll() {
      Row() {
        Column() {
          List({ space: 5 }) {
            ForEach(this.timeTable, (item: TimeTable) => {
              ListItemGroup({
              }) {
                ForEach(item.projects, (project: string) => {
                  ListItem() {
                    Text(project)
                      .width("100%")
                      .height(100)
                      .fontSize(20)
                      .textAlign(TextAlign.Center)
                      .backgroundColor(0xFFFFFF)
                  }
                }, (item: string) => item)
              }
              .divider({ strokeWidth: 1, color: Color.Blue })
            })
          }
          .scrollBar(BarState.Off)
          .width('100%')
          .height('50%')
          .backgroundColor(0xDCDCDC)
          .padding({ top: 5 } as Padding)

          List({ space: 5 }) {
            ForEach(this.timeTable, (item: TimeTable) => {
              ListItemGroup({

              }) {
                ForEach(item.projects, (project: string) => {
                  ListItem() {
                    Text(project)
                      .width("100%")
                      .height(100)
                      .fontSize(20)
                      .textAlign(TextAlign.Center)
                      .backgroundColor(0xFFFFFF)
                  }
                }, (item: string) => item)
              }
              .divider({ strokeWidth: 1, color: Color.Blue }) // 每行之间的分界线
            })
          }
          .scrollBar(BarState.Off)
          .width('100%')
          .height('50%')
          .backgroundColor(0xDCDCDC)
          .padding({ top: 5 } as Padding)
        }
      }
    }
  }
}
interface TimeTable {
  title: string;
  projects: string[];
}

