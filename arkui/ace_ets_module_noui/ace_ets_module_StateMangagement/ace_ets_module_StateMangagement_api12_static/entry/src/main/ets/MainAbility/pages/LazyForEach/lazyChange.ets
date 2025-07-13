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
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,
  DataChangeListener,
  DataOperation,
  LazyForEach,
  IDataSource,
  DataOperationType
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
interface Dta {
  type: DataOperationType
  index: number
}
class BasicDataSourceA implements IDataSource<string> {
  private listeners: DataChangeListener[] = new Array<DataChangeListener>();
  private originDataArray: string[] = new Array<string>();

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

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
  }
}

class MyDataSourceA extends BasicDataSourceA {
  public dataArray: string[] = new Array<string>();

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
    this.dataArray.splice(index, 1, data);
    let dat: Dta = {type: DataOperationType.CHANGE, index: index}
    let dta: DataOperation[] = new Array<DataOperation>(dat as DataOperation )
    this.notifyDatasetChange(dta);;
  }
}

@Entry
@Component
struct MyLazyChange {
  private data: MyDataSourceA = new MyDataSourceA();
  @State message:string='change'

  aboutToAppear() {
    for (let i = 0; i <= 2; i++) {
      this.data.pushData(`Hello ${i}`)
    }
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('LazyChange', router, Type.from<common.Context>());
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Text('change: '+ this.message)
        .id('change_DataType')

      Button('CHANGE')
        .id('changeType_1')
        .onClick((e: ClickEvent) => {
          this.data.changeData(1,'data 11')
          this.message = this.data.dataArray[1]
        })

      List() {
        LazyForEach(this.data, (item: string, index: number) => {
          ListItem() {
            Row() {
              Text(item)
                .fontSize(9)
                .onAppear(() => {
                  console.info("appear:" + item)
                })
            }
          }

        }, (item: string) => item)
      }.cachedCount(5)
    }
  }
}