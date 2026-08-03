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
import {
  AppStorageV2,
  Button,
  ClickEvent,
  Column,
  Component,
  ComponentV2,
  Divider,
  Entry,
  Link,
  Local,
  LocalStorage,
  LocalStorageLink,
  ObservedV2,
  PersistentStorage,
  Row,
  State,
  Text,
  Trace
} from '@kit.ArkUI';

@ObservedV2
export class Message1 {
  @Trace public userID: number;

  constructor(userID?: number, userName?: string) {
    this.userID = userID ?? 1;
  }
}

@ObservedV2
export class Message2 {
  @Trace public userName: string;

  constructor(userName?: string) {
    this.userName = userName ?? 'Jack';
  }
}

const iMessageType1 = Class.from<Message1>();

const iMessageType2 = Class.from<Message2>();

const as2: Message2 | undefined = AppStorageV2.connect<Message2>(iMessageType2, () => new Message2());

// ttype为SampleClass的Class的对象已经在AppStorageV2中，将该对象返回给as3
const message3: Message2 = AppStorageV2.connect<Message2>(iMessageType2)!;

let message2 = AppStorageV2.connect<Message1>(iMessageType1, '',() => {return new Message1()});

@Entry
@ComponentV2
struct AppStorageV2Api {
  // 使用connect在AppStorageV2中创建一个ttype为Message的Class的对象
  // 修改connect的返回值即可同步回AppStorageV2
  @Local message1: Message1 = AppStorageV2.connect<Message1>(iMessageType1, () => new Message1())!;
  @Local message4: Message1 = AppStorageV2.connect<Message1>(iMessageType1)!;



  build() {
    Column() {
      // 修改@Trace装饰的类属性，UI能同步刷新
      Button(`Index userID: ${this.message1.userID}`)
        .id('AppStorageV2_connect1')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.message1.userID += 1;
        })
      // 修改非@Trace装饰的类属性，UI不会同步刷新，但修改的类属性已同步回AppStorageV2
      Button('Index userName: '+message3.userName)
        .id('AppStorageV2_connect2')
        .height('5%')

      Button(`AppStorageV2.keys(): ${AppStorageV2.keys()}`)
        .id('AppStorageV2_keys')
        .height('5%')

      // remove keyOrType IMessageType, 会从AppStorageV2中删除keyOrType为Message的Class的对象
      Button(`remove keyOrType: ${this.message1.userID}`)
        .id('AppStorageV2_remove')
        .height('5%')
        .onClick((e: ClickEvent) => {
          AppStorageV2.remove(iMessageType1);
        })

      // connect ttype IMessageType, 会从AppStorageV2中添加ttype为Message的Class的对象
      Button(`remove connect userID: ${this.message1.userID}`)
        .id('AppStorageV2_connect3')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.message1 = AppStorageV2.connect<Message1>(iMessageType1, () => new Message1(5))!;
        })

      Button('connect underfined: '+message2)
        .id('AppStorageV2_connect_underfined')
        .height('5%')

      Button(`connect defaultCreator false:${this.message4.userID}`)
        .id('AppStorageV2_connect4')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.message4.userID += 2;
        })

      Button('remove为空:')
        .id('AppStorageV2_remove2')
        .height('5%')
        .onClick((e: ClickEvent) => {
          AppStorageV2.remove('');
        })


      Divider()
    }
    .width('100%')
    .height('100%')
  }
}

