'use static'
import { UIUtils, Local, Trace, ObservedV2, IMonitor, IMonitorDecoratedVariable, Param, Event, Computed, Monitor } from '@ohos.arkui.stateManagement';
import { ComponentV2, Component, ClickEvent, Entry, Column, Row, Button, Scroll, ForEach, Text, Divider, Set, DatePicker, TextAlign, Margin, Color } from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';

@Component
struct Test {
  public a: number = 130000;
  array: int[] = UIUtils.makeObserved([1, 2, 3, 4, 5]);
  arrayMonitor?: IMonitorDecoratedVariable;
  aboutToAppear() {
    let callbackArray = this.array.map((_: int, index: int): (() => Any) => (() => this.array[Double.toInt(index)]));
    try {
      this.arrayMonitor = UIUtils.addMonitor(callbackArray, this.onChange, { owner: this });
    } catch (error: BusinessError) {
      console.log(`Error code: ${error.code}, Error message: ${error.message}.`)
      if (error.code == 130000) {
 	         this.a = 130000;
 	       }
    }
  }
  onChange(monitor: IMonitor) {
    console.log('[DynamicMonitor] Callback triggered.');
    monitor.dirty.forEach((path: string) => {
      console.log(`[DynamicMonitor] Value ${path} has changed from ${monitor.value<int>(path)?.before} to ${monitor.value<int>(path)?.now}.`);
    })
  }
  build() {
    Column() {
      Text(`Current array is: ${this.array}`)
        .height('5%')
      Button('Increase value in array')
        .height('5%')
        .onClick((event: ClickEvent) => {
          for (let index: int = 0; index < this.array.length; index++) {
            this.array[index]++;
          }
        })
    }
  }
}
@Entry
@ComponentV2
struct Page {
  build() {
    Column() {
      Test()
    }
    .width('100%')
    .height('100%')
  }
}