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

import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';

@Reusable
@Component
export struct ReusableComponentV1B {
  @State item: string = ''
  aboutToAppear(): void {
    console.log('aboutToAppear ReusableComponentV1B', this.item);
  }
  aboutToDisappear(): void {
    console.log('aboutToDisappear ReusableComponentV1B', this.item);
  }
  aboutToReuse(params: ESObject): void {
    this.item = params.item;
    console.log('aboutToReuse ReusableComponentV1B', this.item);
  }
  aboutToRecycle(): void {
    console.log('aboutToRecycle ReusableComponentV1B', this.item);
  }

  build() {
    Text(`ReusableComponentV1B ${this.item}`)
  }
}

@Reusable
@Component
export struct ReusableComponentV1A {
  @State item: string = ''
  aboutToAppear(): void {
    console.log('aboutToAppear ReusableComponentV1A', this.item);
  }
  aboutToDisappear(): void {
    console.log('aboutToDisappear ReusableComponentV1A', this.item);
  }
  aboutToReuse(params: ESObject): void {
    this.item = params.item;
    console.log('aboutToReuse ReusableComponentV1A', this.item);
  }
  aboutToRecycle(): void {
    console.log('aboutToRecycle ReusableComponentV1A', this.item);
  }

  build() {
    Text(`ReusableComponentV1A_${this.item}`)
  }
}

@Component({freezeWhenInactive:true})
export struct CommonComponentV1 {
  @Prop item: string = ''
  aboutToAppear(): void {
    hiTraceMeter.startTrace(`aboutToAppear CommonComponentV1 ${this.item}`, 1);
    hiTraceMeter.finishTrace(`aboutToAppear CommonComponentV1 ${this.item}`, 1);
    console.log('aboutToAppear CommonComponentV1', this.item);
  }
  aboutToDisappear(): void {
    hiTraceMeter.startTrace(`aboutToDisappear CommonComponentV1 ${this.item}`, 1);
    hiTraceMeter.finishTrace(`aboutToDisappear CommonComponentV1 ${this.item}`, 1);
    console.log('aboutToDisappear CommonComponentV1', this.item);
  }
  aboutToReuse(): void {
    console.log('aboutToReuse CommonComponentV1', this.item);
  }
  aboutToRecycle(): void {
    console.log('aboutToRecycle CommonComponentV1', this.item);
  }

  build() {
    Text(`CommonComponentV1 ${this.item}`)
  }
}

export class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];

  public totalCount(): number {
    return this.originDataArray.length;
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
    });
  }
  notifyDataReloadNew(reuseImmediately: boolean | undefined | null): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded(reuseImmediately);
    });
  }
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    });
  }
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    });
  }
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    });
  }
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    });
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    });
  }
}

export class MyDataSource extends BasicDataSource {
  public dataArray: string[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    return this.dataArray[index];
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  public pushItem(data: string): void {
    this.dataArray.push(data);
  }

  public addData(index: number, data: string): void {
    this.dataArray.splice(index, 0, data)
    this.notifyDataAdd(index);
  }

  public deleteData(index: number): void {
    this.dataArray.splice(index, 1)
    this.notifyDataDelete(index);
  }

  public changeData(index: number, data: string): void {
    this.dataArray.splice(index, 1, data)
    this.notifyDataChange(index);
  }

  public moveData(from: number, to: number): void {
    let temp: string = this.dataArray[from];
    this.dataArray[from] = this.dataArray[to];
    this.dataArray[to] = temp;
    this.notifyDataMove(from, to);
  }

  public clearData(): void {
    this.dataArray = [];
  }

  public reloadData() {
    this.notifyDataReload();
  }

  public reloadDataNew(reuseImmediately: boolean | undefined | null) {
    this.notifyDataReloadNew(reuseImmediately);
  }
}

@Entry
@Component
struct LazyForEachNewReloadTest {
  build() {
    Column() {
      Swiper() {
        LazyForEachNewReloadTestV1({ useReusable: true, useDatasetChange: false, useDifferentComponent: false, useDifferentReuseId: false})
        LazyForEachNewReloadTestV1({ useReusable: true, useDatasetChange: true, useDifferentComponent: false, useDifferentReuseId: false})
        LazyForEachNewReloadTestV1({ useReusable: false, useDatasetChange: false, useDifferentComponent: false, useDifferentReuseId: false})
      }
      .cachedCount(0)
    }.width('100%').height('100%')
  }
}

@Component
struct LazyForEachNewReloadTestV1 {
  private data: MyDataSource = new MyDataSource();
  private tag: string = '';
  private initCount: number = 30;
  private reloadCount: number = 30;
  private initRecycleCount: number = 5;
  private newItemCount: number = 0;
  private useReusable: boolean = true;
  private useDatasetChange: boolean = false;
  private useDifferentComponent: boolean = false;
  private useDifferentReuseId: boolean = false;
  @State flag: boolean = true;
  @State reuseImmediately: boolean|undefined = true;
  @State str:string = 'LazyForEachNewReload'

  aboutToAppear() {
    for (let i = 0; i < this.initCount; i++) {
      this.data.pushItem(`item ${i}`);
    }
  }

  build() {
    Column({ space: 2 }) {
      Text('ReuseImmediately_' + this.reuseImmediately).height(15).id('ReuseImmediatelyString')
      Text(this.str).height(15).id('LazyForEachNewReloadString')
      Row({ space: 2 }) {
        Button('ReuseImmediately', { controlSize: ControlSize.SMALL })
          .onClick(() => { this.reuseImmediately = !this.reuseImmediately })
          .width(100)
          .height(15)
          .id('ReuseImmediately')
        Button('InitRecyclePool', { controlSize: ControlSize.SMALL })
          .onClick(() => {
            this.flag = !this.flag;
            this.str = 'InitRecyclePool'
          })
          .id('InitRecyclePool')
          .width(100)
          .height(15)
      }
      if (!this.useDatasetChange) {
        Row({ space: 2 }) {
          Button('NewReload', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.tag += '!'
              this.data.clearData()
              for (let i = 0; i < this.reloadCount; i++) {
                this.data.pushItem(`${this.tag}item ${i}`);
              }
              this.data.reloadDataNew(this.reuseImmediately);
              this.str = 'NewReload'
            })
            .id('NewReload')
            .width(100)
            .height(15)
          Button('OriginReload', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.tag += '!'
              this.data.clearData()
              for (let i = 0; i < this.reloadCount; i++) {
                this.data.pushItem(`${this.tag}item ${i}`);
              }
              this.data.reloadData();
              this.str = 'OriginReload'
            })
            .id('OriginReload')
            .width(100)
            .height(15)
        }
        Row({ space: 2 }) {
          Button('SetReloadUndefined', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.tag += '!'
              this.data.clearData()
              for (let i = 0; i < this.reloadCount; i++) {
                this.data.pushItem(`${this.tag}item ${i}`);
              }
              this.data.reloadDataNew(undefined);
              this.reuseImmediately = undefined
              this.str = 'SetReloadUndefined'
            })
            .id('SetReloadUndefined')
            .width(100)
            .height(15)
          Button('SetReloadNull', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.tag += '!'
              this.data.clearData()
              for (let i = 0; i < this.reloadCount; i++) {
                this.data.pushItem(`${this.tag}item ${i}`);
              }
              this.data.reloadDataNew(null);
              this.str = 'SetReloadNull'
            })
            .id('SetReloadNull')
            .width(100)
            .height(15)
        }
        Row({ space: 2 }) {
          Button('AddNoOne', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.data.addData(1, `new item ${this.newItemCount++}`);
              this.str = 'AddNoOne'
            })
            .id('AddNoOne')
            .width(70)
            .height(15)
          Button('DeleteNoThree', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.data.deleteData(3);
              this.str = 'DeleteNoThree'
            })
            .id('DeleteNoThree')
            .width(70)
            .height(15)
          Button('ChangeNoFive', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.data.changeData(5, `new item ${this.newItemCount++}`);
              this.str = 'ChangeNoFive'
            })
            .id('ChangeNoFive')
            .width(70)
            .height(15)
        }
        Row({ space: 2 }) {
          Button('DuplicateReload', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.tag += '!'
              this.data.clearData()
              for (let i = 0; i < this.reloadCount; i++) {
                this.data.pushItem(`${this.tag}item ${i}`);
              }
              this.data.reloadDataNew(this.reuseImmediately);
              this.data.reloadDataNew(this.reuseImmediately);
              this.data.reloadDataNew(this.reuseImmediately);
              this.str = 'DuplicateReload'
            })
            .id('DuplicateReload')
            .width(100)
            .height(15)
          Button('MixOperateAndReload', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.tag += '!'
              this.data.clearData()
              for (let i = 0; i < this.reloadCount; i++) {
                this.data.pushItem(`${this.tag}item ${i}`);
              }
              this.data.reloadDataNew(this.reuseImmediately);
              this.data.reloadData();
              this.data.addData(1, `new item ${this.newItemCount++}`);
              this.data.deleteData(3);
              this.data.changeData(5, `new item ${this.newItemCount++}`);
              this.str = 'MixOperateAndReload'
            })
            .id('MixOperateAndReload')
            .width(100)
            .height(15)
        }
      } else {
        Row({ space: 2 }) {
          Button('NewReload', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.tag += '!'
              this.data.clearData()
              for (let i = 0; i < this.reloadCount; i++) {
                this.data.pushItem(`${this.tag}item ${i}`);
              }
              this.data.notifyDatasetChange([{
                type:DataOperationType.RELOAD, reuseImmediately:this.reuseImmediately
              }])
            })
            .width(100)
            .height(15)
          Button('OriginReload', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.tag += '!'
              this.data.clearData()
              for (let i = 0; i < this.reloadCount; i++) {
                this.data.pushItem(`${this.tag}item ${i}`);
              }
              this.data.notifyDatasetChange([{
                type:DataOperationType.RELOAD
              }])
            })
            .width(100)
            .height(15)
        }
        Row({ space: 2 }) {
          Button('SetReloadUndefined', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.tag += '!'
              this.data.clearData()
              for (let i = 0; i < this.reloadCount; i++) {
                this.data.pushItem(`${this.tag}item ${i}`);
              }
              this.data.notifyDatasetChange([{
                type:DataOperationType.RELOAD, reuseImmediately:undefined
              }])
            })
            .width(100)
            .height(15)
        }
        Row({ space: 2 }) {
          Button('AddNoOne', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.data.dataArray.splice(1, 0, `new item ${this.newItemCount++}`)
              this.data.notifyDatasetChange([{
                type:DataOperationType.ADD, index: 1
              }])
            })
            .width(70)
            .height(15)
          Button('DeleteNoThree', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.data.dataArray.splice(3, 1)
              this.data.notifyDatasetChange([{
                type:DataOperationType.DELETE, index: 3
              }])
            })
            .width(70)
            .height(15)
          Button('ChangeNoFive', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.data.dataArray.splice(5, 1, `new item ${this.newItemCount++}`)
              this.data.notifyDatasetChange([{
                type:DataOperationType.CHANGE, index: 5
              }])
            })
            .width(70)
            .height(15)
        }
        Row({ space: 2 }) {
          Button('DuplicateNewReload', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.tag += '!'
              this.data.clearData()
              for (let i = 0; i < this.reloadCount; i++) {
                this.data.pushItem(`${this.tag}item ${i}`);
              }
              this.data.notifyDatasetChange([{
                type:DataOperationType.RELOAD, reuseImmediately:this.reuseImmediately
              }])
              this.data.notifyDatasetChange([{
                type:DataOperationType.RELOAD, reuseImmediately:this.reuseImmediately
              }])
              this.data.notifyDatasetChange([{
                type:DataOperationType.RELOAD, reuseImmediately:this.reuseImmediately
              }])
            })
            .width(100)
            .height(15)
          Button('MixOperateAndReload', { controlSize: ControlSize.SMALL })
            .onClick(() => {
              this.tag += '!'
              this.data.clearData()
              for (let i = 0; i < this.reloadCount; i++) {
                this.data.pushItem(`${this.tag}item ${i}`);
              }
              this.data.notifyDatasetChange([{
                type:DataOperationType.RELOAD, reuseImmediately:this.reuseImmediately
              }])
              this.data.notifyDatasetChange([{
                type:DataOperationType.RELOAD
              }])
              this.data.dataArray.splice(1, 0, `new item ${this.newItemCount++}`)
              this.data.notifyDatasetChange([{
                type:DataOperationType.ADD, index: 1
              }])
              this.data.dataArray.splice(3, 1)
              this.data.notifyDatasetChange([{
                type:DataOperationType.DELETE, index: 3
              }])
              this.data.dataArray.splice(5, 1, `new item ${this.newItemCount++}`)
              this.data.notifyDatasetChange([{
                type:DataOperationType.CHANGE, index: 5
              }])
            })
            .width(100)
            .height(15)
        }
      }

      List({ space: 2 }) {
        LazyForEach(this.data, (item: string, index: number) => {
          ListItem() {
            if (this.useReusable) {
              if (this.useDifferentComponent) {
                Column() {
                  ReusableComponentV1A({ item: item })
                    .height(15)
                    .border({ width: 1 })
                    .reuseId(this.useDifferentReuseId ? (index % 2 ? 'a' : 'b') : 'c')
                  ReusableComponentV1B({ item: item })
                    .height(15)
                    .border({ width: 1 })
                    .reuseId(this.useDifferentReuseId ? (index % 2 ? 'd' : 'e') : 'f')
                }
              } else {
                ReusableComponentV1A({ item: item })
                  .height(20)
                  .border({ width: 1 })
                  .reuseId(this.useDifferentReuseId ? (index % 2 ? 'a' : 'b') : 'c')
              }
            } else {
              CommonComponentV1({ item: item })
                .height(20)
                .border({ width: 1 })
            }
          }
        }, (item: string, index: number)=>item)

      }
      .width('100%')
      .height('50%')
      .border({ width: 1 })
      .cachedCount(5)
      Stack() {
        if (this.flag) {
          ForEach(new Array(this.initRecycleCount).fill(0), (item: number, index: number) => {
            ReusableComponentV1A({ item: '' })
              .reuseId(this.useDifferentReuseId ? (index % 2 ? 'a' : 'b') : 'c')
            ReusableComponentV1B({ item: '' })
              .reuseId(this.useDifferentReuseId ? (index % 2 ? 'd' : 'e') : 'f')
          }, (item: number, index: number) => index.toString())
        }
      }.height(0)
    }
  }
}




