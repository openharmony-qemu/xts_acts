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
  Component,
  Reusable,
  Row,
  Text,
  Image,
  Resource,
  FontWeight,
  ImageCompleteEvent,
  $r,
  Margin,
  List,
  ListOptions,
  LazyForEach,
  ListItem,
  DataChangeListener,
  IDataSource
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

class BasicDataSource implements IDataSource<string | undefined> {
  private listeners: DataChangeListener [] = new Array<DataChangeListener>();

  public totalCount(): number {
    return 0;
  }

  public getData(index: number): string | undefined {
    return undefined;
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
      listener.onDataAdd(index)
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
}

class MyDataSourceImag extends BasicDataSource {
  private dataArray: string[] = ['/path/image0', '/path/image1', '/path/image2', '/path/image3'];

  public totalCount(): number {
    return this.dataArray.length
  }

  public getData(index: number): string | undefined {
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

interface AttContent {
  item: string
}

@Entry
@Component
struct MyComponentImag {
  private data: MyDataSourceImag = new MyDataSourceImag();

  build() {
    List({ space: 3 } as ListOptions) {
      LazyForEach(this.data, (item: string | undefined, index: number) => {
        ListItem() {
          ReusableChildComponent({ item: item || '' })
        }
      }, (item: string | undefined, index: number) => {
        return item ? item : index + '';
      })
    }
    .width('100%')
    .height('100%')
  }
}

@Reusable
@Component
struct ReusableChildComponent {
  @State item: string = ''

  aboutToReuse(params: AttContent) {
    this.item = params.item;
  }

  aboutToRecycle() {
    console.log('recycle node');
  }

  build() {
    Row() {
      Image(this.item).width('30%').height(50).key('aboutToRecyclImage')
      Text(this.item).fontSize(20).margin({ left: 10 } as Margin)
    }.margin({ left: 10, right: 10 } as Margin)
  }
}