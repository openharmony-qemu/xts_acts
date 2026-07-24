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

let storage = new LocalStorage();
storage.setOrCreate('PropA', 48);
let storageFunc = (): LocalStorage => {
  return storage;
}

@Component
struct Child0001 {
  @LocalStorageLink('PropA') childLinkNumber: int = 1;

  build() {
    Column() {
      Text(this.childLinkNumber.toString())
        .id('propA')
        .height('5%')
      Button(`Child from LocalStorage ${this.childLinkNumber}`)
        .id('EntryParams_btn2')
        .onClick(() => {
          this.childLinkNumber += 1;
        })
        .height('5%')
    }
  }
}

@Entry({routeName: 'EntryParams',storage: 'storageFunc', useSharedStorage: false})
@Component
struct EntryParams {
  @State flag: boolean = true;
  @State flag2: boolean = false;
  build() {
    Column() {
      Text(`${this.flag2 ? 'true': 'false'}`)
        .id('EntryParams_clear')
        .height('5%')
      Button(`flag`)
        .onClick(() => {
          this.flag = false;
        })
        .id('EntryParams_btn1')
        .height('5%')
      Button(`clear localStorage`)
        .onClick(() => {
          this.flag2 = storage.clear();
        })
        .id('EntryParams_btn3')
        .height('5%')
      if (this.flag) {
        Child0001()
      }
    }
  }
}