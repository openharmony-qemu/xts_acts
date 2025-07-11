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
import { Entry, Component, GridRow, GridCol, Color } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { RouterParams } from '../../common/Utils';

@Entry
@Component
struct DefaultByGridRowPage {
  @State parentWidth: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth
  @State parentHeight: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView ?? ''
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey ?? '';

  onPageShow() {
    console.info('DefaultByGridRowPage show called ')
  }

  /*
   * Set common style.
   */
  // @Styles commonStyle(){
  //   .key(this.componentKey)
  // }

  //Draw screen
  build() {
    GridRow() {
      if (this.targetView == 'GridCol') {
        GridCol()//.commonStyle()
      }
    }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Green)
  }
}