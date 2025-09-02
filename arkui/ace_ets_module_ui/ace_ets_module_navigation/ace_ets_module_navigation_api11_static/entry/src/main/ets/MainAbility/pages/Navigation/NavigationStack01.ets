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
import {
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,animateTo,AnimateParam,Search,TextAlign,Axis,NavBarPosition,FlexAlign,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,ModalTransition,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Date,NavigationCommonTitle,NavDestinationCommonTitle
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct NavigationStack01 {
  private arr: number[] = new Array<number>(1, 2,3)
  // @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @State isShow:boolean = false
  @State isShow2:boolean = false
  @State bool: boolean = false
  @State text: string = 'start'
  @State flagBlur: string = 'BlurStart'
  @State flagFocus: string = 'FocusStart'
  @Builder myBuilder2() {
    Column() {
      Button("close modal 2")
        .margin(10)
        .fontSize(20)
        .onClick((e: ClickEvent)=>{
          this.isShow2 = false;
        })
    }
    .width('100%')
    .height('100%')
  }
  @Builder myBuilder() {
    Column() {
      Button("transition modal 2")
        .margin(10)
        .fontSize(20)
        .onClick((e: ClickEvent)=>{
          this.isShow2 = true;
        })
        // .bindContentCover(this.isShow2, this.myBuilder2(), {modalTransition: ModalTransition.DEFAULT, backgroundColor: Color.Pink, onAppear: () => {console.log("BindContentCover onAppear.")}, onDisappear: () => {console.log("BindContentCover onDisappear.")}})
      Button("close modal 1")
        .margin(10)
        .fontSize(20)
        .onClick((e: ClickEvent)=>{
          this.isShow = false;
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
  build() {
    Column(){
      // Navigation(this.pageInfos) {
        Column() {
          List({space:12}){
            ForEach(this.arr, (item: number) => {
              ListItem() {
                // NavRouter(){
                //   Text("NavRouter" + item).key(`NavigationStack01ListItemText${item}`)
                //     .width('100%')
                //     .height(60)
                //     .backgroundColor('#FFFFFF')
                //     .borderRadius(24)
                //     .fontSize(16)
                //     .fontWeight(1000)
                //     .textAlign(TextAlign.Center)
                //   NavDestination() {
                //     Text(`${this.text+item}`).key('NavigationStack01TextCont')
                //     Button('button').key('NavigationStack01ButtonContent')
                //       .defaultFocus(true)
                //       .onClick((e: ClickEvent) => {
                //         this.text = 'clicked'
                //       })
                //       .onFocus(()=>{
                //         this.flagFocus = 'FocusDone'
                //       })
                //   }
                //   .backgroundColor(Color.Orange)
                //   .title("NavDestinationTitle"+ item)
                // }
              }.key(`NavigationStack01ListItem${item}`)
            },(item: number) => String(item))
          }
          .width('80%')
          .margin({top:12} as Margin)
        }
      // }
      // .height('60%')
      // .title('NavIndex')
      // .titleMode(NavigationTitleMode.Mini)
      // .mode(NavigationMode.Stack)
      // .hideNavBar(this.bool)
      // .navBarWidth(260)
      // .minContentWidth(300)
      // .navBarWidthRange([200,400])
      // .border({width: 1})
      // .height('70%')
      // .width('100%')
      // .backgroundColor(Color.Pink)
      // .bindContentCover(this.isShow, this.myBuilder(), {modalTransition: ModalTransition.NONE, backgroundColor: Color.Pink, onAppear: () => {console.log("BindContentCover onAppear.")}, onDisappear: () => {console.log("BindContentCover onDisappear.")}})
      Text(this.flagBlur).key('NavigationStack01Blur').fontWeight(700)
      Text(this.flagFocus).key('NavigationStack01Focus').fontWeight(700)
      Button('YCDHL')
        .key('NavigationStack01True')
        .onClick((e: ClickEvent) => {
          this.bool = true
        })
      Button('CZ').key('NavigationStack01CZ')
        .onClick((e: ClickEvent) => {
          this.bool = false
          this.isShow = false
          this.isShow2 = false
          this.bool = false
          this.text = 'start'
          this.flagBlur = 'BlurStart'
          this.flagFocus = 'FocusStart'
          // this.pageInfos.clear()
        })
      Button('clear').key('NavigationStack01clear')
        .onClick((e: ClickEvent) => {
          // this.pageInfos.clear()
        })
    }
    .border({width:1})
    .height('100%')
    .width('100%')
  }
}