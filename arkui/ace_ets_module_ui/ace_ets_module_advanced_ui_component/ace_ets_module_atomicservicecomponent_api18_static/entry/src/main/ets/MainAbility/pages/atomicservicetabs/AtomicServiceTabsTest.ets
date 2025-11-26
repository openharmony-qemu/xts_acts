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
// import { AtomicServiceTabs, TabBarPosition, OnContentWillChangeCallback } from '@kit.ArkUI';
import {
  Entry,
  Component,
  Builder,
  Column,
  HorizontalAlign,
  Color,
  Stack,
  $r,
  Button,
  Margin,
  ClickEvent,
  TabBarOptions,
  LayoutMode,
  TabsController
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { Callback } from '@ohos.base';

@Entry
@Component
struct AtomicserviceTabsTest {
  @State flag: boolean = false;
  @State message: string = '首页';
  @State onClickNumber: number = 0;
  @State currentIndex: number = 0;
  @State comingIndex: number = 0;
  @State layoutMode: LayoutMode = LayoutMode.VERTICAL;
  // @State barPosition: TabBarPosition = TabBarPosition.LEFT;
  controller: TabsController = new TabsController();
  // onContentWillChangeCallBack: OnContentWillChangeCallback = (currentIndex: number, comingIndex: number): boolean => {
  //   this.currentIndex = currentIndex;
  //   this.comingIndex = comingIndex;
  //   console.log('OnContentWillChangeCallback')
  //   return true;
  // }
  onTabClick: Callback<number> = (index: number) => {
    this.onClickNumber++;
    console.log('onTabClick');
  }
  onChange: Callback<number> = (index: number) => {
    console.log('onChange');
    console.log('onChange2');
  }

  @Builder
  tabContent1() {
    Column().width('100%').height('100%').alignItems(HorizontalAlign.Center).backgroundColor('#00CB87')
  }

  @Builder
  tabContent2() {
    Column().width('100%').height('100%').backgroundColor(Color.Blue)
  }

  @Builder
  tabContent3() {
    Column().width('100%').height('100%').backgroundColor('#FFBF00')
  }

  build() {
    Stack() {
      // AtomicServiceTabs({
      //   tabContents: [
      //     () => {
      //       this.tabContent1()
      //     },
      //     () => {
      //       this.tabContent2()
      //     },
      //     () => {
      //       this.tabContent3()
      //     },
      //   ],
      //   tabBarOptionsArray: [
      //   new TabBarOptions($r('sys.media.ohos_ic_public_phone'), '绿色', Color.Black, Color.Blue),
      //   new TabBarOptions($r('sys.media.ohos_ic_public_location'), '蓝色', Color.Black, Color.Blue),
      //   new TabBarOptions($r('sys.media.ohos_ic_public_more'), '黄色', Color.Black, Color.Blue),
      //   ],
      //   tabBarPosition: this.barPosition,
      //   barBackgroundColor: $r('sys.color.ohos_id_color_bottom_tab_bg'),
      //   onTabBarClick: this.onTabClick,
      //  onContentWillChange: this.onContentWillChangeCallBack,
      //   onChange: this.onChange,
      //   layoutMode: this.layoutMode,
      //   index: 1,
      //   barOverlap: true,
      //   controller: this.controller
      // })

      Column() {
        Button('layoutMode垂直 ')
          .width('30%')
          .height(50)
          .margin({ top: 5 } as Margin)
          .onClick((event?: ClickEvent) => {
            this.layoutMode = LayoutMode.VERTICAL;
          })
        Button('layoutMode水平 ')
          .width('30%')
          .height(50)
          .margin({ top: 5 } as Margin)
          .onClick((event?: ClickEvent) => {
            this.layoutMode = LayoutMode.HORIZONTAL;
            // this.barPosition = TabBarPosition.BOTTOM
          })
      }.margin({ top: 10 } as Margin)
    }.height('100%')
  }
}
