'use static'

/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { Entry, Text, Column, Component, Button, ClickEvent, UIContext, Builder, List, ListItem, LazyForEach, Row, ColumnOptions, wrapBuilder, NodeContainer, FontWeight, DataChangeListener, IDataSource, DataOperation, Scroller, Axis, Color, ComponentV2, LengthMetrics, Reusable, ScrollToIndexOptions, Scroll, ScrollAlign, ExpandMode } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import { NodeController, BuilderNode, FrameNode } from '@ohos.arkui.node';
import { ChildrenCountMode } from 'arkui.FrameNode';
const TEST_TAG: string = 'hello'
export class BasicDataSource implements IDataSource<string> {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];
  public totalCount(): int {
    return 0;
  }
  public getData(index: int): string {
    return this.originDataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  notifyDataAdd(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);

    })
  }

  notifyDataChange(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);

    })
  }

  notifyDataDelete(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }
  notifyDataMove(from: int, to: int): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
  }
}
export class MyDataSource extends BasicDataSource {
  private dataArray: string[] = []
  public totalCount(): int {
    return this.dataArray.length;
  }
  public getData(index: int): string {
    return this.dataArray[index];
  }
  public addData(index: int, data: string): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }
  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}
export class TestDataSource extends BasicDataSource {
  private dataArray: Array<string> = [];
  public totalCount(): int {
    return this.dataArray.length;
  }
  public getData(index: int): string {
    return this.dataArray[index];
  }
  public pushData(data: string): void {
    this.dataArray.push(data);
  }
  public changeData(index: int, data: string): void {
    this.dataArray[index] = data;
    this.notifyDataChange(index);
  }
}
export class Params {
  public data: MyDataSource | null = null;
  public scroller: Scroller | null = null;
  constructor(data: MyDataSource, scroller: Scroller) {
    this.data = data;
    this.scroller = scroller;
  }
}
@Builder
export function buildData(params: Params):void {
  List({ scroller: params.scroller! }) {
    LazyForEach(params.data!, (item: string) => {
      ListItem() {
        Column() {
          Text(item)
            .fontSize(20)
            .onAppear(() => {
              console.info(TEST_TAG + 'node appear: ' + item)
            })
            .onDisAppear(() => {
              console.info(TEST_TAG + 'node disappear: ' + item)
            })
            .backgroundColor(Color.Pink)
            .margin({
              top: 30,
              bottom: 30,
              left: 10,
              right: 10
            })
        }
      }
      .id(item)
    }, (item: string) => item)
    ListItem() {
      Row() {
        Text('1')
          .fontSize(100)
      } 
    }.id('N16')
  }
  .cachedCount(5)
  .listDirection(Axis.Horizontal)
}
export class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private rootNode2: FrameNode | null = null;
  private uiContext: UIContext | null = null;
  private data: MyDataSource = new MyDataSource();
  private scroller: Scroller = new Scroller();
  public dataNode: BuilderNode<Params> | null = null;
  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    for (let i = 0; i <= 15; i++) {
      this.data.pushData(`N${i}`);
    }
    const params: Params = new Params(this.data, this.scroller);
    this.dataNode = new BuilderNode<Params>(uiContext);
    this.dataNode!.build(wrapBuilder(buildData), params);
    this.rootNode = this.dataNode!.getFrameNode();
    const scrollToIndexOptions: ScrollToIndexOptions = {
    };
    this.scroller.scrollToIndex(6, true, ScrollAlign.START, scrollToIndexOptions!);
    return this.rootNode;
  }
  getChildCountDefault():void {
    const childCount = this.rootNode?.getChild(0)!.getChildrenCount()
    console.info(TEST_TAG + 'defalut, childCount=' + childCount);
  }
  getChildCountExpand():void {
    const childCount = this.rootNode?.getChild(0)!.getChildrenCount(ChildrenCountMode.ALL_EXPAND)
    console.info(TEST_TAG + 'defalut, childCount=' + childCount);
  }
  getChildCountExpanded():void {
    const childCount = this.rootNode?.getChild(0)!.getChildrenCount(ChildrenCountMode.ONLY_EXPANDED)
    console.info(TEST_TAG + 'false, childCount=' + childCount);
  }
  getChildCountALL():void {
    const childCount = this.rootNode?.getChild(0)!.getChildrenCount(ChildrenCountMode.ALL_NOT_EXPAND)
    console.info(TEST_TAG + 'false, childCount=' + childCount);
  }
  getChildCountUndefined():string {
    const childCount = this.rootNode?.getChild(0)!.getChildrenCount(undefined)
    console.info(TEST_TAG + 'false, childCount=' + childCount);
    let str = childCount!.toString()
    return str
  }

  getChildWithLazyExpand():string|undefined {
    const childNode = this.rootNode!.getChild(0)!.getChild(16, ExpandMode.LAZY_EXPAND );
    console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND): ' + childNode?.getId());
    if (childNode?.getId() === 'N3') {
      console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND)  result: success.');
    } else {
      console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND)  result: fail.');
    }
    let str = childNode?.getId()
    return str
  }
  getChildWithLazyNotExpand():string|undefined {
    const childNode = this.rootNode!.getChild(0)!.getChild(8, ExpandMode.LAZY_NOT_EXPAND);
    console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND): ' + childNode?.getId());
    if (childNode?.getId() === 'N3') {
      console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND)  result: success.');
    } else {
      console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND)  result: fail.');
    }
    let str = childNode?.getId()
    return str
  }
  getChildWithLazyUndefined():void {
    const childNode = this.rootNode!.getChild(0)!.getChild(8, undefined);
    console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND): ' + childNode?.getId());
    if (childNode?.getId() === 'N3') {
      console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND)  result: success.');
    } else {
      console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND)  result: fail.');
    }
  }
}
@Entry
@Component
struct FrameNodeProvideChildStatic {
  private myNodeController: MyNodeController = new MyNodeController();
  private scroller: Scroller = new Scroller();
  @State str:string|undefined = 'hello'
  build() {
    Scroll(this.scroller) {
      Column({space:2} as ColumnOptions) {
        Text(this.str)
          .id('FrameNodeProvideChildTextStatic')
          .height(15)
        Button('getUndefined')
          .id('getUndefinedStatic')
          .width(180)
          .height(15)
          .onClick(() => {
            this.str = this.myNodeController.getChildCountUndefined();
            this.myNodeController.getChildWithLazyUndefined();
          })
        Button('getChildCountDefault')
          .id('getChildCountDefaultStatic')
          .width(180)
          .height(15)
          .onClick(() => {
            this.myNodeController.getChildCountDefault();
          })
        Button('getChildCount(ALL_EXPAND)')
          .id('getChildCount(ALL_EXPAND)Static')
          .width(180)
          .height(15)
          .onClick(() => {
            this.myNodeController.getChildCountExpand();
          })
        Button('getChildCount(ONLY_EXPANDED)')
          .id('getChildCount(ONLY_EXPANDED)Static')
          .width(180)
          .height(15)
          .onClick(() => {
            this.myNodeController.getChildCountExpanded();
          })
        Button('getChildCount(ALL_NOT_EXPAND)')
          .id('getChildCount(ALL_NOT_EXPAND)Static')
          .width(180)
          .height(15)
          .onClick(() => {
            this.myNodeController.getChildCountALL();
          })

        Button('getChildWithLazyExpand')
          .id('getChildWithLazyExpandStatic')
          .width(180)
          .width(180)
          .height(15)
          .onClick(() => {
            this.str = this.myNodeController.getChildWithLazyExpand();
          })
        Button('getChildWithLazyNotExpand')
          .id('getChildWithLazyNotExpandStatic')
          .width(180)
          .height(15)
          .onClick(() => {
            this.str = this.myNodeController.getChildWithLazyNotExpand();
          })
        Column() {
          NodeContainer(this.myNodeController)
            .borderWidth(1)
            .width(200)
            .height(80)
        }
      }
      .height('100%')
      .width('100%')
    }
  }
}