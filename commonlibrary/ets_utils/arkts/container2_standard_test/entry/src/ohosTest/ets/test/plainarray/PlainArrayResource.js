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
import PlainArray from '@ohos.util.PlainArray';

export function test004() {
    let plainArray = new PlainArray();
    let c = { name: "lili", age: "13" };
    plainArray.add(1, c);
    return plainArray.get(1) === c;
}

export function test009() {
    let plainArray = new PlainArray();
    let clonePlainarray = plainArray.clone();
    if (clonePlainarray.length !== 0) return false;
    plainArray.add(1, "A"); plainArray.add(2, "B"); plainArray.add(3, "C"); plainArray.add(4, "D"); plainArray.add(5, "E");
    let res = plainArray.clone();
    let arr = [];
    res.forEach((value, index) => { arr.push(value); });
    let arr1 = ["A", "B", "C", "D", "E"];
    for (let i = 0; i < arr.length; i++) { if (arr[i] !== arr1[i]) return false; }
    return true;
}

export function test018() {
    let plainArray = new PlainArray();
    plainArray.add(1, "A"); plainArray.add(2, "B"); plainArray.add(3, "C"); plainArray.add(4, "D"); plainArray.add(5, "E");
    plainArray.removeRangeFrom(2, 2);
    let keys = [1, 2, 5];
    let values = ["A", "B", "E"];
    for (let i = 0; i < keys.length; i++) { if (values[i] !== plainArray.get(keys[i])) return false; }
    try {
        plainArray.removeRangeFrom(15, 5);
        return false;
    } catch (err) {
        if (!(err.name === "BusinessError" && err.code === 10200001 &&
            err.message === `The value of "index" is out of range. It must be >= 0 && <= 2. Received value is: 15`)) return false;
    }
    try {
        plainArray.removeRangeFrom(1, "a");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "size" must be small integer. Received value is: a`;
    }
}

export function test021() {
    let plainArray = new PlainArray();
    plainArray.add(1, "A"); plainArray.add(2, "B"); plainArray.add(3, "C"); plainArray.add(4, "D"); plainArray.add(5, "E");
    let arr = [];
    plainArray.forEach((value, index) => { arr.push(value); });
    let arr1 = ["A", "B", "C", "D", "E"];
    for (let i = 0; i < arr1.length; i++) { if (arr[i] !== arr1[i]) return false; }
    return true;
}

export function test026() {
    let plainArray = new PlainArray();
    try {
        let res = plainArray.add("a", null);
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "key" must be small integer. Received value is: a`;
    }
}

export function test033() {
    let plainArray = new PlainArray();
    try {
        let res = plainArray.removeAt("a");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "index" must be small integer. Received value is: a`;
    }
}

export function test039() {
    let plainArray = new PlainArray();
    plainArray.add(1, "ABCd");
    plainArray.add(2, "~!@#$^&*()_+-*/=.?<>:;|{}[]");
    plainArray.add(3, null);
    plainArray.add(4, undefined);
    plainArray.add(5, []);
    plainArray.add(6, {});
    plainArray.add(7, true);
    plainArray.add(8, 1234);
    plainArray.add(9, 1.234);
    plainArray.add(10, -1234);
    return plainArray.get(2) === "~!@#$^&*()_+-*/=.?<>:;|{}[]";
}

export function test040() {
    let plainArray = new PlainArray();
    plainArray.add(-2, "b");
    try {
        plainArray.add("a", "c");
        return false;
    } catch (err) {
        if (!(err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "key" must be small integer. Received value is: a`)) return false;
    }
    return plainArray.get(-2) === "b";
}

export function test041() {
    let plainArray = new PlainArray();
    plainArray.add(1, 1);
    plainArray.add(2, "b");
    plainArray.add(3, true);
    plainArray.add(4, [1, 2, 3, 4]);
    plainArray.add(5, { name: "lili", age: "13" });
    plainArray.add(6, undefined);
    plainArray.add(7, null);
    return plainArray.get(2) === "b";
}

export function test042() {
    let plainArray = new PlainArray();
    plainArray.add(1, "A"); plainArray.add(2, "B"); plainArray.add(3, "C"); plainArray.add(4, "D"); plainArray.add(5, "E");
    let iters = plainArray[Symbol.iterator]();
    let flag = true;
    for (let i = 0, len = plainArray.length; i < len; i++) {
        let entry = iters.next().value;
        let res = plainArray.get(entry[0]);
        if (res != entry[1]) { flag = false; break; }
    }
    return flag;
}

export function test043() {
    let plainArray = new PlainArray();
    plainArray.add(-2, "b");
    try {
        plainArray.add("b", "a");
        return false;
    } catch (err) {
        if (!(err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "key" must be small integer. Received value is: b`)) return false;
    }
    return plainArray.get(-2) === "b";
}

export function test044() {
    let plainArray = new PlainArray();
    plainArray.add(1, "A"); plainArray.add(2, "B"); plainArray.add(3, "C"); plainArray.add(4, "D"); plainArray.add(5, "E");
    try {
        plainArray.has("a");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "key" must be small integer. Received value is: a`;
    }
}

export function test045() {
    let plainArray = new PlainArray();
    plainArray.add(1, "A"); plainArray.add(2, "B"); plainArray.add(3, "C"); plainArray.add(4, "D"); plainArray.add(5, "E");
    try {
        plainArray.get("a");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "key" must be small integer. Received value is: a`;
    }
}

export function test046() {
    let plainArray = new PlainArray();
    plainArray.add(1, "A"); plainArray.add(2, "B"); plainArray.add(3, "C"); plainArray.add(4, "D"); plainArray.add(5, "E");
    try {
        plainArray.getIndexOfKey("a");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "key" must be small integer. Received value is: a`;
    }
}

export function test047() {
    let plainArray = new PlainArray();
    plainArray.add(1, "A"); plainArray.add(2, "B"); plainArray.add(3, "C"); plainArray.add(4, "D"); plainArray.add(5, "E");
    try {
        plainArray.getKeyAt("a");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "index" must be small integer. Received value is: a`;
    }
}
