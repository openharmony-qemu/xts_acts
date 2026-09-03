/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import LightWeightSet from '@ohos.util.LightWeightSet';

export function test005() {
    let lightWeightSet = new LightWeightSet();
    let c = { name: "lili", age: "13" };
    lightWeightSet.add(c);
    return lightWeightSet.has(c) === true;
}

export function test015() {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1); lightWeightSet.add(2); lightWeightSet.add(3); lightWeightSet.add(4); lightWeightSet.add(5);
    lightWeightSet.remove(1);
    let arr = [];
    lightWeightSet.forEach((value, index) => { arr.push(value); });
    let arr1 = [2, 3, 4, 5];
    for (let i = 0; i < arr.length; i++) { if (arr1[i] !== arr[i]) return false; }
    return true;
}

export function test016() {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1); lightWeightSet.add(2); lightWeightSet.add(3); lightWeightSet.add(4); lightWeightSet.add(5);
    lightWeightSet.removeAt(1);
    let arr = [];
    lightWeightSet.forEach((value, index) => { arr.push(value); });
    let arr1 = [1, 3, 4, 5];
    for (let i = 0; i < arr.length; i++) { if (arr1[i] !== arr[i]) return false; }
    return true;
}

export function test018() {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1); lightWeightSet.add(2); lightWeightSet.add(3); lightWeightSet.add(4); lightWeightSet.add(5);
    let arr = [];
    lightWeightSet.forEach((value, index) => { arr.push(value); });
    let arr1 = [1, 2, 3, 4, 5];
    for (let i = 0; i < arr1.length; i++) { if (arr[i] !== arr1[i]) return false; }
    return true;
}

export function test022() {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1); lightWeightSet.add(2); lightWeightSet.add(3); lightWeightSet.add(4); lightWeightSet.add(5);
    let arr = [];
    for (let item of lightWeightSet) { arr.push(item); }
    let arr1 = [1, 2, 3, 4, 5];
    for (let i = 0; i < arr1.length; i++) { if (arr[i] !== arr1[i]) return false; }
    return true;
}

export function test031() {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1); lightWeightSet.add(2); lightWeightSet.add(3); lightWeightSet.add(4); lightWeightSet.add(5);
    try {
        let res = lightWeightSet.increaseCapacityTo("qwe");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "minimumCapacity" must be small integer. Received value is: qwe`;
    }
}

export function test032() {
    let lightWeightSet = new LightWeightSet();
    try {
        let res = lightWeightSet.removeAt("a");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "index" must be small integer. Received value is: a`;
    }
}

export function test033() {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1); lightWeightSet.add(2); lightWeightSet.add(3); lightWeightSet.add(4); lightWeightSet.add(5);
    let res = lightWeightSet.increaseCapacityTo(20);
    return res === undefined;
}

export function test034() {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1); lightWeightSet.add(2); lightWeightSet.add(3); lightWeightSet.add(4); lightWeightSet.add(5);
    try {
        let res = lightWeightSet.getValueAt("a");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "index" must be small integer. Received value is: a`;
    }
}

export function test041() {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1); lightWeightSet.add(2); lightWeightSet.add(3); lightWeightSet.add(4); lightWeightSet.add(5);
    let arr = [];
    let res = lightWeightSet[Symbol.iterator]();
    let temp = undefined;
    do { temp = res.next().value; arr.push(temp); } while (temp != undefined);
    let arr1 = [1, 2, 3, 4, 5];
    for (let i = 0; i < arr1.length; i++) { if (arr[i] !== arr1[i]) return false; }
    return true;
}

export function test044() {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add(1); lightWeightSet.add(2); lightWeightSet.add(3);
    try {
        lightWeightSet.addAll([1, 2, 3]);
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "set" must be LightWeightSet. Received value is: 1,2,3`;
    }
}

export function test045() {
    let lightWeightSet = new LightWeightSet();
    lightWeightSet.add("a"); lightWeightSet.add("b"); lightWeightSet.add("c");
    try {
        lightWeightSet.hasAll([1, 2, 3]);
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "set" must be LightWeightSet. Received value is: 1,2,3`;
    }
}
