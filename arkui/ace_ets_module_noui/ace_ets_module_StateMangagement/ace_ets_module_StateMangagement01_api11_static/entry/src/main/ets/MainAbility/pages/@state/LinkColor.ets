/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  Text,
  Row,
  Scroll,
  ButtonType,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  FontWeight,
  Profiler,
  setAppBgColor,
  FlexWrap,
  Length,
  $r,
  Resource,
  ResourceColor,
  Color,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../MainAbility/common/Common';
import common from '@ohos.app.ability.common';



@Entry
@Component
struct Index_AAs{
  @State color: undefined | ResourceColor= '008000';

  aboutToAppear(){
    let uiContext = this.getUIContext();
    let LinkColor = uiContext.getRouter();
    AppStorage.setOrCreate<Router>("LinkColor",  LinkColor);
  }

  build() {
    Column() {
      Text("count type of " + JSON.stringify(CommonFunc.getType(this.color)) + " number is " + JSON.stringify(this.color))
        .fontSize(9).key('LinkColor').height('5%')


    }
  }
}