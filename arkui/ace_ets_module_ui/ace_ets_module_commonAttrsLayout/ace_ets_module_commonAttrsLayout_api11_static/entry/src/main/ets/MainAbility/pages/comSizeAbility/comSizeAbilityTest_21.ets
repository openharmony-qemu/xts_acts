/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  $r,
  Alignment,
  AlphabetIndexer,
  Builder,
  Button,
  Canvas,
  CanvasRenderingContext2D,
  CheckboxGroup,
  Circle,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Counter,
  Divider,
  Ellipse,
  Entry,
  ForEach,
  FormLink,
  Gauge,
  Grid,
  GridCol,
  GridItem,
  GridRow,
  Image,
  LineJoinStyle,
  List,
  ListItem,
  ListItemGroup,
  Menu,
  MenuItem,
  MenuItemGroup,
  Path,
  Polygon,
  Polyline,
  Position,
  PreDragStatus,
  QRCode,
  Radio,
  Rect,
  Refresh,
  RenderingContextSettings,
  ResourceStr,
  RichText,
  Row,
  Scroller,
  Search,
  TabContent,
  Tabs,
  TabsController,
  Text,
  TextArea,
  TextClock,
  TextInput,
  TextPicker,
} from '@ohos.arkui.component';
import { AppStorage, Link, Prop, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

import matrix4 from '@ohos.matrix4'

let matrix = matrix4.init([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0])

@Entry
@Component
struct comSizeAbilityTest_21 {
  aboutToAppear(): void {


  }

  build() {
    Column() {


    }.key('RemoteWindow_Father')
  }
}