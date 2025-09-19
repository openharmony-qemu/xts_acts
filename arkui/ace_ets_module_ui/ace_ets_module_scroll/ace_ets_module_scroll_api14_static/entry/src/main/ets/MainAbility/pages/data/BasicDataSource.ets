/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
  IDataSource,
  DataChangeListener,
  DataOperation,
  DataOperationType,
  DataChangeOperation,
  DataReloadOperation,
  DataMoveOperation,
  DataAddOperation
} from '@ohos.arkui.component'

abstract class BasicDataSource<T> implements IDataSource<T> {
  private listeners: DataChangeListener[] = []

  abstract totalCount(): number

  abstract getData(index: number): T

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener')
      this.listeners.push(listener)
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener).toInt();
    if (pos >= 0) {
      console.info('remove listener')
      this.listeners.splice(pos, 1)
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded()
    })
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange([{ type: DataOperationType.ADD, index: index } as DataChangeOperation]);
    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange([{ type: DataOperationType.CHANGE, index: index } as DataChangeOperation]);
    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange([{ type: DataOperationType.DELETE, index: index } as DataChangeOperation]);
    })
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange([{
        type: DataOperationType.MOVE,
        index: { from: from, to: to }
      } as DataMoveOperation]);
    })
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
  }
}

export class MyDataSource<T> extends BasicDataSource<T> {
  private dataArray: T[] = [] as T[]

  public totalCount(): number {
    return this.dataArray.length
  }

  public getData(index: number): T {
    console.log("zxy List cacheCountTest3 getData = " + index)
    return this.dataArray[index.toInt()]
  }

  public addData(index: number, data: T): void {
    this.dataArray.splice(index.toInt(), 0, data) 
    
    this.notifyDatasetChange([
      { type: DataOperationType.ADD, index: index } as DataChangeOperation])
  }

  public dataReload(): void {
    this.notifyDatasetChange([
      { type: DataOperationType.RELOAD } as DataReloadOperation])
  }

  public pushData(data: T): void {
    this.dataArray.push(data)
    this.notifyDatasetChange([
      { type: DataOperationType.ADD, index: this.dataArray.length - 1 } as DataChangeOperation])
    
  }

  public deleteIndex(index: number): void {
    this.dataArray.splice(index.toInt(), 1) 
    this.notifyDatasetChange([
      { type: DataOperationType.DELETE, index: index, count: 1 } as DataAddOperation])
  }

  public deleteData(data: T): void {
    let index = this.dataArray.indexOf(data)
    this.dataArray.splice(index.toInt(), 1) 
    this.notifyDatasetChange([
      { type: DataOperationType.DELETE, index: index, count: 1 } as DataAddOperation])
  }

  public moveData(from: number, to: number) {
    this.notifyDataMove(from, to)
  }

  public changeData(index: number, data: T) {
    this.dataArray[index.toInt()] = data
    this.notifyDataChange(index)
  }

  public indexOf(data: T): number {
    return this.dataArray.indexOf(data)
  }

  public addOperateData(items: T[]): void {
    this.dataArray.splice(20, 0, ...items);
    this.notifyDatasetChange([
      { type: DataOperationType.ADD, index: 20, count: 100 } as DataAddOperation]);
  }

  public DeloperateData(): void {
    this.dataArray.splice(20, 100);
    this.notifyDatasetChange([
      { type: DataOperationType.DELETE, index: 20, count: 100 } as DataAddOperation]);
  }
}