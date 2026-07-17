/**
 * Copyright (c) 2026 Kaihong Digital Industry Development Co., Ltd.
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

/**
 * Cover MonitorDecorator + IMonitor.value(null/undefined/'').
 */
@Entry
@ComponentV2
struct MonitorValueCover {
  @Local name: string = 'Tom';
  @Local pathEmpty: string = '';
  @Local pathNull: string = '';
  @Local pathUndef: string = '';

  @Monitor('name')
  onNameChange(monitor: IMonitor): void {
    this.pathEmpty = `${monitor.value('')?.path ?? 'none'}`;
    this.pathNull = `${monitor.value(null)?.path ?? 'none'}`;
    this.pathUndef = `${monitor.value(undefined)?.path ?? 'none'}`;
  }

  build() {
    Column() {
      Text('MonitorValueCover')
        .id('monitor_value_cover_title')
        .fontSize(16)
        .height('5%')
      Text(`name:${this.name}`)
        .id('monitor_value_cover_name')
        .height('5%')
      Text(`empty:${this.pathEmpty}`)
        .id('monitor_value_cover_empty')
        .height('5%')
      Text(`null:${this.pathNull}`)
        .id('monitor_value_cover_null')
        .height('5%')
      Text(`undef:${this.pathUndef}`)
        .id('monitor_value_cover_undef')
        .height('5%')
      Button('changeName')
        .id('monitor_value_cover_btn')
        .height('5%')
        .onClick(() => {
          this.name = 'Bob';
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
