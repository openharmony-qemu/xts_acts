'use static';
/*
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
import { Entry, Text, Column, ComponentV2, Button, ClickEvent } from '@ohos.arkui.component';
import { Local, Monitor, Computed, IMonitor } from '@ohos.arkui.stateManagement';

export class A {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }
}

const cls = getNearestNonBootRuntimeLinker()?.loadClass('arkui.component.extendableComponent.ExtendableComponent', false);

@Entry
@ComponentV2
struct DumpObject {
  @Local infox: Array<A> = [
    new A('1'),
    new A('2'),
    new A('3'),
    new A('4'),
    new A('5'),
    new A('6'),
    new A('7'),
    new A('8'),
    new A('9'),
    new A('10'),
    new A('11'),
  ];
  @Local info: string = '200';
  @Local firstName: string = 'Hua';
  @Local lastName: string = 'Li';
  @Local checkResult: string = 'Empty';
  @Monitor(['info'])
  infoChange(monitor: IMonitor) {
    console.info('info name change');
  }

  @Computed
  get fullName(): string {
    return this.firstName + this.lastName;
  }

  build() {
    Column() {
      Button('change')
        .id('DumpObjectButton_001')
        .onClick((event: ClickEvent) => {
          this.checkResult = cls?.getInstanceMethod('__onDumpInspector__Internal')?.invoke(this, []) as string;
        })
      Text(`${this.checkResult}`)
        .id('DumpObjectText_001')
    }
  }
}