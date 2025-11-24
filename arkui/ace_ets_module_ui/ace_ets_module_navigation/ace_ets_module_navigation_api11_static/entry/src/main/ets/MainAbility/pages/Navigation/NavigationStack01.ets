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
  Entry,Component,$r,Scroll,Builder,List,CustomBuilder,ListItem,Resource,animateTo,AnimateParam,Search,TextAlign,Axis,NavBarPosition,FlexAlign,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,ModalTransition,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Date,NavigationCommonTitle,NavDestinationCommonTitle
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Component
struct PageOne {
  @State text: string = 'start'
  @State flagFocus: string = 'FocusStart'
  build(){
    NavDestination() {
      Text(`${this.text+ 0}`).key('NavigationStack01TextCont')
      Button('button').key('NavigationStack01ButtonContent')
        .defaultFocus(true)
        .onClick((e: ClickEvent) => {
          this.text = 'clicked'
        })
        .onFocus(()=>{
          this.flagFocus = 'FocusDone'
        })
    }
    .backgroundColor(Color.Orange)
    .title("NavDestinationTitle0")

  }
}
@Component
struct PageTwo {
  @State text: string = 'start'
  @State flagFocus: string = 'FocusStart'
  build(){
    NavDestination() {
      Text(`${this.text+1}`).key('NavigationStack01TextCont')
      Button('button').key('NavigationStack01ButtonContent')
        .defaultFocus(true)
        .onClick((e: ClickEvent) => {
          this.text = 'clicked'
        })
        .onFocus(()=>{
          this.flagFocus = 'FocusDone'
        })
    }
    .backgroundColor(Color.Orange)
    .title("NavDestinationTitle1")

  }
}
@Component
struct PageThree {
  @State text: string = 'start'
  @State flagFocus: string = 'FocusStart'
  build(){
    NavDestination() {
      Text(`${this.text+2}`).key('NavigationStack01TextCont')
      Button('button').key('NavigationStack01ButtonContent')
        .defaultFocus(true)
        .onClick((e: ClickEvent) => {
          this.text = 'clicked'
        })
        .onFocus(()=>{
          this.flagFocus = 'FocusDone'
        })
    }.key(`NavigationStack01ListItemText2`)
    .backgroundColor(Color.Orange)
    .title("NavDestinationTitle2")
  }
}
@Entry
@Component
struct NavigationStack01 {
  private arr: number[] = new Array<number>(1, 2,3)
  pageInfos: NavPathStack = new NavPathStack()
  @State isShow:boolean = false
  @State isShow2:boolean = false
  @State bool: boolean = false
  @State flagFocus: string = 'FocusStart'
  @State flagBlur: string = 'BlurStart'
  @State text: string = 'start'
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
        // .bindContentCover(
        //   this.isShow2,
        //   this.myBuilder2(),
        //   { modalTransition: ModalTransition.DEFAULT, backgroundColor: Color.Pink, onAppear: () => {console.log("BindContentCover onAppear.")}, onDisappear: () => {console.log("BindContentCover onDisappear.")}} as ModalTransition)
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
  @Builder
  PageBuilder(name: string, param: Object|null|undefined) {
    if (name == "page0") {
      PageOne()

    } else if (name == "page1") {
      PageTwo()
      console.info('page1page1page1',name)
    } else if (name == "page2") {
      PageThree()
    }
  }
  build() {
    Column(){
      Navigation(this.pageInfos) {
        Column() {
          List({space:12}){
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text("NavRouter" + item).key(`NavigationStack01ListItemText${item}`)
                  .width('100%')
                  .height(60)
                  .backgroundColor('#FFFFFF')
                  .borderRadius(24)
                  .fontSize(16)
                  .fontWeight(1000)
                  .textAlign(TextAlign.Center)
                .onClick((e: ClickEvent)=>{
                  let pageName = 'page' + String(item)
                  this.pageInfos.pushPathByName(pageName, null);
                })

              }.key(`NavigationStack01ListItem${item}`)
            },(item: number) => String(item))
          }
          .width('80%')
          .margin({top:12} as Margin)
        }
      }
      .height('60%')
      .title('NavIndex')
      .navDestination(this.PageBuilder)
      .titleMode(NavigationTitleMode.Mini)
      .mode(NavigationMode.Stack)
      .hideNavBar(this.bool)
      .navBarWidth(260)
      .minContentWidth(300)
      .navBarWidthRange([200,400])
      .border({width: 1})
      .height('70%')
      .width('100%')
      .backgroundColor(Color.Pink)
      // .bindContentCover(
      //   this.isShow,
      //   this.myBuilder(),
      //   {
      //     modalTransition: ModalTransition.NONE,
      //     backgroundColor: Color.Pink,
      //     onAppear: () => {
      //       console.log("BindContentCover onAppear.")
      //     },
      //     onDisappear: () => {
      //       console.log("BindContentCover onDisappear.")
      //     }})
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
          this.pageInfos.clear()
        })
      Button('clear').key('NavigationStack01clear')
        .onClick((e: ClickEvent) => {
          this.pageInfos.clear()
        })
    }
    .border({width:1})
    .height('100%')
    .width('100%')
  }
}