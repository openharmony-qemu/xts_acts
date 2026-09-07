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
import HashMap from '@ohos.util.HashMap';

export function test005() {
    let hashMap = new HashMap();
    let c = { name: "lili", age: "13" };
    hashMap.set(1, c);
    return hashMap.get(1) === c;
}

export function test012() {
    let hashMap = new HashMap();
    let a = {};
    hashMap.set(a, "A");
    return hashMap.get(a) === "A";
}

export function test017() {
    let hashMap = new HashMap();
    let a = {};
    hashMap.set(1, a);
    return hashMap.get(1) === a;
}

export function test026() {
    let hashMap = new HashMap();
    return hashMap.get(3) === undefined;
}

export function test027() {
    let hashMap = new HashMap();
    hashMap.set(1, "A"); hashMap.set(2, "B"); hashMap.set(3, "C"); hashMap.set(4, "D"); hashMap.set(5, "E");
    let hashMap1 = new HashMap();
    hashMap1.set(1, 1); hashMap1.set(2, 2);
    hashMap.setAll(hashMap1);
    let arr = [];
    for (let [key, value] of hashMap) { arr.push([key, value]); }
    arr.sort(function (a, b) { return a[0] - b[0]; });
    for (let i = 0; i < arr.length; i++) {
        if (arr[i][0] !== i + 1) return false;
        if (arr[i][1] !== hashMap.get(i + 1)) return false;
    }
    return true;
}

export function test028() {
    let hashMap = new HashMap();
    let hashMap1 = new HashMap();
    hashMap1.set(1, 1); hashMap1.set(2, 2);
    hashMap.setAll(hashMap1);
    let arr = [];
    for (let [key, value] of hashMap) { arr.push([key, value]); }
    arr.sort(function (a, b) { return a[0] - b[0]; });
    for (let i = 0; i < arr.length; i++) {
        if (JSON.stringify(arr[i]) !== JSON.stringify([i + 1, hashMap.get(i + 1)])) return false;
    }
    return true;
}

export function test030() {
    let hashMap = new HashMap();
    return hashMap.remove(3) === undefined;
}

export function test033() {
    let hashMap = new HashMap();
    hashMap.set(1, "A"); hashMap.set(2, "B"); hashMap.set(3, "C"); hashMap.set(4, "D"); hashMap.set(5, "E");
    let res = hashMap.keys();
    for (let i = 0; i < hashMap.length; i++) {
        if (!hashMap.hasKey(res.next().value)) return false;
    }
    return true;
}

export function test034() {
    let hashMap = new HashMap();
    hashMap.set(1, "A"); hashMap.set(2, "B"); hashMap.set(3, "C"); hashMap.set(4, "D"); hashMap.set(5, "E");
    let res = hashMap.values();
    for (let i = 0; i < hashMap.length; i++) {
        if (!hashMap.hasValue(res.next().value)) return false;
    }
    return true;
}

export function test037() {
    let hashMap = new HashMap();
    hashMap.set(1, "A"); hashMap.set(2, "B"); hashMap.set(3, "C"); hashMap.set(4, "D"); hashMap.set(5, "E");
    let vals = []; let keys = [];
    hashMap.forEach((value, key) => { keys.push(key); vals.push(value); });
    for (let i = 0; i < keys.length; i++) { if (!hashMap.hasKey(keys[i])) return false; }
    for (let i = 0; i < vals.length; i++) { if (!hashMap.hasValue(vals[i])) return false; }
    return true;
}

export function test038() {
    let hashMap = new HashMap();
    let arr = [];
    hashMap.forEach((item, index) => { arr.push(item); });
    return arr.length === 0;
}

export function test039() {
    let hashMap = new HashMap();
    hashMap.set(1, "A"); hashMap.set(2, "B"); hashMap.set(3, "C"); hashMap.set(4, "D"); hashMap.set(5, "E");
    let arr = [];
    for (let [key, value] of hashMap) { arr.push([key, value]); }
    arr.sort(function (a, b) { return a[0] - b[0]; });
    for (let i = 0; i < arr.length; i++) {
        if (arr[i][0] !== i + 1) return false;
        if (arr[i][1] !== hashMap.get(i + 1)) return false;
    }
    return true;
}

export function test040() {
    let hashMap = new HashMap();
    let arr = [];
    for (let item of hashMap) { arr.push(item); }
    return arr.length === 0;
}

export function test041() {
    let hashMap = new HashMap();
    hashMap.set(1, "A"); hashMap.set(2, "B"); hashMap.set(3, "C"); hashMap.set(4, "D"); hashMap.set(5, "E");
    let res = hashMap.entries();
    let arr = [];
    for (let i = 0; i < hashMap.length; i++) {
        let obj = res.next();
        arr.push([obj.value[0], obj.value[1]]);
    }
    arr.sort(function (a, b) { return a[0] - b[0]; });
    for (let i = 0; i < arr.length; i++) {
        if (arr[i][0] !== i + 1) return false;
        if (arr[i][1] !== hashMap.get(i + 1)) return false;
    }
    return true;
}

export function test046() {
    let hashMap = new HashMap();
    hashMap.set(1, "A"); hashMap.set(2, "B"); hashMap.set(3, "C"); hashMap.set(4, "D"); hashMap.set(5, "E");
    let iters = hashMap[Symbol.iterator]();
    let flag = true;
    for (let i = 0, len = hashMap.length; i < len; i++) {
        let entry = iters.next().value;
        let res = hashMap.get(entry[0]);
        if (res != entry[1]) { flag = false; break; }
    }
    return flag;
}

export function test048() {
    let hashMap = new HashMap();
    hashMap.set(1, "A"); hashMap.set(2, "B");
    try {
        hashMap.setAll([1, 2, 3]);
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "map" must be HashMap. Received value is: 1,2,3`;
    }
}

export function test049() {
    let hashMap = new HashMap();
    hashMap.set(1, 1); hashMap.set(2, 2);
    let newHashmap = new HashMap();
    newHashmap.setAll(hashMap);
    if (newHashmap.length !== 2) return false;
    let keys = [];
    newHashmap.forEach((value, key) => { keys.push(key); });
    for (let i = 0; i < keys.length; i++) {
        if (!newHashmap.hasKey(i + 1)) return false;
    }
    return true;
}

export function test056() {
    let hashMap = new HashMap();
    try {
        hashMap.forEach(11);
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "callbackfn" must be callable. Received value is: 11`;
    }
}
