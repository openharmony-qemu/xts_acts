'use static'
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
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  Provide,
  PropRef,
  ObjectLink,
  Observed,
  Consume,
  StoragePropRef,
  StorageLink,
  LocalStorage,
  LocalStoragePropRef,
  LocalStorageLink
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

let storage2 = new LocalStorage();
storage2.setOrCreate('PropB', 48);
let storageFunc2 = (): LocalStorage => {
  return storage2;
}

@Component
struct Child0002 {
  @LocalStorageLink('PropB') childLinkNumber: int = 1;

  build() {
    Column() {
      Text(this.childLinkNumber.toString())
        .id('propB')
        .height('5%')
      Button(`Child from LocalStorage ${this.childLinkNumber}`)
        .id('btn2')
        .onClick(() => {
          this.childLinkNumber += 1;
        })
        .height('5%')
    }
  }
}

@Entry({routeName: 'EntryParams2',storage: 'storageFunc2', useSharedStorage: true})
@Component
struct EntryParams2 {
  @State flag: boolean = true;
  @State flag2: boolean = false;
  build() {
    Column() {
      Text(`${this.flag2 ? 'true': 'false'}`)
        .id('clear')
        .height('5%')
      Button(`flag`)
        .onClick(() => {
          this.flag = false;
        })
        .id('btn1')
        .height('5%')
      Button(`clear localStorage`)
        .onClick(() => {
          this.flag2 = storage2.clear();
        })
        .id('btn3')
        .height('5%')
      if (this.flag) {
        Child0002()
      }
    }
  }
}