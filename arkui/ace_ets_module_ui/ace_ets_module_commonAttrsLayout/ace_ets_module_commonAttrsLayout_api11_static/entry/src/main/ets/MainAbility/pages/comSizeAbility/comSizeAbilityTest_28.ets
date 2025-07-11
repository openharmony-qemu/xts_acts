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
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Image,
  List,
  ListItem,
  PreDragStatus,
  Scroller,
  CanvasRenderingContext2D,
  Button,
  RenderingContextSettings,
  Canvas,
  ClickEvent,
  Row,
  CheckboxGroup,
  Circle,
  Counter,
  Divider,
  Ellipse,
  Gauge,
  GridRow,
  GridCol,
  ForEach,
  GridItem,
  Grid,
  Builder,
  ListItemGroup,
  ResourceStr,
  MenuItemGroup,
  MenuItem,
  Menu,
  Path,
  Polygon,
  Polyline,
  LineJoinStyle,
  QRCode,
  Radio,
  Rect,
  Refresh,
  RichText,
  Search,
  TabsController,
  Tabs,
  TabContent,
  TextArea,
  TextClock,
  TextPicker,
  TextInput,
  Alignment,
  AlphabetIndexer,
  FormLink,
  DataPanel,
  Checkbox,
  ImageAnimator,
  AnimationStatus,
  DatePicker,
  ImageSpan,
  Span,
  RichEditorController,
  RichEditorOptions,
  RichEditor,
  DataChangeListener,
  SwiperController,
  LazyForEach,
  Swiper,
  IDataSource,
  Scroll,
  Margin,
  TextAlign,
  ArrowStyle,
  Curve,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import matrix4 from '@ohos.matrix4'

let matrix = matrix4.init([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0])

class MyDataSource1 implements IDataSource<number> {
  private list: number[] = []

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): number {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

@Entry
@Component
struct comSizeAbilityTest_28 {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource1 = new MyDataSource1([])
  aboutToAppear(): void {
    let uiContext = this.getUIContext();
    let comSizeAbilityTest_28 = uiContext.getRouter();
    AppStorage.setOrCreate<Router>("comSizeAbilityTest_28",  comSizeAbilityTest_28, Type.from<Router>());
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSource1(list)
  }

  build() {
    Scroll() {
      Column({ space: 5 } as ColumnOptions) {
        Swiper(this.swiperController) {
          LazyForEach(this.data, (item: number):void => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: number):string => String(item))
        }
        .size({ width: 250, height: 100 })
        .translate({ x: 1, y: 1, z: 1 })
        .scale({
          x: 1,
          y: 1,
          z: 1,
          centerX: 1,
          centerY: 1
        })
        .rotate({
          x: 1,
          y: 1,
          z: 1,
          angle: 0,
          centerX: 1,
          centerY: 1
        })
        .transform(matrix)
        .key("Swiper_Size")
        .cachedCount(2)
        .index(1)
        // .autoPlay(true)
        .interval(4000)
        .indicator(true)
        .loop(true)
        .duration(1000)
        .itemSpace(0)
        .displayArrow({
          showBackground: true,
          isSidebarMiddle: true,
          backgroundSize: 24,
          backgroundColor: Color.White,
          arrowSize: 18,
          arrowColor: Color.Blue
        } as ArrowStyle, false)
        .curve(Curve.Linear)
      }.width('100%').margin({ top: 5 } as Margin).key('Swiper_Father')
    }.height('100%')
  }
}


