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
import { Entry,NavPathStack,Component,$r,Image,ResourceStr,Padding,
  Builder,List,ListItem,Resource,NavigationTitleMode,NavigationMode,Column,
  Navigation,ButtonType,NavDestination,Stack,ColumnOptions,Position,
  EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,
  Row,Button,ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,ResourceColor,
  PickerTextStyle, CalendarAlign, Date, CalendarPicker,EdgeEffect,Curve,
  SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,
  TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,Provide,StoragePropRef
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Component
struct PageOne {
  @StoragePropRef('navTitle') navTitle: string = 'NavDestination'
  @StoragePropRef('hideTitleBar') hideTitleBar: boolean = false
  @StoragePropRef('backColor') backColor: ResourceColor = Color.Grey
  build(){
    NavDestination() {
      Text(`我是NavDestination第1页内容`).fontSize(50)
      Flex({ direction: FlexDirection.Row }) {
        Row() {
          Image($r('app.media.icon')).width(40).height(40).borderRadius(40).margin({ right: 15 } as Margin)
          Text('Hello').fontSize(30).key('textContent1')
        }.padding({ left: 15 } as Padding)
      }
    }.backgroundColor(this.backColor)
    .key('NavDestination1')
    .title(this.navTitle + String(1))
    .hideTitleBar(this.hideTitleBar)
  }
}
@Component
struct PageTwo {
  @StoragePropRef('navTitle') navTitle: string = 'NavDestination'
  @StoragePropRef('hideTitleBar') hideTitleBar: boolean = false
  @StoragePropRef('backColor') backColor: ResourceColor = Color.Grey
  build(){
    NavDestination() {
      Text(`我是NavDestination第2页内容`).fontSize(50)
      Flex({ direction: FlexDirection.Row }) {
        Row() {
          Image($r('app.media.icon')).width(40).height(40).borderRadius(40).margin({ right: 15 } as Margin)
          Text('Hello').fontSize(30).key('textContent2')
        }.padding({ left: 15 } as Padding)
      }
    }.backgroundColor(this.backColor)
    .key('NavDestination2')
    .title(this.navTitle + String(2))
    .hideTitleBar(this.hideTitleBar)
  }
}
@Component
struct PageThree {
  @StoragePropRef('navTitle') navTitle: string = 'NavDestination'
  @StoragePropRef('hideTitleBar') hideTitleBar: boolean = false
  @StoragePropRef('backColor') backColor: ResourceColor = Color.Grey
  build(){
    NavDestination() {
      Text(`我是NavDestination第3页内容`).fontSize(50)
      Flex({ direction: FlexDirection.Row }) {
        Row() {
          Image($r('app.media.icon')).width(40).height(40).borderRadius(40).margin({ right: 15 } as Margin)
          Text('Hello').fontSize(30).key('textContent3')
        }.padding({ left: 15 } as Padding)
      }
    }.backgroundColor(this.backColor)
    .key('NavDestination3')
    .title(this.navTitle + String(3))
    .hideTitleBar(this.hideTitleBar)
  }
}
@Component
struct PageFour {
  @StoragePropRef('navTitle') navTitle: string = 'NavDestination'
  @StoragePropRef('hideTitleBar') hideTitleBar: boolean = false
  @StoragePropRef('backColor') backColor: ResourceColor = Color.Grey
  build(){
    NavDestination() {
      Text(`我是NavDestination第4页内容`).fontSize(50)
      Flex({ direction: FlexDirection.Row }) {
        Row() {
          Image($r('app.media.icon')).width(40).height(40).borderRadius(40).margin({ right: 15 } as Margin)
          Text('Hello').fontSize(30).key('textContent4')
        }.padding({ left: 15 } as Padding)
      }
    }.backgroundColor(this.backColor)
    .key('NavDestination4')
    .title(this.navTitle + String(4))
    .hideTitleBar(this.hideTitleBar)
  }
}

@Entry
@Component
struct NavDestinationPage {
  private arr: number[] = new Array<number>(0, 1, 2, 3)
  @State isActive: boolean = false
  @State dex: number = 0
  @State stateChange: string = ''
  pageInfos: NavPathStack = new NavPathStack();
  @Builder
  PageBuilder(name: string, param: Object|null|undefined) {
    if (name == "page0") {
      PageOne()

    } else if (name == "page1") {
      PageTwo()
    } else if (name == "page2") {
      PageThree()
    }else if (name == "page3") {
      PageFour()
    }
  }
  build() {
    Column() {
      Navigation(this.pageInfos) {
        List({ space: 12, initialIndex: 0 }) {
          ForEach(this.arr, (item: number, index: int) => {
            ListItem() {
              Column() {
                Row() {
                  Image($r('app.media.icon')).width(30).height(30).borderRadius(30).margin({ left: 3, right: 10 } as Margin)
                  Text(`NavRouter${item + 1}`)
                    .fontSize(22)
                    .fontWeight(500)
                    .textAlign(TextAlign.Center)
                }
                .width(180)
                .height(72)
                .backgroundColor(this.dex === index ? '#ccc' : '#fff')
                .borderRadius(24)


              }.key('NavRouter' + String(item + 1)).width('100%')
              .onClick((e: ClickEvent)=>{
                let pageName = "page" + String(item);
                this.pageInfos.pushPathByName(pageName, null);
              })
              
            }
          }, (item: number) => String(item))
        }
        .height('100%')
        .margin({ top: 12, left: 12 } as Margin)
      }
      .navDestination(this.PageBuilder)
      .navBarWidth('30%')
      .mode(NavigationMode.Split)
      .hideTitleBar(true)
      .hideToolBar(true)
      Text(this.stateChange).fontSize(20).margin(10).id('12')
    }.height('100%')
  }
}

