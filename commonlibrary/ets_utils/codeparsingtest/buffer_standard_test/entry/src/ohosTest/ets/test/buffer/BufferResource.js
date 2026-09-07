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

import buffer from '@ohos.buffer';

export function test0250() {
    let flag = false;
    let buf1 = buffer.from("1234");
    let entries = buf1.entries();
    let va = 49, index = 0;
    for (const [key, value] of entries) {
        if (key == index && value == va) {
            flag = true;
        }
        va++;
        index++;
    }
    return flag;
}

export function test0255() {
    let uarr = new Uint8Array(4);
    let flag = false;
    uarr[0] = 0x31;
    uarr[1] = 0x32;
    uarr[2] = 0x33;
    uarr[3] = 0x34;
    let buf1 = buffer.from(uarr);
    let entries = buf1.entries();
    let va = 49, index = 0;
    for (const [key, value] of entries) {
        if (key == index && value == va) {
            flag = true;
        }
        va++;
        index++;
    }
    return flag;
}

export function test0268() {
    class Foo {
        [Symbol.toPrimitive]() {
            return 'this is a test';
        }
    }

    const buf = buffer.from(new Foo(), 'utf8');
    let str = buf.toString();
    return str;
}


export async function test0270() {
    let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
    const value = await blob2.text();
    return value === "abc";
}

export function test0784() {
    let buf = buffer.from("1236");
    let buf1 = buffer.from("123");
    try {
        buf.buffer = buf1;
    } catch (err) {
        return err;
    }
    return null;
}

export function test0011() {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
        'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
        let buf = buffer.alloc(10).fill("ab$#", encode);
        if (buf.length !== 10) return false;
    }
    return true;
}

export function test0014() {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
        'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
        let buf = buffer.alloc(0).fill("ab$#", encode);
        if (buf.length !== 0) return false;
    }
    return true;
}

export function test0017() {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
        'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
        let buf = buffer.alloc(10, "ab$#", encode);
        if (buf.length !== 10) return false;
    }
    return true;
}

export function test0018() {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
        'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
        let buf = buffer.alloc(0, "ab$#", encode);
        if (buf.length !== 0) return false;
    }
    return true;
}

export function test0021() {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
        'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
        let buf = buffer.allocUninitializedFromPool(10).fill("abcd", encode);
        if (buf.length !== 10) return false;
    }
    return true;
}

export function test0024() {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
        'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
        let buf = buffer.allocUninitializedFromPool(0).fill("abcd", encode);
        if (buf.length !== 0) return false;
    }
    return true;
}

export function test0033() {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
        'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    let result = [4, 4, 8, 8, 4, 4, 4, 8, 8, 3, 3, 2];
    for (let i = 0; i < encodeArr.length; i++) {
        let byteLen = buffer.byteLength("abcd", encodeArr[i]);
        if (byteLen !== result[i]) return false;
    }
    return true;
}

export function test0034() {
    try {
        buffer.byteLength(10);
    } catch (err) {
        return err;
    }
    return null;
}

export function test0065() {
    let buf2 = buffer.from("1236");
    try {
        buffer.compare(10, buf2);
    } catch (err) {
        return err;
    }
    return null;
}

export function test0066() {
    let buf1 = buffer.from("1236");
    try {
        buffer.compare(buf1, 10);
    } catch (err) {
        return err;
    }
    return null;
}

export function test0072() {
    try {
        buffer.concat("test string");
    } catch (err) {
        return err;
    }
    return null;
}

export function test0075() {
    let uintarr = new Uint8Array(4);
    uintarr[0] = 0x31;
    uintarr[1] = 0x32;
    uintarr[2] = 0x33;
    uintarr[3] = 0x35;
    let buf1 = buffer.from("1236");
    let buf = buffer.concat([buf1, uintarr]);
    return buf.toString();
}

export function test0082() {
    try {
        buffer.transcode(10, "utf8", "ucs2");
    } catch (err) {
        return err;
    }
    return null;
}

export function test0083() {
    let buf1 = buffer.from("测试");
    try {
        buffer.transcode(buf1, 0, "ucs2");
    } catch (err) {
        return err;
    }
    return null;
}

export function test0084() {
    let buf1 = buffer.from("测试");
    try {
        buffer.transcode(buf1, "utf8", 0);
    } catch (err) {
        return err;
    }
    return null;
}

export function test0095() {
    try {
        buffer.alloc(3).fill("$*$", 0, 2, "code");
    } catch (err) {
        return err;
    }
    return null;
}

export function test0100() {
    let buf = buffer.alloc(5);
    let offset = buf.write("abcde", "latin1");
    let str = buf.toString();
    return offset === 5 && str === "abcde";
}

export function test0101() {
    let buf = buffer.alloc(6);
    let offset = buf.write("测试", "utf8");
    let str = buf.toString();
    return offset === 6 && str === "测试";
}

export function test0102() {
    let buf = buffer.alloc(8);
    let offset = buf.write("!@#$%^&*", "ascii");
    let str = buf.toString("ascii");
    return offset === 8 && str === "!@#$%^&*";
}

export function test0103() {
    let buf = buffer.alloc(8);
    try {
        buf.write("abcde", "utf9");
    } catch (err) {
        return err;
    }
    return null;
}

export function test0104() {
    let buf = buffer.alloc(8);
    try {
        buf.write(10);
    } catch (err) {
        return err;
    }
    return null;
}

export function test0107() {
    let buf = buffer.alloc(8);
    try {
        buf.write("abcde", 1, "code");
    } catch (err) {
        return err;
    }
    return null;
}

export function test0111() {
    let buf1 = buffer.from("1236");
    try {
        buf1.compare(10);
    } catch (err) {
        return err;
    }
    return null;
}

export function test0123() {
    let buf1 = buffer.from("1236");
    try {
        buf1.equals("1236");
    } catch (err) {
        return err;
    }
    return null;
}

export function test0145() {
    let buf1 = buffer.from("123656");
    try {
        buf1.copy(10);
    } catch (err) {
        return err;
    }
    return null;
}

export function test0160() {
    let buf1 = buffer.from("1236");
    let obj = buf1.toJSON();
    return obj.data.join("");
}

export function test0177() {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
        'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    let buf = buffer.from("13236");
    for (const encode of encodeArr) {
        let index = buf.indexOf("ab", 0, encode);
        if (index !== -1) return false;
    }
    return true;
}

export function test0178() {
    let buf1 = buffer.from("13236");
    try {
        buf1.indexOf(true);
    } catch (err) {
        return err;
    }
    return null;
}

export function test0179() {
    let buf1 = buffer.from("13236");
    try {
        buf1.indexOf("a", "code");
    } catch (err) {
        return err;
    }
    return null;
}

export function test0187() {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
        'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    let buf = buffer.from("13236");
    for (const encode of encodeArr) {
        let index = buf.lastIndexOf("ab", 0, encode);
        if (index !== -1) return false;
    }
    return true;
}

export function test0188() {
    let buf1 = buffer.from("13236");
    try {
        buf1.lastIndexOf(true);
    } catch (err) {
        return err;
    }
    return null;
}

export function test0189() {
    let buf1 = buffer.from("13236");
    try {
        buf1.lastIndexOf("a", "code");
    } catch (err) {
        return err;
    }
    return null;
}

export function test0197() {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
        'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
        let buf = buffer.from("13236");
        let flag = buf.includes("abc", 0, encode);
        if (flag !== false) return false;
    }
    return true;
}

export function test0198() {
    let buf1 = buffer.from("13236");
    try {
        buf1.includes(true);
    } catch (err) {
        return err;
    }
    return null;
}

export function test0276() {
    try {
        new buffer.Blob("abc", { type: "new type", endings: "transparent" });
    } catch (err) {
        return err;
    }
    return null;
}

export function test0314() {
    let buf = buffer.alloc(4);
    try {
        buf.writeInt32BE("string", 1);
    } catch (err) {
        return err;
    }
    return null;
}

export function test0532() {
    let buf = buffer.alloc(4);
    buf.writeInt32BE(0x12345678, 0);
    try {
        buf.readInt32BE("1");
    } catch (err) {
        return err;
    }
    return null;
}

export function test0783() {
    try {
        buffer.from(10);
    } catch (err) {
        return err;
    }
    return null;
}

export function test0786() {
    let arrayBuffer = new ArrayBuffer(5);
    let array = new Int8Array(arrayBuffer);
    array[0] = '1';
    array[1] = '2';
    array[2] = '3';
    array[3] = '4';
    array[4] = '5';
    try {
        buffer.from(arrayBuffer, 6, 1);
    } catch (err) {
        return err;
    }
    return null;
}

export function test30140() {
    try {
        let obj = new Map();
        buffer.from(obj, 0, 5);
    } catch (err) {
        return err;
    }
    return null;
}