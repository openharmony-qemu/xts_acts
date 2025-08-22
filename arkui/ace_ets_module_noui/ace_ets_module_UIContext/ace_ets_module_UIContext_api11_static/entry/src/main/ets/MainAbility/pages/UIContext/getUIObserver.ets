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
import observer from '@ohos.arkui.observer';
import { UIContext } from '@ohos.arkui.UIContext';
import {
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CustomBuilderT,
  Entry,
  Flex,
  FlexDirection,
  FontWeight,
  HeightBreakpoint,
  Margin,
  Navigation,
  NavigationMode,
  NavigationTitleMode,
  NodeContainer,
  Padding,
  ResourceStr,
  Row,
  Text,
  TextAlign,
  TouchEvent,
  WidthBreakpoint,
  WrappedBuilder,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct NavRouterExample {
  @State isActiveWLAN: boolean = false
  @State isActiveBluetooth: boolean = false
  @State showFlag: ResourceStr = ''

  aboutToAppear() {
    let context: UIContext | undefined = this.getUIContext?.()
    if (context != undefined) {
      let contextObserver = context.getUIObserver();
      contextObserver.on("navDestinationUpdate", (e) => {
        this.showFlag = '30'
      });
    }
  }

  build() {
    Column() {
      Navigation() {

      }
      .title('设置')
      .titleMode(NavigationTitleMode.Free)
      .mode(NavigationMode.Auto)
      .hideTitleBar(false)
      .hideToolBar(true)
    }.height('100%')
  }
}