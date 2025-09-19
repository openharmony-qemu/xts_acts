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
import { Entry,NavPathStack,Component,$r,ResourceStr,Builder,List,ListItem,Resource,NavigationTitleMode,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Date, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
 import {MessageManager,Callback,Message} from '../../common/MessageManager';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct NavDestinationPage {
  private arr: number[] = new Array<number>(0, 1, 2, 3)
  @State isActive: boolean = false
  @State dex: number = 0
  @State stateChange: string = ''
  @State hideTitleBar: boolean = false
  @State backColor: Color = Color.Grey
  @State title: string = 'NavDestination'
  messageManager: MessageManager<string> = new MessageManager<string>()

  onPageShow() {
    console.info('NavRouter onPageShow')

    AppStorage.setOrCreate<MessageManager<string>>("messageManager",  this.messageManager );
    let callback: Callback<string> = (message: Message<string>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'arr') {
        this.arr = (message as Message<number[]>).value
      }
      if (message.name == 'hideTitleBar') {
        this.hideTitleBar = (message as Message<boolean>).value
      }
      if (message.name == 'backColor') {
        this.backColor = (message as Message<Color>).value
      }
      if (message.name == 'title') {
        this.title = (message as Message<string>).value
      }
      if (message.name == 'dex') {
        this.dex = (message as Message<number>).value
      }
      if (message.name == 'stateChange') {
        this.stateChange = (message as Message<string>).value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Navigation({}) {
        List({ space: 12, initialIndex: 0 }) {
          ForEach(this.arr, (item: number, index: number) => {
            ListItem() {
              // NavRouter() {
              //   Row() {
              //     Image($r('app.media.icon')).width(30).height(30).borderRadius(30).margin({ left: 3, right: 10 } as Margin)
              //     Text(`NavRouter${item + 1}`)
              //       .fontSize(22)
              //       .fontWeight(500)
              //       .textAlign(TextAlign.Center)
              //   }
              //   .width(180)
              //   .height(72)
              //   .backgroundColor(this.dex === index ? '#ccc' : '#fff')
              //   .borderRadius(24)
              //
              //   NavDestination() {
              //     Text(`我是NavDestination第${item + 1}页内容`).fontSize(50)
              //     Flex({ direction: FlexDirection.Row }) {
              //       Row() {
              //         Image($r('app.media.icon')).width(40).height(40).borderRadius(40).margin({ right: 15 } as Margin)
              //         Text('Hello').fontSize(30).key('textContent' + (item + 1).toString())
              //       }.padding({ left: 15 })
              //     }
              //   }.backgroundColor(this.backColor)
              //   .key('NavDestination' + (item + 1).toString())
              //   .title(this.title + (item + 1).toString())
              //   .hideTitleBar(this.hideTitleBar)
              // }.key('NavRouter' + (item + 1).toString())
              // .onStateChange((isActivated: boolean) => {
              //   this.stateChange = "stateChange " + isActivated.toString()
              //   this.dex = index
              // })
            }
          }, (item: number) => String(item))
        }
        .height('100%')
        .margin({ top: 12, left: 12 } as Margin)
      }
      .navBarWidth('30%')
      .mode(NavigationMode.Split)
      .hideTitleBar(true)
      .hideToolBar(true)
      Text(this.stateChange).fontSize(20).margin(10).id('12')
    }.height('100%')
  }
}

