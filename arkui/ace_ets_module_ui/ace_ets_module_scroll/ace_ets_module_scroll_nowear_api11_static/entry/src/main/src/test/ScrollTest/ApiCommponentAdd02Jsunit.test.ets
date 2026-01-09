'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility } from '../Util.test';

class DataObj1 implements jsonx.JsonElementDeserializable, jsonx.JsonElementSerializable {
  data3: number[];

  constructor() {
    this.data3 = new Array<number>();
  }

  constructor(arr: number[]) {
    this.data3 = arr;
  }

  toJSON(): jsonx.JsonElement {
    let root: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
    let arr = new Array<jsonx.JsonElement>();
    for (let i = 0; i < this.data3.length; ++i) {
      arr.push(jsonx.JsonElement.createDouble(this.data3[i]));
    }
    let arrJson = jsonx.JsonElement.createArray(arr);
    root.set('data3', arrJson);
    return jsonx.JsonElement.createObject(root)
  }

  fromJSON(jsonElem: jsonx.JsonElement) {
    let arrJson = jsonElem.tryAsArray();
    if (!arrJson) {
      this.data3 = new Array<number>();
      return;
    }
    let arr = new Array<number>();
    for (let i = 0; i < arrJson!.length; i++) {
      let val = arrJson![i].tryAsDouble();
      if (val) {
        arr.push(val);
      }
    }
    this.data3 = arr;
  }
}

class DataObj implements jsonx.JsonElementDeserializable, jsonx.JsonElementSerializable {
  data1: string;
  data2: DataObj1;

  constructor() {
    this.data1 = "";
    this.data2 = new DataObj1();
  }

  constructor(data1: string, data2: DataObj1) {
    this.data1 = data1;
    this.data2 = data2;
  }

  toJSON(): jsonx.JsonElement {
    let root: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
    root.set('data1', jsonx.JsonElement.createString(this.data1))
    root.set('data2', this.data2.toJSON());
    return jsonx.JsonElement.createObject(root)
  }

  fromJSON(jsonElem: jsonx.JsonElement) {
    this.data1 = jsonElem.tryGetString('data1');
    let data2 = jsonElem.tryGetElement('data2');
    if (data2) {
      this.data2 = new DataObj1();
      this.data2.fromJSON(data2!);
    }
  }
}

export default function ApiCommponentAdd02Jsunit() {
  describe('ApiCommponentAdd02Jsunit', () => {

    beforeAll(() => {
      console.info("ApiCommponentAdd02Jsunit beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api11.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("ApiCommponentAdd02Jsunit beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ApiCommponentAdd02Jsunit state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ApiCommponentAdd02Jsunit pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl({
            url: 'MainAbility/pages/Scroll/loadingprogrees_add02',
            params: (new DataObj('message', new DataObj1([123, 456, 789]))).toJSON()
          }).then(() => {
              // success
            })
            .catch((err: Error) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
          await CommonFunc.sleep(2000);
          console.info("push circle page success ");
        }
      } catch (err) {
        console.error("push ApiCommponentAdd02Jsunit page error:" + err);
      }
      console.info("ApiCommponentAdd02Jsunit beforeEach end");
    });

    
/**
     * @tc.number   ApiCommponentAdd02Jsunit_static_0900
     * @tc.name     ApiCommponentAdd02Jsunit_static_0900
     * @tc.desc     ApiCommponentAdd02Jsunit_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ApiCommponentAdd02Jsunit_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> =>{
      console.info('ApiCommponentAdd02Jsunit_static_0900 START');
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.clear();
      routerInstance.pushUrl({
        url: 'MainAbility/pages/Scroll/waterflow_add',
        params: (new DataObj('message', new DataObj1([123, 456, 789]))).toJSON()
      }).then(() => {
        // success
      }).catch((err: Error):void => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('waterflowAdd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ApiCommponentAdd02Jsunit_static_0900'] component obj is: " + obj.getElement('$attrs').getBoolean('enableScrollInteraction'));
      expect(obj.getElement('$attrs').getBoolean('enableScrollInteraction')).assertTrue();
      done();
    });
  })
}