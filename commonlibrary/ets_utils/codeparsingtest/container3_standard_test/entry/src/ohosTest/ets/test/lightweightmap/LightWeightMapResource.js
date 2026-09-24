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

import LightWeightMap from '@ohos.util.LightWeightMap';

export function test005() {
    let lightWeightMap = new LightWeightMap();
    let c = { name: "lili", age: "13" };
    lightWeightMap.set(1, c);
    return lightWeightMap.hasValue(c) && lightWeightMap.hasKey(1);
}

export function test023() {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A"); lightWeightMap.set(2, "B"); lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D"); lightWeightMap.set(5, "E");
    let arr = [];
    lightWeightMap.forEach((value, index) => { arr.push(value); });
    let arr1 = ["A", "B", "C", "D", "E"];
    for (let i = 0; i < arr1.length; i++) { if (arr[i] !== arr1[i]) return false; }
    return true;
}

export function test027() {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A"); lightWeightMap.set(2, "B"); lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D"); lightWeightMap.set(5, "E");
    let iters = lightWeightMap[Symbol.iterator]();
    let flag = true;
    for (let i = 0, len = lightWeightMap.length; i < len; i++) {
        let entry = iters.next().value;
        let res = lightWeightMap.get(entry[0]);
        if (res != entry[1]) { flag = false; break; }
    }
    return flag;
}

export function test036() {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set("a", "A"); lightWeightMap.set("b", "B"); lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D"); lightWeightMap.set("e", "E");
    let res = lightWeightMap.increaseCapacityTo(10);
    return res === undefined;
}

export function test037() {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set("a", "A"); lightWeightMap.set("b", "B"); lightWeightMap.set("c", "C");
    lightWeightMap.set("d", "D"); lightWeightMap.set("e", "E");
    try {
        lightWeightMap.increaseCapacityTo("qwe");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "minimumCapacity" must be small integer. Received value is: qwe`;
    }
}

export function test038() {
    let lightWeightMap = new LightWeightMap();
    try {
        let res = lightWeightMap.removeAt("a");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "index" must be small integer. Received value is: a`;
    }
}

export function test039() {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A"); lightWeightMap.set(2, "B"); lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D"); lightWeightMap.set(5, "E");
    try {
        let res = lightWeightMap.getValueAt("a");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "index" must be small integer. Received value is: a`;
    }
}

export function test040() {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A"); lightWeightMap.set(2, "B"); lightWeightMap.set(3, "C");
    lightWeightMap.set(4, "D"); lightWeightMap.set(5, "E");
    try {
        let res = lightWeightMap.getKeyAt("a");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "index" must be small integer. Received value is: a`;
    }
}

export function test048() {
    let lightWeightMap = new LightWeightMap();
    let a = { abc: 1 };
    lightWeightMap.set(a, "");
    return lightWeightMap.hasValue("") && lightWeightMap.hasKey(a);
}

export function test051() {
    let lightWeightMap = new LightWeightMap();
    try {
        lightWeightMap.hasAll([1, 2, 3]);
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "map" must be LightWeightMap. Received value is: 1,2,3`;
    }
}

export function test053() {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A"); lightWeightMap.set(2, "B");
    try {
        lightWeightMap.setAll([1, 2, 3]);
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "map" must be LightWeightMap. Received value is: 1,2,3`;
    }
}

export function test054() {
    let lightWeightMap = new LightWeightMap();
    lightWeightMap.set(1, "A"); lightWeightMap.set(2, "B");
    try {
        lightWeightMap.setValueAt("a", "a");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "index" must be small integer. Received value is: a`;
    }
}
