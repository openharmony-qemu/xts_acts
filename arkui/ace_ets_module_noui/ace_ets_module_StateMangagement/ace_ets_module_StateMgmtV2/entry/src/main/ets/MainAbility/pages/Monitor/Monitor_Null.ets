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
import { UIUtils } from '@kit.ArkUI';

@Entry
@ComponentV2
struct MonitorNull {
  @Local class001: MonitonNull001 = new MonitonNull001();

  aboutToAppear(): void {
    this.class001.class002 = null;
    UIUtils.addMonitor(this, 'class001.*', this.fun001, null);
    UIUtils.addMonitor(this, 'class001.*', this.fun001, undefined);
    UIUtils.addMonitor(this, '', this.fun001, undefined);
    UIUtils.addMonitor(this, '', this.fun001, undefined);
  }

  @Monitor('class001.class002.class003.x')
  onChange(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange: User property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }

  @Monitor(null, null, null)
  onChange2(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange: User property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }

  @Monitor(undefined, undefined, undefined)
  onChange3(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange: User property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }

  @Monitor('', '')
  onChange4(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange: User property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }

  @Monitor('')
  onChange5(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange: User property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }

  @Monitor(null)
  onChange6(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange: User property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }

  @Monitor(undefined)
  onChange7(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange: User property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }

  fun001() {
  }

  build() {
    Column() {
      Text(`${this.class001.class002 === null ? 'null' : 'ww'}`)
        .id('Monitor_Null_001')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .padding(5)
    .margin(5)
    .justifyContent(FlexAlign.Center)
  }
}

@ObservedV2
class MonitonNull001 {
  @Trace public class002: MonitonNull002 | null = new MonitonNull002();
}

@ObservedV2
class MonitonNull002 {
  @Trace public class003: MonitonNull003 = new MonitonNull003();
}

@ObservedV2
class MonitonNull003 {
  @Trace public x: number = 0;
}