'use static';
/**
  * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import  hilog  from '@ohos.hilog'

const abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let domain: int= 0x0000;
let tag: string = 'UtilTestTag';

class UtilsTest{
  
  static isStartedAbility = false;

  

  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async startAbility(bundleName: string, abilityName: string): Promise<boolean> {
    try {
      if (!UtilsTest.isStartedAbility) {
        await abilityDelegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`);
        hilog.info(domain, tag, `loadAndSetUpUiTest, success`);
        UtilsTest.isStartedAbility = true;
        await UtilsTest.msSleep(4000)
      }
      return true;
    } catch(error) {
      console.error(`UiTestCase, start abilityFailed: ${error}`);
      hilog.info(domain, tag, `UiTestCase, start abilityFailed: ${JSON.stringify(error)}`);
      return false;
    }
  }
}
async function startAbility(bundleName: string, abilityName: string): Promise<boolean> {
  try {
    await abilityDelegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`);
    console.info(`UiTestCase, start abilityFinished`);
    hilog.info(domain, tag, `UiTestCase, start abilityFinished`);
    await UtilsTest.msSleep(4000)
    return true;
  } catch(error) {
    console.error(`UiTestCase, start abilityFailed: ${error}`);
    hilog.info(domain, tag, `UiTestCase, start abilityFailed: ${JSON.stringify(error)}`);
    return false;
  }
}

async function stopApplication(bundleName: string): Promise<boolean>{
  try {
    await abilityDelegator.executeShellCommand(`aa force-stop ${bundleName} `);
    console.info(`UiTestCase, stop application finished`);
    return true;
  } catch(error) {
    console.error(`UiTestCase,stop application failed: ${JSON.stringify(error)}`);
    return false;
  }
}

class Data2 implements jsonx.JsonElementDeserializable, jsonx.JsonElementSerializable {
  data3: int[];

  constructor() {
    this.data3 = [0];
  }

  constructor(arr: int[]) {
    this.data3 = arr;
  }

  toJSON(): jsonx.JsonElement {
    let root: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
    let arr = new Array<jsonx.JsonElement>();
    for (let i = 0; i < this.data3.length; ++i) {
      arr.push(jsonx.JsonElement.createInteger(this.data3[i]));
    }
    let arrJson = jsonx.JsonElement.createArray(arr);
    root.set('data3', arrJson);
    return jsonx.JsonElement.createObject(root)
  }

  fromJSON(jsonElem: jsonx.JsonElement) {
    let arrJson = jsonElem.tryAsArray();
    if (!arrJson) {
      this.data3 = new Array<int>();
      return;
    }
    let arr = new Array<int>();
    for (let i = 0; i < arrJson!.length; i++) {
      let val = arrJson![i].tryAsInteger();
      if (val) {
        arr.push(val);
      }
    }
    this.data3 = arr;
  }
}

class Param implements jsonx.JsonElementDeserializable, jsonx.JsonElementSerializable {
  data1: string;
  data2: Data2;

  constructor() {
    this.data1 = "";
    this.data2 = new Data2();
  }

  constructor(data1: string, data2: Data2) {
    this.data1 = data1;
    this.data2 = data2;
  }

  constructor(data1: string, data2: Array<int>) {
    this.data1 = data1;
    this.data2 = new Data2(data2);
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
      this.data2 = new Data2();
      this.data2.fromJSON(data2!);
    }
  }
}

class Param1 implements jsonx.JsonElementDeserializable, jsonx.JsonElementSerializable {
  data1: string;

  constructor() {
    this.data1 = "";
  }

  constructor(data: string) {
    this.data1 = data;
  }

  toJSON(): jsonx.JsonElement {
    let root: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
    root.set('data1', jsonx.JsonElement.createString(this.data1))
    return jsonx.JsonElement.createObject(root)
  }

  fromJSON(jsonElem: jsonx.JsonElement) {
    this.data1 = jsonElem.tryGetString('data1');
  }
}

export {
  UtilsTest,
  startAbility,
  stopApplication,
  Data2,
  Param,
  Param1
}