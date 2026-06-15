/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { NodeController, FrameNode, UIContext, BuilderNode, ExpandMode, ChildrenCountMode } from '@kit.ArkUI';

const TEST_TAG: string = 'hello'
class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];
  public totalCount(): number {
    return 0;
  }

  public getData(index: number): string {
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

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);

    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);

    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }
  notifyDataMove(from: number, to: number): void {
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
  public totalCount(): number {
    return this.dataArray.length;
  }
  public getData(index: number): string {
    return this.dataArray[index];
  }
  public addData(index: number, data: string): void {
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
  public totalCount(): number {
    return this.dataArray.length;
  }
  public getData(index: number): string {
    return this.dataArray[index];
  }
  public pushData(data: string): void {
    this.dataArray.push(data);
  }
  public changeData(index: number, data: string): void {
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
  private data: MyDataSource = new MyDataSource();
  private scroller: Scroller = new Scroller();
  public dataNode:BuilderNode<[Params]> | null = null
  makeNode(uiContext: UIContext): FrameNode | null {
    for (let i = 0; i <= 15; i++) {
      this.data.pushData(`N${i}`);
    }
    const params: Params = new Params(this.data, this.scroller);
    const dataNode: BuilderNode<[Params]> = new BuilderNode(uiContext);
    this.dataNode = dataNode
    dataNode.build(wrapBuilder<[Params]>(buildData), params);
    this.rootNode = dataNode.getFrameNode();
    const scrollToIndexOptions: ScrollToIndexOptions = {
    };
    this.scroller.scrollToIndex(6, true, ScrollAlign.START, scrollToIndexOptions!);
    return this.rootNode;
  }
  getChildCountDefault():string {
    const childCount = this.rootNode?.getChildrenCount()
    console.info(TEST_TAG + 'defalut, childCount=' + childCount);
    let str = childCount!.toString()
    return str
  }
  getChildCountExpand():string {
    const childCount = this.rootNode?.getChildrenCount(ChildrenCountMode.ALL_EXPAND)
    console.info(TEST_TAG + 'defalut, childCount=' + childCount);
    let str = childCount!.toString()
    return str
  }
  getChildCountExpanded():string {
    const childCount = this.rootNode?.getChildrenCount(ChildrenCountMode.ONLY_EXPANDED)
    console.info(TEST_TAG + 'false, childCount=' + childCount);
    let str = childCount!.toString()
    return str
  }
  getChildCountALL():string {
    const childCount = this.rootNode?.getChildrenCount(ChildrenCountMode.ALL_NOT_EXPAND)
    console.info(TEST_TAG + 'false, childCount=' + childCount);
    let str = childCount!.toString()
    return str
  }
  getChildCountUndefined():string {
    const childCount = this.rootNode?.getChildrenCount(undefined)
    console.info(TEST_TAG + 'false, childCount=' + childCount);
    let str = childCount!.toString()
    return str
  }
  getChildCountNull():string {
    const childCount = this.rootNode?.getChildrenCount(null)
    console.info(TEST_TAG + 'false, childCount=' + childCount);
    let str = childCount!.toString()
    return str
  }

  getChildWithLazyExpand():string|undefined {
    const childNode = this.rootNode!.getChild(16, ExpandMode.LAZY_EXPAND );
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
    const childNode = this.rootNode!.getChild(8, ExpandMode.LAZY_NOT_EXPAND);
    console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND): ' + childNode?.getId());
    if (childNode?.getId() === 'N3') {
      console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND)  result: success.');
    } else {
      console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND)  result: fail.');
    }
    let str = childNode?.getId()
    return str
  }
  getChildWithLazyUndefined():string|undefined {
    const childNode = this.rootNode!.getChild(8, undefined);
    console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND): ' + childNode?.getId());
    if (childNode?.getId() === 'N3') {
      console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND)  result: success.');
    } else {
      console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND)  result: fail.');
    }
    let str = childNode?.getId().toString()
    return str
  }
  getChildWithLazyNull():string|undefined {
    const childNode = this.rootNode!.getChild(8, null);
    console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND): ' + childNode?.getId());
    if (childNode?.getId() === 'N3') {
      console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND)  result: success.');
    } else {
      console.info(TEST_TAG + 'getChild(3, ExpandMode.LAZY_EXPAND)  result: fail.');
    }
    let str = childNode?.getId().toString()
    return str
  }
}

@Entry
@Component
struct FrameNodeProvideChild {
  private myNodeController: MyNodeController = new MyNodeController();
  private scroller: Scroller = new Scroller();
  @State str:string|undefined = 'hello'
  build() {
    Scroll(this.scroller) {
      Column({space:2} as ColumnOptions) {
        Text(this.str)
          .id('FrameNodeProvideChildText')
          .height(15)
        Row(){
          Button('getUndefined')
            .id('getUndefined')
            .width(100)
            .height(15)
            .onClick(() => {
              this.myNodeController.getChildWithLazyUndefined();
              this.str = this.myNodeController.getChildCountUndefined()
            })
          Button('getNull')
            .id('getNull')
            .width(100)
            .height(15)
            .onClick(() => {
              this.myNodeController.getChildWithLazyNull();
              this.str = this.myNodeController.getChildCountNull()
            })
        }
        Button('getChildCountDefault')
          .id('getChildCountDefault')
          .width(180)
          .height(15)
          .onClick(() => {
            this.myNodeController.getChildCountDefault();
          })
        Button('getChildCount(ALL_EXPAND)')
          .id('getChildCount(ALL_EXPAND)')
          .width(180)
          .height(15)
          .onClick(() => {
            this.myNodeController.getChildCountExpand();
          })
        Button('getChildCount(ONLY_EXPANDED)')
          .id('getChildCount(ONLY_EXPANDED)')
          .width(180)
          .height(15)
          .onClick(() => {
            this.myNodeController.getChildCountExpanded();
          })
        Button('getChildCount(ALL_NOT_EXPAND)')
          .id('getChildCount(ALL_NOT_EXPAND)')
          .width(180)
          .height(15)
          .onClick(() => {
            this.myNodeController.getChildCountALL();
          })

        Button('getChildWithLazyExpand')
          .id('getChildWithLazyExpand')
          .width(180)
          .width(180)
          .height(15)
          .onClick(() => {
            this.str = this.myNodeController.getChildWithLazyExpand();
          })
        Button('getChildWithLazyNotExpand')
          .id('getChildWithLazyNotExpand')
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