'use static';
/*
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
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,
  Color,
  FlexAlign,
  FontWeight,
  ComponentV2
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,
  AbstractProperty,
  ObservedV2,
  Trace,
  Local,
  Type,
  PersistenceV2,
  SerializableObject
} from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
@ObservedV2
class PerSampleChild {
  @Trace p1: int = 0;
  p2: int = 10;
}

@ObservedV2
export class PerSample implements SerializableObject {
  // 对于复杂对象需要@Type修饰，确保序列化成功
  // @Type(PerSampleChild)
  @Trace f: PerSampleChild = new PerSampleChild();

  public toJSON(): jsonx.JsonElement {
    const root = new jsonx.JsonElement({} as Record<string, jsonx.JsonElement>);
    // 存储info对象
    const inforoot = new jsonx.JsonElement({} as Record<string, jsonx.JsonElement>);
    const infoEle = new jsonx.JsonElement();
    infoEle.setInteger(this.f.p1);
    inforoot.setElement('p1', infoEle);
    infoEle.setInteger(this.f.p2);
    inforoot.setElement('p2', infoEle);
    root.setElement('f', inforoot);
    return root;
  }

  public fromJSON(json: jsonx.JsonElement): void {
    this.f.p1 = json.getElement('f').getElement('p1').asInteger();
    this.f.p2 = json.getElement('f').getElement('p2').asInteger();
  }
}



// 接受序列化失败的回调
PersistenceV2.notifyOnError((key: string, reason: string, msg: string) => {
  console.error(`notifyOnError key: ${key}, reason: ${reason}, message: ${msg}`);
});

@Entry
@ComponentV2
struct PersistenceV2Page1 {
  @Local a: number = 0
  // 在PersistenceV2中创建一个key为PerSample的键值对（如果存在，则返回PersistenceV2中的数据），并且和prop关联
  @Local prop: PerSample = PersistenceV2.connect<PerSample>(Type.from<PerSample>(), () => new PerSample())!;

  build() {
    Column() {
      Button('Go to page1')
        .id('router_appStorageV2')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          let router = this.getUIContext().getRouter();
          router.pushUrl({
            url: 'MainAbility/pages/Storage/appStorageV2'
          })
        })
      Button('connect the key PerSample')
        .id('persistenceV2_connect')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          // 在PersistenceV2中创建一个key为PerSample的键值对（如果存在，则返回PersistenceV2中的数据），并且和prop关联
          // 不建议对prop属性换connect的对象
          this.prop = PersistenceV2.connect<PerSample>(Type.from<PerSample>(), 'PerSample', () => new PerSample())!;
        })

      Button('remove the key PerSample')
        .id('persistenceV2_remove')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          // 从PersistenceV2中删除后，prop将不会再与key为PerSample的值关联
          PersistenceV2.remove(Type.from<PerSample>());
        })

      Button('Clear Create keys')
        .id('btnPersistenceV2ClearKeys')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          if (PersistenceV2.keys().includes('PerSample')) {
            PersistenceV2.remove('PerSample')
          }
        })

      Button('save the key PerSample')
        .id('persistenceV2_save')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          // 如果处于connect状态，持久化key为PerSample的键值对
          PersistenceV2.save(Type.from<PerSample>());
        })

      Text(`prop.p1: ${this.prop.f.p1}`)
        .id('persistenceV2_p1')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          console.log("=============================  this.prop.f.p1" +  this.prop.f.p1);
          this.prop.f.p1 += 2;
          console.log("=============================  this.prop.f.p1" +  this.prop.f.p1);
        })

      Text(`prop.p2: ${this.prop.f.p2}a: ${this.a}`)
        .id('persistenceV2_p2')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          //p2不是观察对象，它的变化需要save保存
          this.prop.f.p2++;
          PersistenceV2.save(Type.from<PerSample>());
          this.a += 2
        })

      // 获取当前PersistenceV2里面的所有key
      Text(`keys in PersistenceV2: ${PersistenceV2.keys()}`)
        .id('persistenceV2_keys')
        .height('3%')
        .fontSize(9)
    }
  }
}