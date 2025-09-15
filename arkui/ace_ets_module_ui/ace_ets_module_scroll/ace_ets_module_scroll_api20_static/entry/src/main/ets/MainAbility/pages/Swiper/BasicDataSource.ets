/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  DataOperation,
  DataChangeListener,
  IDataSource,
  DataDeleteOperation,
  DataOperationType
} from '@ohos.arkui.component';

class BasicDataSource implements IDataSource<string> {
  private listeners: DataChangeListener[] = [];

  public totalCount(): number {
    return 0;
  }

  public getData(index: number): string {
    return '';
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener).toInt();
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

  notifyDatasetChange(dataOperations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(dataOperations);
    })
  }
}

export class MyDataSource extends BasicDataSource {
  private dataArray: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8'];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    return this.dataArray[index.toInt()];
  }

  
  public addData(index: number, data: string): void {
    this.dataArray.splice(index.toInt(), 0, data);
    this.notifyDataAdd(index);
  }

  
  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  
  public deleteData(index: number): void {
    this.dataArray.splice(index.toInt(), 1);
    this.notifyDataDelete(index);
  }

  public moveData(from: number, to: number) {
    let temp = this.dataArray[from.toInt()];
    this.dataArray[from.toInt()] = this.dataArray[to.toInt()];
    this.dataArray[to.toInt()] = temp;
    this.notifyDataMove(from, to);
  }

  public changeData(index: number, data: string) {
    this.dataArray[index.toInt()] = data;
    this.notifyDataChange(index);
  }

  
  public reloadData(data: string) {
    this.dataArray.forEach((value, index) => {
      this.dataArray[index.toInt()] = value + data;
    });
    this.notifyDataReload();
  }

  public datasetChangeAdd(index: number, key: string) {
    this.dataArray.splice(index.toInt(), 0, key, key);
    this.notifyDatasetChange([{
      type: DataOperationType.ADD,
      index: index,
      count: 2,
      
      key: key
    }]);
  }

  public datasetChangeDelete(index: number) {
    this.dataArray.splice(index.toInt(), 2);
    this.notifyDatasetChange([{
      type: DataOperationType.DELETE,
      index: index,
      count: 2,
    } as DataDeleteOperation]);
  }
}