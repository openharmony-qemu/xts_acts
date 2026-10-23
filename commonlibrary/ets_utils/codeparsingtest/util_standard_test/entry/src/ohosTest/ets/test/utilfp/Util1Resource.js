/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import util from '@ohos.util';
import url from '@ohos.url';
import app from '@system.app';
import process from '@ohos.process';
import file from '@system.file';

class Temperature {
    constructor(value) {
        this._temp = value;
    }

    compareTo(value) {
        return this._temp >= value.getTemp();
    }

    getTemp() {
        return this._temp;
    }

    toString() {
        return this._temp.toString();
    }

    _temp = 0;
}

class MyClassBase {
    baseBuffer = 'baseData';
    strBuffer = 'intBase';

    setMethod(arg) {
        return arg + 100;
    }

    setBase(arg) {
        this.baseBuffer = arg;
    }

    setData(arg) {
        return arg + 2;
    }

    setBuffer(arg) {
        this.strBuffer = arg;
    }
}

class MyClass extends MyClassBase {
    msg = 'msg123';
    static buffer = 'data';
    static str = 'strData';

    foo(arg1, arg2) {
        return this.msg;
    }

    static bar(arg1) {
        return MyClass.buffer;
    }

    func(arg) {
        return arg;
    }

    async myAsync(arg) {
        return arg;
    }

    myFunc(arg) {
        this.msg = arg;
    }

    static async printData(arg) {
        return 0;
    }

    myFoo() {
        return 0;
    }

    getData(arg) {
        return 0;
    }

    async beforeAsync(arg) {
        return arg;
    }

    static getBar(arg1) {
        return MyClass.str;
    }

    async myBeforeAsync(arg) {
        return arg;
    }
}

class AfterClass extends MyClassBase {
    msg = 'msg123';
    message = 'messageData';
    static buffer = 'data';
    static str = 'strData';

    afterFoo(arg1, arg2) {
        return this.message;
    }

    foo(arg1, arg2) {
        return this.msg;
    }

    static bar(arg1) {
        return AfterClass.buffer;
    }

    func(arg) {
        return arg;
    }

    async myAsync(arg) {
        return arg;
    }

    myFunc(arg) {
        this.msg = arg;
    }

    afterFunc(arg) {
        this.message = arg;
    }

    static async printData(arg) {
        return 0;
    }

    myFoo() {
        return 0;
    }

    getData(arg) {
        return 0;
    }

    async afterAsync(arg) {
        return arg;
    }

    static getBar(arg1) {
        return AfterClass.str;
    }

    async myAfterAsync(arg) {
        return arg;
    }
}

class ReplaceClass extends MyClassBase {
    msg = 'msg123';
    static buffer = 'data';
    static str = 'strData';

    foo(arg1, arg2) {
        return this.msg;
    }

    static bar(arg1) {
        return ReplaceClass.buffer;
    }

    func(arg) {
        return arg;
    }

    async myAsync(arg) {
        return arg;
    }

    myFunc(arg) {
        this.msg = arg;
    }

    static async printData(arg) {
        return 0;
    }

    myFoo() {
        return 0;
    }

    getData(arg) {
        return 0;
    }

    async replaceAsync(arg) {
        return arg;
    }

    static getBar(arg1) {
        return ReplaceClass.str;
    }
}

class DeviceManageViewModel {
    static ans = '';

    constructor(heldValue) {
        util.AutoFinalizerCleaner.register(this, heldValue);
    }

    onFinalization(heldValue) {
        DeviceManageViewModel.ans = heldValue;
    }
}

let tempLower = new Temperature(30);
let tempUpper = new Temperature(40);
let tempLess = new Temperature(20);
let tempMiDF = new Temperature(35);
let tempMidS = new Temperature(39);
let tempMore = new Temperature(45);

let range = new util.Scope(tempLower, tempUpper);
let rangeFir = new util.Scope(tempMiDF, tempMidS);
let rangeSec = new util.Scope(tempLess, tempMore);
let rangeThi = new util.Scope(tempLess, tempMiDF);
let rangeFif = new util.Scope(tempMiDF, tempMore);

function promiseCase() {
    let p = new Promise(function (resolve, reject) {
        setTimeout(() => {
            resolve(0)
        }, 5)
    }).then(undefined, (error) => {
    })
    return p
}


export function testUtilPrintf001() {
    let results = [];
    let format = "%i,%s";
    let value1 = 1.5;
    let value2 = "qwer";
    let value3 = 15;
    let result = util.printf(format, value1, value2, value3);
    results.push(String(result));
    return results.join('\x00');
}

export function testUtilPrintf002() {
    let results = [];
    let format = "%O";
    let value = { name: 'jack', age: 15 };
    let result = util.printf(format, value);
    results.push(String(result));
    return results.join('\x00');
}

export function testUtilPrintf003() {
    let results = [];
    let format = "%o";
    let value = [1, 2, 3];
    let result = util.printf(format, value);
    let res = '[ 1, 2, 3, [length]: 3 ]'
    results.push(String(result));
    return results.join('\x00');
}

export function testUtilPrintf004() {
    let results = [];
    let format = "%s,%s,%s";
    let value1 = "1.5";
    let value2 = "qwer";
    let result = util.printf(format, value1, value2);
    results.push(String(result));
    return results.join('\x00');
}

export function testUtilPrintf005() {
    let results = [];
    let format = "%d,%d";
    let value1 = 6;
    let value2 = 16;
    let result = util.printf(format, value1, value2);
    results.push(String(result));
    return results.join('\x00');
}

export async function testUtilGetErrorString001() {
    let results = [];
    let errnum = 10;
    let result = util.getErrorString(errnum);
    results.push(String(result));
    return results.join('\x00');
}

export async function testUtilGetErrorString002() {
    let results = [];
    let errnum = 0;
    let result = util.getErrorString(errnum);
    results.push(String(result));
    return results.join('\x00');
}

export async function testUtilGetErrorString003() {
    let results = [];
    let errnum = -1;
    let result = util.getErrorString(errnum);
    results.push(String(result));
    return results.join('\x00');
}

export async function testUtilGetErrorString004() {
    let results = [];
    let errnum = 9;
    let result = util.getErrorString(errnum);
    results.push(String(result));
    return results.join('\x00');
}

export async function testUtilGetErrorString005() {
    let results = [];
    let errnum = 555;
    let result = util.getErrorString(errnum);
    results.push(String(result));
    return results.join('\x00');
}

export async function testUtilPromisify_new_001() {
    let results = [];

    function fn(val, callback) {
        if (typeof val === 'string') {
            callback(null, val);
        } else {
            callback('type err');
        }
    }

    let value = util.promisify(fn);
    let res = ""
    res = await value("Hello");
    results.push(String(String(res)));
    return results.join('\x00');
}

export async function testUtilPromisify_new_002() {
    let results = [];

    function fn(str, callback) {
        if (typeof str === 'string') {
            callback(null, str);
        } else {
            callback('type err');
        }
    }

    let value = util.promisify(fn);
    let res;
    let flag = false;
    value([1, 2]).then((d) => {
        flag = true;
        res = d;
    }).catch((e) => {
        flag = true;
        res = e;
    })
    while (!flag) {
        await promiseCase()
    }
    results.push(String(res));
    return results.join('\x00');
}

export async function testUtilPromisify_new_003() {
    let results = [];

    function fn(val, callback) {
        callback(null, val);
    }

    const value = util.promisify(fn);
    let res = 0;
    res = await value(42);
    results.push(String(Number(res)));
    return results.join('\x00');
}

export async function testUtilPromisify_new_004() {
    let results = [];

    function fn(val, callback) {
        if (typeof val === 'boolean') {
            callback(null, val);
        } else {
            callback('type err');
        }
    }

    const value = util.promisify(fn);
    results.push(String(Boolean(await value(true))));
    return results.join('\x00');
}

export async function testUtilPromisify_new_005() {
    let results = [];

    function fn(val, callback) {
        if (typeof val === 'number') {
            callback(null, val);
        } else {
            callback('type err');
        }
    }

    const value = util.promisify(fn);
    results.push(String(Number(await value(100))));
    return results.join('\x00');
}

export async function testUtilPromiseWrapper001() {
    let results = [];

    function aysnFun(str1, str2, callback) {
        if (typeof str1 === 'string' && typeof str1 === 'string') {
            callback(null, str1 + str2);
        } else {
            callback('type err');
        }
    }

    let newPromiseObj = util.promiseWrapper(aysnFun);
    let res = await newPromiseObj("Hello", 'World');
    results.push(String(String(res)));
    return results.join('\x00');
}

export async function testUtilPromiseWrapper002() {
    let results = [];

    function aysnFun(str1, str2, callback) {
        if (typeof str1 === 'string' && typeof str1 === 'string') {
            callback(null, str1 + str2);
        } else {
            callback('type err');
        }
    }

    let newPromiseObj = util.promiseWrapper(aysnFun);
    let res = "";
    let flag = false;
    newPromiseObj([1, 2], 'World').catch((err) => {
        flag = true;
        res = err;
    })
    while (!flag) {
        await promiseCase()
    }
    results.push(String(String(res)));
    return results.join('\x00');
}

export async function testUtilPromiseWrapper003() {
    let results = [];
    const thrower = util.promiseWrapper(function (a, b, c, cb) {
        throw new Error("123");
    });
    let res = "";
    let flag = false;
    thrower(1, 2, 3).catch((err) => {
        res = err;
        flag = true;
    })
    while (!flag) {
        await promiseCase()
    }
    results.push(String(String(res)));
    return results.join('\x00');
}

export async function testUtilPromiseWrapper004() {
    let results = [];
    const err = new Error("123");
    const a = util.promiseWrapper((cb) => cb(err))();
    const b = util.promiseWrapper(() => {
        throw err;
    })();
    let res = "";
    let flag = 0;
    Promise.all([
        a.catch((e) => {
            res += e.message;
            flag += 1;
        }),
        b.catch((e) => {
            res += e.message;
            flag += 1;
        })
    ]);
    while (flag != 2) {
        await promiseCase()
    }
    results.push(String(res));
    return results.join('\x00');
}

export async function testUtilPromiseWrapper005() {
    let results = [];
    const err = new Error('callback with the error.');
    const stack = err.stack;
    const fn = util.promiseWrapper(function (cb) {
        cb(null, "success");
        cb(err);
    });
    let res = await fn();
    results.push(String(String(res)));
    return results.join('\x00');
}

export async function testUtilPromiseWrapper006() {
    let results = [];

    function fn(err, val, callback) {
        callback(err, val);
    }

    const value = await util.promiseWrapper(fn)(null, 42);
    results.push(String(Number(value)));
    return results.join('\x00');
}

export async function testUtilCallbackWrapper001() {
    let results = [];
    const promiseFn = [1, 2];
    try {
        util.callbackWrapper(promiseFn);
    } catch (e) {
        results.push(String(e.toString()));
    }
    return results.join('\x00');
}

export async function testUtilCallbackWrapper002() {
    let results = [];

    async function promiseFn() {
        return Promise.resolve('value');
    }

    let cb = util.callbackWrapper(promiseFn);
    let resErr = ""
    let resRet = ""
    let flag = false
    cb((err, ret) => {
        resErr = err;
        resRet = ret;
        flag = true;
    })
    while (!flag) {
        await promiseCase()
    }
    results.push(String(resErr));
    results.push(String(resRet));
    return results.join('\x00');
}

export async function testUtilCallbackWrapper003() {
    let results = [];

    async function promiseFn() {
        return 42;
    }

    let cb = util.callbackWrapper(promiseFn);
    let resErr = ""
    let resRet = ""
    let flag = false
    cb((err, ret) => {
        resErr = err;
        resRet = ret;
        flag = true;
    })
    while (!flag) {
        await promiseCase()
    }
    results.push(String(resErr));
    results.push(String(resRet));
    return results.join('\x00');
}

export async function testUtilCallbackWrapper004() {
    let results = [];

    async function promiseFn() {
        let err = Error('value');
        return Promise.reject(err);
    }

    let cb = util.callbackWrapper(promiseFn);
    let resErr;
    let resRet = "";
    let flag = false
    cb((err, ret) => {
        resErr = err;
        resRet = ret;
        flag = true;
    })
    while (!flag) {
        await promiseCase()
    }
    results.push(String(resErr.message));
    results.push(String(resRet));
    return results.join('\x00');
}

export async function testUtilCallbackWrapper005() {
    let results = [];

    async function promiseFn(a, b) {
        return a + b;
    }

    let cb = util.callbackWrapper(promiseFn);
    let resErr;
    let resRet = "";
    let flag = false
    cb(1, 2, (err, ret) => {
        resErr = err;
        resRet = ret;
        flag = true;
    })
    while (!flag) {
        await promiseCase()
    }
    results.push(String(resErr));
    results.push(String(resRet));
    return results.join('\x00');
}

export async function testUtilCallbackWrapper006() {
    let results = [];

    async function promiseFn() {
        return null;
    }

    let cb = util.callbackWrapper(promiseFn);
    try {
        cb([1, 2]);
    } catch (err) {
        results.push(String(err.message));
    }
    return results.join('\x00');
}

export function testencoding_textdecoder_001() {
    let results = [];
    let that = new util.TextDecoder('utf-8', { ignoreBOM: true })
    let retStr = that.encoding
    results.push(String(retStr));
    return results.join('\x00');
}

export function testencoding_textdecoder_002() {
    let results = [];
    let that = new util.TextDecoder('utf-16le')
    let encodingStr = that.encoding
    results.push(String(encodingStr));
    return results.join('\x00');
}

export function testencoding_textdecoder_003() {
    let results = [];
    let that = new util.TextDecoder('utf-16be')
    let encodingStr = that.encoding
    results.push(String(encodingStr));
    return results.join('\x00');
}

export function testencoding_textdecoder_004() {
    let results = [];
    let that = new util.TextDecoder('utf-16be', { ignoreBOM: true })
    let encodingStr = that.encoding
    results.push(String(encodingStr));
    return results.join('\x00');
}

export function testencoding_textdecoder_005() {
    let results = [];
    let that = new util.TextDecoder('utf-16be', { ignoreBOM: false })
    let encodingStr = that.encoding
    results.push(String(encodingStr));
    return results.join('\x00');
}

export function testencoding_textdecoder_006() {
    let results = [];
    let that = new util.TextDecoder(undefined);
    let encodingStr = that.encoding;
    results.push(String(encodingStr));
    return results.join('\x00');
}

export function testencoding_textdecoder_007() {
    let results = [];
    let that = new util.TextDecoder('utf-8', undefined);
    let encodingStr = that.encoding;
    results.push(String(encodingStr));
    return results.join('\x00');
}

export function testencoding_textdecoder_008() {
    let results = [];
    let that = new util.TextDecoder(undefined, { ignoreBOM: true });
    let encodingStr = that.encoding;
    results.push(String(encodingStr));
    return results.join('\x00');
}

export function testencoding_textdecoder_009() {
    let results = [];
    let that = new util.TextDecoder(null);
    let encodingStr = that.encoding;
    results.push(String(encodingStr));
    return results.join('\x00');
}

export function testencoding_textdecoder_010() {
    let results = [];
    let that = new util.TextDecoder('utf-8', null);
    let encodingStr = that.encoding;
    results.push(String(encodingStr));
    return results.join('\x00');
}

export function testencoding_textdecoder_011() {
    let results = [];
    let that = new util.TextDecoder(null, { ignoreBOM: true });
    let encodingStr = that.encoding;
    results.push(String(encodingStr));
    return results.join('\x00');
}

export function testFatal001() {
    let results = [];
    let that = new util.TextDecoder('utf-16be', { fatal: true })
    let fatalStr = that.fatal
    results.push(String(fatalStr));
    return results.join('\x00');
}

export function testFatal002() {
    let results = [];
    let that = new util.TextDecoder('utf-16be', { fatal: false })
    let fatalStr = that.fatal
    results.push(String(fatalStr));
    return results.join('\x00');
}

export function testFatal003() {
    let results = [];
    let that = new util.TextDecoder('utf-16be')
    let fatalStr = that.fatal
    results.push(String(fatalStr));
    return results.join('\x00');
}

export function testFatal004() {
    let results = [];
    let that = new util.TextDecoder('utf-8')
    let fatalStr = that.fatal
    results.push(String(fatalStr));
    return results.join('\x00');
}

export function testFatal005() {
    let results = [];
    let that = new util.TextDecoder('utf-16le')
    let fatalStr = that.fatal
    results.push(String(fatalStr));
    return results.join('\x00');
}

export function testFatal006() {
    let results = [];
    let that = new util.TextDecoder('gbk')
    let fatalStr = that.fatal
    results.push(String(fatalStr));
    return results.join('\x00');
}

export function testFatal007() {
    let results = [];
    let that = new util.TextDecoder('gb18030')
    let fatalStr = that.fatal
    results.push(String(fatalStr));
    return results.join('\x00');
}

export function testFatal008() {
    let results = [];
    let that = new util.TextDecoder('gb2312')
    let fatalStr = that.fatal
    results.push(String(fatalStr));
    return results.join('\x00');
}

export function testIgnoreBOM001() {
    let results = [];
    let that = new util.TextDecoder('utf-16be', { ignoreBOM: true })
    let ignoreBOMStr = that.ignoreBOM
    results.push(String(ignoreBOMStr));
    return results.join('\x00');
}

export function testIgnoreBOM002() {
    let results = [];
    let that = new util.TextDecoder('utf-16be', { ignoreBOM: false })
    let ignoreBOMStr = that.ignoreBOM
    results.push(String(ignoreBOMStr));
    return results.join('\x00');
}

export function testIgnoreBOM003() {
    let results = [];
    let that = new util.TextDecoder('utf-16be')
    let ignoreBOMStr = that.ignoreBOM
    results.push(String(ignoreBOMStr));
    return results.join('\x00');
}

export function testIgnoreBOM004() {
    let results = [];
    let that = new util.TextDecoder('utf-8')
    let ignoreBOMStr = that.ignoreBOM
    results.push(String(ignoreBOMStr));
    return results.join('\x00');
}

export function testIgnoreBOM005() {
    let results = [];
    let that = new util.TextDecoder('utf-16le')
    let ignoreBOMStr = that.ignoreBOM
    results.push(String(ignoreBOMStr));
    return results.join('\x00');
}

export function testIgnoreBOM006() {
    let results = [];
    let that = new util.TextDecoder('gbk')
    let ignoreBOMStr = that.ignoreBOM
    results.push(String(ignoreBOMStr));
    return results.join('\x00');
}

export function testIgnoreBOM007() {
    let results = [];
    let that = new util.TextDecoder('gb18030')
    let ignoreBOMStr = that.ignoreBOM
    results.push(String(ignoreBOMStr));
    return results.join('\x00');
}

export function testIgnoreBOM008() {
    let results = [];
    let that = new util.TextDecoder('gb2312')
    let ignoreBOMStr = that.ignoreBOM
    results.push(String(ignoreBOMStr));
    return results.join('\x00');
}

export function testdecode_testdecode_001() {
    let results = [];
    let that = new util.TextDecoder('utf-8');
    let arr = new Uint8Array(3);
    for (let i = 0; i < 3; i++) {
        arr[i] = 0x61 + i;
    }
    let retStr = that.decode(arr);
    let rel = 'abc';
    results.push(String(retStr));
    results.push(String(rel));
    return results.join('\x00');
}

export function testdecode_testdecode_002() {
    let results = [];
    let that = new util.TextDecoder('utf-16le')
    let arr = new Uint8Array(6)
    arr[0] = 0x61;
    arr[1] = 0x00;
    arr[2] = 0x62;
    arr[3] = 0x00;
    arr[4] = 0x63;
    arr[5] = 0x00;
    let retStr = that.decode(arr)
    let rel = 'abc'
    results.push(String(retStr));
    results.push(String(rel));
    return results.join('\x00');
}

export function testdecode_testdecode_003() {
    let results = [];
    let that = new util.TextDecoder('utf-16be');
    let arr = new Uint8Array(6);
    arr[0] = 0x00;
    arr[1] = 0x61;
    arr[2] = 0x00;
    arr[3] = 0x62;
    arr[4] = 0x00;
    arr[5] = 0x63;
    let retStr = that.decode(arr);
    let rel = 'abc'
    results.push(String(retStr));
    results.push(String(rel));
    return results.join('\x00');
}

export function testdecode_testdecode_004() {
    let results = [];
    let that = new util.TextDecoder('utf-8', { ignoreBOM: true })
    let arr = new Uint8Array(6)
    arr[0] = 0xEF;
    arr[1] = 0xBB;
    arr[2] = 0xBF;
    arr[3] = 0x61;
    arr[4] = 0x62;
    arr[5] = 0x63;
    let retStr = that.decode(arr, { stream: false })
    let BOM = '\uFEFF'
    let rel = 'abc'
    let re = BOM + rel
    results.push(String(retStr));
    results.push(String(re));
    return results.join('\x00');
}

export function testdecode_testdecode_005() {
    let results = [];
    let that = new util.TextDecoder('utf-16le', { ignoreBOM: false })
    let arr = new Uint8Array(8)
    arr[0] = 0xFF;
    arr[1] = 0xFE;
    arr[2] = 0x61;
    arr[3] = 0x00;
    arr[4] = 0x62;
    arr[5] = 0x00
    arr[6] = 0x63;
    arr[7] = 0x00;
    let retStr = that.decode(arr, { stream: false })
    let BOM = '\uFEFF'
    let rel = 'abc'
    let re = BOM + rel
    results.push(String(retStr));
    results.push(String(re));
    return results.join('\x00');
}

export function testdecode_testdecode_006() {
    let results = [];
    let that = new util.TextDecoder('gbk')
    let arr = new Uint8Array(8)
    arr[0] = 0xC4;
    arr[1] = 0xE3;
    arr[2] = 0xBA;
    arr[3] = 0xC3;
    arr[4] = 0xCA;
    arr[5] = 0xC0;
    arr[6] = 0xBD;
    arr[7] = 0xE7;
    let retStr = that.decode(arr)
    let rel = '你好世界'
    results.push(String(retStr));
    results.push(String(rel));
    return results.join('\x00');
}

export function testdecode_testdecode_007() {
    let results = [];
    let that = new util.TextDecoder('gb18030')
    let arr = new Uint8Array(8)
    arr[0] = 0xC4;
    arr[1] = 0xE3;
    arr[2] = 0xBA;
    arr[3] = 0xC3;
    arr[4] = 0xCA;
    arr[5] = 0xC0;
    arr[6] = 0xBD;
    arr[7] = 0xE7;
    let retStr = that.decode(arr)
    let rel = '你好世界'
    results.push(String(retStr));
    results.push(String(rel));
    return results.join('\x00');
}

export function testdecode_testdecode_008() {
    let results = [];
    let that = new util.TextDecoder('gb2312')
    let arr = new Uint8Array(8)
    arr[0] = 0xC4;
    arr[1] = 0xE3;
    arr[2] = 0xBA;
    arr[3] = 0xC3;
    arr[4] = 0xCA;
    arr[5] = 0xC0;
    arr[6] = 0xBD;
    arr[7] = 0xE7;
    let retStr = that.decode(arr)
    let rel = '你好世界'
    results.push(String(retStr));
    results.push(String(rel));
    return results.join('\x00');
}

export function testdecode_testdecode_009() {
    let results = [];
    let that = new util.TextDecoder('utf-8', { ignoreBOM: true })
    let arr = new Uint8Array(6)
    arr[0] = 0xEF;
    arr[1] = 0xBB;
    arr[2] = 0xBF;
    arr[3] = 0x61;
    arr[4] = 0x62;
    arr[5] = 0x63;
    let retStr = that.decode(arr, undefined)
    let BOM = '\uFEFF'
    let rel = 'abc'
    let res = BOM + rel
    results.push(String(retStr));
    results.push(String(res));
    return results.join('\x00');
}

export function testdecode_testdecode_010() {
    let results = [];
    let that = new util.TextDecoder('utf-8', { ignoreBOM: true });
    let arr = new Uint8Array(6);
    arr[0] = 0xEF;
    arr[1] = 0xBB;
    arr[2] = 0xBF;
    arr[3] = 0x61;
    arr[4] = 0x62;
    arr[5] = 0x63;
    let retStr = that.decode(arr, null);
    let BOM = '\uFEFF'
    let rel = 'abc'
    let res = BOM + rel
    results.push(String(retStr));
    results.push(String(res));
    return results.join('\x00');
}

export function decodeWithStream001() {
    let results = [];
    let that = new util.TextDecoder('utf-16le', { ignoreBOM: false });
    let arr = new Uint8Array(8)
    arr[0] = 0xFF;
    arr[1] = 0xFE;
    arr[2] = 0x61;
    arr[3] = 0x00;
    arr[4] = 0x62;
    arr[5] = 0x00;
    arr[6] = 0x63;
    arr[7] = 0x00;
    let retStr = that.decodeWithStream(arr, { stream: false });
    let BOM = '\uFEFF';
    let rel = 'abc';
    let re = BOM + rel;
    results.push(String(retStr));
    results.push(String(re));
    return results.join('\x00');
}

export function decodeWithStream002() {
    let results = [];
    let that = new util.TextDecoder('utf-8', { ignoreBOM: true })
    let arr = new Uint8Array(6)
    arr[0] = 0xEF;
    arr[1] = 0xBB;
    arr[2] = 0xBF;
    arr[3] = 0x61;
    arr[4] = 0x62;
    arr[5] = 0x63;
    let retStr = that.decodeWithStream(arr, { stream: true })
    let BOM = '\uFEFF'
    let rel = 'abc'
    let re = BOM + rel;
    results.push(String(retStr));
    results.push(String(re));
    return results.join('\x00');
}

export function decodeWithStream003() {
    let results = [];
    let that = new util.TextDecoder('utf-16be');
    let arr = new Uint8Array(6);
    arr[0] = 0x00;
    arr[1] = 0x61;
    arr[2] = 0x00;
    arr[3] = 0x62;
    arr[4] = 0x00;
    arr[5] = 0x63;
    let retStr = that.decodeWithStream(arr);
    let rel = 'abc'
    results.push(String(retStr));
    results.push(String(rel));
    return results.join('\x00');
}

export function decodeWithStream004() {
    let results = [];
    let that = new util.TextDecoder('utf-16le')
    let arr = new Uint8Array(6)
    arr[0] = 0x61;
    arr[1] = 0x00;
    arr[2] = 0x62;
    arr[3] = 0x00;
    arr[4] = 0x63;
    arr[5] = 0x00;
    let retStr = that.decodeWithStream(arr);
    let rel = 'abc'
    results.push(String(retStr));
    results.push(String(rel));
    return results.join('\x00');
}

export function decodeWithStream005() {
    let results = [];
    let that = new util.TextDecoder('utf-8');
    let arr = new Uint8Array(3);
    for (let i = 0; i < 3; i++) {
        arr[i] = 0x61 + i;
    }
    let retStr = that.decodeWithStream(arr);
    let rel = 'abc';
    results.push(String(retStr));
    results.push(String(rel));
    return results.join('\x00');
}

export function decodeWithStream006() {
    let results = [];
    let that = new util.TextDecoder('utf-16le')
    let arr = new Uint8Array(6)
    arr[0] = 0x61;
    arr[1] = 0x00;
    arr[2] = 0x62;
    arr[3] = 0x00;
    arr[4] = 0x63;
    arr[5] = 0x00;
    let retStr = that.decodeWithStream(arr, undefined);
    let rel = 'abc'
    results.push(String(retStr));
    results.push(String(rel));
    return results.join('\x00');
}

export function decodeWithStream007() {
    let results = [];
    let that = new util.TextDecoder('utf-16le')
    let arr = new Uint8Array(6)
    arr[0] = 0x61;
    arr[1] = 0x00;
    arr[2] = 0x62;
    arr[3] = 0x00;
    arr[4] = 0x63;
    arr[5] = 0x00;
    let retStr = that.decodeWithStream(arr, null);
    let rel = 'abc'
    results.push(String(retStr));
    results.push(String(rel));
    return results.join('\x00');
}

export function testencoding_textencoder_001() {
    let results = [];
    let that = new util.TextEncoder()
    let str = that.encoding
    results.push(String(str));
    return results.join('\x00');
}

export function testencoding_textencoder_002() {
    let results = [];
    let that = new util.TextEncoder('gb18030')
    let str = that.encoding
    results.push(String(str));
    that = new util.TextEncoder('GB18030')
    str = that.encoding;
    results.push(String(str));
    return results.join('\x00');
}

export function testencoding_textencoder_003() {
    let results = [];
    let that = new util.TextEncoder('gbk')
    let str = that.encoding
    results.push(String(str));
    that = new util.TextEncoder('GBK')
    str = that.encoding;
    results.push(String(str));
    return results.join('\x00');
}

export function testencoding_textencoder_004() {
    let results = [];
    let that = new util.TextEncoder('gb2312')
    let str = that.encoding
    results.push(String(str));
    that = new util.TextEncoder('GB2312')
    str = that.encoding;
    results.push(String(str));
    return results.join('\x00');
}

export function testencoding_textencoder_005() {
    let results = [];
    let encode1 = new util.TextEncoder(undefined)
    let str1 = encode1.encoding
    results.push(String(str1));
    let encode2 = new util.TextEncoder(null)
    let str2 = encode2.encoding
    results.push(String(str2));
    return results.join('\x00');
}

export function testEncode001() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encode('abc')
    results.push(String(result[0]));
    results.push(String(0x61));
    return results.join('\x00');
}

export function testEncode002() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encode('\uD800楼楼')
    results.push(String(result[5]));
    return results.join('\x00');
}

export function testEncode003() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encode('a\uD800楼楼')
    results.push(String(result[0]));
    results.push(String(0x61));
    return results.join('\x00');
}

export function testEncode004() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encode('abc\uD800楼楼')
    results.push(String(result[1]));
    results.push(String(0x62));
    return results.join('\x00');
}

export function testEncode005() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encode('123\uD800楼楼')
    results.push(String(result[0]));
    results.push(String(result[9]));
    return results.join('\x00');
}

export function testEncode006() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encode('123¥\uD800楼')
    results.push(String(result[10]));
    results.push(String(0xbc));
    return results.join('\x00');
}

export function testEncode007() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encode('¥¥')
    results.push(String(result[0]));
    results.push(String(0xc2));
    return results.join('\x00');
}

export function testEncode008() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encode('$$')
    results.push(String(result[0]));
    results.push(String(0x24));
    return results.join('\x00');
}

export function testEncode009() {
    let results = [];
    let that = new util.TextEncoder('gb18030')
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encode('abc哈哈熠熠')
    results.push(String(result[0]));
    results.push(String(result[3]));
    results.push(String(result[4]));
    results.push(String(result[7]));
    results.push(String(result[8]));
    return results.join('\x00');
}

export function testEncode0010() {
    let results = [];
    let that = new util.TextEncoder('GB18030')
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encode('abc哈哈熠熠')
    results.push(String(result[0]));
    results.push(String(result[3]));
    results.push(String(result[4]));
    results.push(String(result[7]));
    results.push(String(result[8]));
    return results.join('\x00');
}

export function testEncode0011() {
    let results = [];
    let that = new util.TextEncoder('GBK')
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encode('abc哈哈熠熠')
    results.push(String(result[0]));
    results.push(String(result[3]));
    results.push(String(result[4]));
    results.push(String(result[7]));
    results.push(String(result[8]));
    return results.join('\x00');
}

export function testEncode012() {
    let results = [];
    let that = new util.TextEncoder('gbk')
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encode('abc哈哈熠熠')
    results.push(String(result[0]));
    results.push(String(result[3]));
    results.push(String(result[4]));
    results.push(String(result[7]));
    results.push(String(result[8]));
    return results.join('\x00');
}

export function testEncode013() {
    let results = [];
    let that = new util.TextEncoder('gb2312')
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encode('abc哈哈熠熠')
    results.push(String(result[0]));
    results.push(String(result[3]));
    results.push(String(result[4]));
    results.push(String(result[7]));
    results.push(String(result[8]));
    return results.join('\x00');
}

export function testEncode014() {
    let results = [];
    let that = new util.TextEncoder('GB2312')
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encode('abc哈哈熠熠')
    results.push(String(result[0]));
    results.push(String(result[3]));
    results.push(String(result[4]));
    results.push(String(result[7]));
    results.push(String(result[8]));
    return results.join('\x00');
}

export function testEncode015() {
    let results = [];
    let that = new util.TextEncoder('GB18030')
    let buffer = new ArrayBuffer(900)
    let result = new Uint8Array(buffer)
    result = that.encode(
        'abcd哈哈哈哈哈哈哈哈哈哈哈哈哈abcd哈哈哈哈哈哈哈哈哈哈哈哈哈abcd哈哈哈哈哈哈哈哈哈哈哈哈哈abcd哈哈哈哈哈哈哈哈哈哈哈哈哈')
    results.push(String(result[6]));
    results.push(String(result[30]));
    results.push(String(result[57]));
    results.push(String(result[98]));
    results.push(String(result[119]));
    return results.join('\x00');
}

export function testEncode016() {
    let results = [];
    let that = new util.TextEncoder()
    let result1 = that.encode(undefined)
    results.push(String(result1));
    let result2 = that.encode(null)
    results.push(String(result2));
    return results.join('\x00');
}

export function testEncodeInto001() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let dest = new Uint8Array(buffer, 0, 13)
    let result = that.encodeInto('\uD800A\uDF06A楼HiA', dest)
    results.push(String(result.read));
    results.push(String(result.written));
    return results.join('\x00');
}

export function testEncodeInto002() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(6)
    let dest = new Uint8Array(buffer)
    let result = that.encodeInto('abc\u2603d', dest)
    results.push(String(result.read));
    results.push(String(result.written));
    return results.join('\x00');
}

export function testEncodeInto003() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(4)
    let dest = new Uint8Array(buffer)
    let result = that.encodeInto('abcd', dest)
    results.push(String(result.read));
    results.push(String(result.written));
    return results.join('\x00');
}

export function testEncodeInto004() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(4)
    let dest = new Uint8Array(buffer)
    let result = that.encodeInto('12345', dest)
    results.push(String(result.read));
    results.push(String(result.written));
    return results.join('\x00');
}

export function testEncodeInto005() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(4)
    let dest = new Uint8Array(buffer)
    let result = that.encodeInto('123 4*!@#', dest)
    results.push(String(result.read));
    results.push(String(result.written));
    return results.join('\x00');
}

export function testEncodeInto006() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(4)
    let dest = new Uint8Array(buffer)
    let result = that.encodeInto('', dest)
    results.push(String(result.read));
    results.push(String(result.written));
    return results.join('\x00');
}

export function testEncodeInto007() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let dest = new Uint8Array(buffer)
    let result = that.encodeInto('12ab', dest)
    results.push(String(result.read));
    results.push(String(result.written));
    return results.join('\x00');
}

export function testEncodeInto008() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let dest = new Uint8Array(buffer, 0, 0)
    let result = that.encodeInto('\uD800A\uDF06A楼HiA', dest)
    results.push(String(result.read));
    results.push(String(result.written));
    return results.join('\x00');
}

export function testEncodeInto009() {
    let results = [];
    let that = new util.TextEncoder()
    let result1 = that.encodeInto(undefined)
    results.push(String(result1));
    let result2 = that.encodeInto(null)
    results.push(String(result2));
    return results.join('\x00');
}

export function testTextDecoderCreate_Options_001() {
    let results = [];
    let textDecoderOptions = util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM: true
    }
    let that = util.TextDecoder.create('utf-8', textDecoderOptions)
    let retStr = that.encoding
    results.push(String(retStr));
    return results.join('\x00');
}

export function testTextDecoderCreate_Options_002() {
    let results = [];
    let textDecoderOptions = util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM: false
    }
    let that = util.TextDecoder.create('utf-16be', textDecoderOptions)
    let encodingStr = that.encoding
    results.push(String(encodingStr));
    return results.join('\x00');
}

export function testTextDecoderCreate_Options_003() {
    let results = [];
    let textDecoderOptions = util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM: false
    }
    let that = util.TextDecoder.create(undefined, textDecoderOptions)
    let encodingStr = that.encoding
    results.push(String(encodingStr));
    return results.join('\x00');
}

export function testTextDecoderCreate_Options_004() {
    let results = [];
    let textDecoderOptions = util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM: true
    }
    let that = util.TextDecoder.create(undefined, textDecoderOptions);
    let encodingStr = that.encoding;
    results.push(String(encodingStr));
    return results.join('\x00');
}

export function decodeWithStream_Options_001() {
    let results = [];
    let textDecoderOptions = util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM: false
    }
    let decodeWithStreamOptions = util.DecodeWithStreamOptions = {
        stream: false
    }
    let that = util.TextDecoder.create('utf-16le', textDecoderOptions);
    let arr = new Uint8Array(8)
    arr[0] = 0xFF;
    arr[1] = 0xFE;
    arr[2] = 0x61;
    arr[3] = 0x00;
    arr[4] = 0x62;
    arr[5] = 0x00;
    arr[6] = 0x63;
    arr[7] = 0x00;
    let retStr = that.decodeWithStream(arr, decodeWithStreamOptions);
    let BOM = '\uFEFF';
    let rel = 'abc';
    let re = BOM + rel;
    results.push(String(retStr));
    results.push(String(re));
    return results.join('\x00');
}

export function decodeWithStream_Options_002() {
    let results = [];
    let textDecoderOptions = util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM: true
    }
    let decodeWithStreamOptions = util.DecodeWithStreamOptions = {
        stream: true
    }
    let that = util.TextDecoder.create('utf-8', textDecoderOptions);
    let arr = new Uint8Array(6)
    arr[0] = 0xEF;
    arr[1] = 0xBB;
    arr[2] = 0xBF;
    arr[3] = 0x61;
    arr[4] = 0x62;
    arr[5] = 0x63;
    let retStr = that.decodeWithStream(arr, decodeWithStreamOptions)
    let BOM = '\uFEFF'
    let rel = 'abc'
    let re = BOM + rel;
    results.push(String(retStr));
    results.push(String(re));
    return results.join('\x00');
}

export function testencodeIntoUint8Array_Info_001() {
    let results = [];
    let encodeIntoUint8ArrayInfo = util.EncodeIntoUint8ArrayInfo
    encodeIntoUint8ArrayInfo = {
        read: 0,
        written: 0
    }
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(6)
    let dest = new Uint8Array(buffer)
    encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('abc\u2603d', dest)
    results.push(String(encodeIntoUint8ArrayInfo.read));
    results.push(String(encodeIntoUint8ArrayInfo.written));
    return results.join('\x00');
}

export function testencodeIntoUint8Array_Info_002() {
    let results = [];
    let encodeIntoUint8ArrayInfo = util.EncodeIntoUint8ArrayInfo = {
        read: 0,
        written: 0
    }
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(4)
    let dest = new Uint8Array(buffer)
    encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('', dest)
    results.push(String(encodeIntoUint8ArrayInfo.read));
    results.push(String(encodeIntoUint8ArrayInfo.written));
    return results.join('\x00');
}

export function testencodeIntoUint8Array_Info_003() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(4)
    let dest = new Uint8Array(buffer)
    let encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('abcd', dest)
    results.push(String(encodeIntoUint8ArrayInfo.read));
    results.push(String(encodeIntoUint8ArrayInfo.written));
    results.push(String(dest[1]));
    return results.join('\x00');
}

export function testencodeIntoUint8Array_Info_004() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(3)
    let dest = new Uint8Array(buffer)
    let encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('*', dest)
    results.push(String(encodeIntoUint8ArrayInfo.read));
    results.push(String(encodeIntoUint8ArrayInfo.written));
    results.push(String(dest[0]));
    return results.join('\x00');
}

export function testencodeIntoUint8Array_Info_005() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(10)
    let dest = new Uint8Array(buffer)
    let encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('@1h-+=&^', dest)
    results.push(String(encodeIntoUint8ArrayInfo.read));
    results.push(String(encodeIntoUint8ArrayInfo.written));
    results.push(String(dest[1]));
    results.push(String(dest[6]));
    return results.join('\x00');
}

export function testencodeIntoUint8Array_Info_006() {
    let results = [];
    let that = new util.TextEncoder('utf-16le')
    let buffer = new ArrayBuffer(10)
    let dest = new Uint8Array(buffer)
    that.encodeIntoUint8Array('abcdefg', dest)
    results.push(String(dest[0]));
    results.push(String(dest[2]));
    return results.join('\x00');
}

export function testencodeIntoUint8Array_Info_007() {
    let results = [];
    let that = new util.TextEncoder('utf-16be')
    let buffer = new ArrayBuffer(10)
    let dest = new Uint8Array(buffer)
    that.encodeIntoUint8Array('abcdefg', dest)
    results.push(String(dest[1]));
    results.push(String(dest[3]));
    return results.join('\x00');
}

export function testencodeIntoUint8Array_Info_008() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(4)
    let dest = new Uint8Array(buffer)
    let encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('😃', dest)
    results.push(String(encodeIntoUint8ArrayInfo.read));
    results.push(String(encodeIntoUint8ArrayInfo.written));
    results.push(String(dest[0]));
    results.push(String(dest[3]));
    return results.join('\x00');
}

export function testencodeIntoUint8Array_Info_009() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(10)
    let dest = new Uint8Array(buffer)
    let encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('aé中😃', dest)
    results.push(String(encodeIntoUint8ArrayInfo.read));
    results.push(String(encodeIntoUint8ArrayInfo.written));
    results.push(String(dest[0]));
    results.push(String(dest[3]));
    return results.join('\x00');
}

export function testencodeIntoUint8Array_Info_0010() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(7)
    let dest = new Uint8Array(buffer)
    let encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('😃🤞', dest)
    results.push(String(encodeIntoUint8ArrayInfo.read));
    results.push(String(encodeIntoUint8ArrayInfo.written));
    results.push(String(dest[1]));
    results.push(String(dest[3]));
    return results.join('\x00');
}

export function testencodeIntoUint8Array_Info_0011() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(10)
    let dest = new Uint8Array(buffer)
    let encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('😃🤞', dest)
    results.push(String(encodeIntoUint8ArrayInfo.read));
    results.push(String(encodeIntoUint8ArrayInfo.written));
    results.push(String(dest[1]));
    results.push(String(dest[3]));
    return results.join('\x00');
}

export function testencodeIntoUint8Array_Info_0012() {
    let results = [];
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(15)
    let dest = new Uint8Array(buffer)
    let encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('a😃🤞b', dest)
    results.push(String(encodeIntoUint8ArrayInfo.read));
    results.push(String(encodeIntoUint8ArrayInfo.written));
    results.push(String(dest[0]));
    results.push(String(dest[3]));
    return results.join('\x00');
}

export function test_getLower_001() {
    let results = [];
    let result = range.getLower()
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_getLower_002() {
    let results = [];
    let result = rangeFir.getLower()
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_getLower_003() {
    let results = [];
    let result = rangeSec.getLower()
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_getLower_004() {
    let results = [];
    let result = rangeThi.getLower()
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_getLower_005() {
    let results = [];
    let result = rangeFif.getLower()
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_getUpper_001() {
    let results = [];
    let result = range.getUpper()
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_getUpper_002() {
    let results = [];
    let result = rangeFir.getUpper()
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_getUpper_003() {
    let results = [];
    let result = rangeSec.getUpper()
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_getUpper_004() {
    let results = [];
    let result = rangeThi.getUpper()
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_getUpper_005() {
    let results = [];
    let result = rangeFif.getUpper()
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_clamp_001() {
    let results = [];
    let result = range.clamp(tempLess)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_clamp_002() {
    let results = [];
    let result = range.clamp(tempMiDF)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_clamp_003() {
    let results = [];
    let result = range.clamp(tempMore)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_clamp_004() {
    let results = [];
    let result = range.clamp(tempLower)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_clamp_005() {
    let results = [];
    let result = range.clamp(tempUpper)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_contains_001() {
    let results = [];
    let result = range.contains(tempLess)
    results.push(String(result));
    return results.join('\x00');
}

export function test_contains_002() {
    let results = [];
    let result = range.contains(tempMiDF)
    results.push(String(result));
    return results.join('\x00');
}

export function test_contains_003() {
    let results = [];
    let result = range.contains(tempMore)
    results.push(String(result));
    return results.join('\x00');
}

export function test_contains_004() {
    let results = [];
    let result = range.contains(tempLower)
    results.push(String(result));
    return results.join('\x00');
}

export function test_contains_005() {
    let results = [];
    let result = range.contains(tempUpper)
    results.push(String(result));
    return results.join('\x00');
}

export function test_contains_006() {
    let results = [];
    let result = range.contains(rangeFir)
    results.push(String(result));
    return results.join('\x00');
}

export function test_contains_007() {
    let results = [];
    let result = range.contains(rangeSec)
    results.push(String(result));
    return results.join('\x00');
}

export function test_contains_008() {
    let results = [];
    let result = range.contains(rangeThi)
    results.push(String(result));
    return results.join('\x00');
}

export function test_contains_009() {
    let results = [];
    let result = range.contains(rangeFif)
    results.push(String(result));
    return results.join('\x00');
}

export function test_contains_010() {
    let results = [];
    let result = range.contains(range)
    results.push(String(result));
    return results.join('\x00');
}

export function test_expand_001() {
    let results = [];
    let result = range.expand(tempMiDF, tempMidS)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_expand_002() {
    let results = [];
    let result = range.expand(tempLess, tempMore)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_expand_003() {
    let results = [];
    let result = range.expand(tempLess, tempMiDF)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_expand_004() {
    let results = [];
    let result = range.expand(tempMiDF, tempMore)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_expand_005() {
    let results = [];
    let result = range.expand(tempLower, tempUpper)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_expand_006() {
    let results = [];
    let result = range.expand(rangeFir)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_expand_007() {
    let results = [];
    let result = range.expand(rangeSec)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_expand_008() {
    let results = [];
    let result = range.expand(rangeThi)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_expand_009() {
    let results = [];
    let result = range.expand(rangeFif)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_expand_010() {
    let results = [];
    let result = range.expand(range)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_expand_011() {
    let results = [];
    let result = range.expand(tempMiDF)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_expand_012() {
    let results = [];
    let result = range.expand(tempLess)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_expand_013() {
    let results = [];
    let result = range.expand(tempMore)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_expand_014() {
    let results = [];
    let result = range.expand(tempLower)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_expand_015() {
    let results = [];
    let result = range.expand(tempUpper)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_intersect_001() {
    let results = [];
    let result = range.intersect(rangeFir)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_intersect_002() {
    let results = [];
    let result = range.intersect(rangeSec)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_intersect_003() {
    let results = [];
    let result = range.intersect(rangeThi)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_intersect_004() {
    let results = [];
    let result = range.intersect(rangeFif)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_intersect_005() {
    let results = [];
    let result = range.intersect(range)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_intersect_006() {
    let results = [];
    let result = range.intersect(tempMiDF, tempMidS)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_intersect_007() {
    let results = [];
    let result = range.intersect(tempLess, tempMore)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_intersect_008() {
    let results = [];
    let result = range.intersect(tempLess, tempMiDF)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_intersect_009() {
    let results = [];
    let result = range.intersect(tempMiDF, tempMore)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_intersect_010() {
    let results = [];
    let result = range.intersect(tempLower, tempUpper)
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_toString_001() {
    let results = [];
    let result = range.toString()
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_toString_002() {
    let results = [];
    let result = rangeFir.toString()
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_toString_003() {
    let results = [];
    let result = rangeSec.toString()
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_toString_004() {
    let results = [];
    let result = rangeThi.toString()
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_toString_005() {
    let results = [];
    let result = rangeFif.toString()
    results.push(String(result.toString()));
    return results.join('\x00');
}

export function test_encodeSync_base64_001() {
    let results = [];
    let that = new util.Base64()
    let array = new Uint8Array([115, 49, 51]);
    let rarray = new Uint8Array([99, 122, 69, 122]);
    let result = that.encodeSync(array);
    for (let i = 0; i < 4; i++) {
        results.push(String(result[i]));
        results.push(String(rarray[i]));
    }
    return results.join('\x00');
}

export function test_encodeSync_base64_002() {
    let results = [];
    let that = new util.Base64()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
    let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
    let result = that.encodeSync(array);
    for (let i = 0; i < 20; i++) {
        results.push(String(result[i]));
        results.push(String(rarray[i]));
    }
    return results.join('\x00');
}

export function test_encodeSync_base64_003() {
    let results = [];
    let that = new util.Base64()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32, 105,
        110, 32, 78, 111, 100, 101, 46, 106, 115]);
    let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 86, 117, 89, 50, 57, 107, 97, 87, 53, 110,
        73, 71, 108, 117, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
    let result = that.encodeSync(array);
    for (let i = 0; i < 36; i++) {
        results.push(String(result[i]));
        results.push(String(rarray[i]));
    }
    return results.join('\x00');
}

export function test_encodeSync_base64_004() {
    let results = [];
    let that = new util.Base64()
    let array = new Uint8Array([168, 174, 155, 255]);
    let rarray = new Uint8Array([113, 75, 54, 98, 47, 119, 61, 61]);
    let result = that.encodeSync(array);
    for (let i = 0; i < 8; i++) {
        results.push(String(result[i]));
        results.push(String(rarray[i]));
    }
    return results.join('\x00');
}

export function test_encodeSync_base64_005() {
    let results = [];
    let that = new util.Base64()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
    let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
    let result = that.encodeSync(array);
    for (let i = 0; i < 8; i++) {
        results.push(String(result[i]));
        results.push(String(rarray[i]));
    }
    return results.join('\x00');
}

export function test_encodeToStringSync_base64_001() {
    let results = [];
    let that = new util.Base64()
    let array = new Uint8Array([115, 49, 51]);
    let result = that.encodeToStringSync(array)
    results.push(String(result));
    return results.join('\x00');
}

export function test_encodeToStringSync_base64_002() {
    let results = [];
    let that = new util.Base64()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
    let result = that.encodeToStringSync(array);
    results.push(String(result));
    return results.join('\x00');
}

export function test_encodeToStringSync_base64_003() {
    let results = [];
    let that = new util.Base64()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32, 105, 110,
        32, 78, 111, 100, 101, 46, 106, 115]);
    let result = that.encodeToStringSync(array);
    results.push(String(result));
    return results.join('\x00');
}

export function test_encodeToStringSync_base64_004() {
    let results = [];
    let that = new util.Base64()
    let array = new Uint8Array([168, 174, 155, 255]);
    let result = that.encodeToStringSync(array);
    results.push(String(result));
    return results.join('\x00');
}

export function test_encodeToStringSync_base64_005() {
    let results = [];
    let that = new util.Base64()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
    let result = that.encodeToStringSync(array);
    results.push(String(result));
    return results.join('\x00');
}

export function test_decodeSync_base64_001() {
    let results = [];
    let that = new util.Base64()
    let buff = 'czEz';
    let rarray = new Uint8Array([115, 49, 51]);
    let result = that.decodeSync(buff);
    for (let i = 0; i < 3; i++) {
        results.push(String(result[i]));
        results.push(String(rarray[i]));
    }
    return results.join('\x00');
}

export function test_decodeSync_base64_002() {
    let results = [];
    let that = new util.Base64()
    let buff = 'QmFzZTY0IE5vZGUuanM=';
    let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
    let result = that.decodeSync(buff);
    for (let i = 0; i < 14; i++) {
        results.push(String(result[i]));
        results.push(String(rarray[i]));
    }
    return results.join('\x00');
}

export function test_decodeSync_base64_003() {
    let results = [];
    let that = new util.Base64()
    let buff = 'QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=';
    let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32,
        105, 110, 32, 78, 111, 100, 101, 46, 106, 115]);
    let result = that.decodeSync(buff);
    for (let i = 0; i < 26; i++) {
        results.push(String(result[i]));
        results.push(String(rarray[i]));
    }
    return results.join('\x00');
}

export function test_decodeSync_base64_004() {
    let results = [];
    let that = new util.Base64()
    let buff = 'qK6b/w==';
    let rarray = new Uint8Array([168, 174, 155, 255]);
    let result = that.decodeSync(buff);
    for (let i = 0; i < 4; i++) {
        results.push(String(result[i]));
        results.push(String(rarray[i]));
    }
    return results.join('\x00');
}

export function test_decodeSync_base64_005() {
    let results = [];
    let that = new util.Base64()
    let buff = 'QmFzZTY0';
    let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
    let result = that.decodeSync(buff);
    for (let i = 0; i < 6; i++) {
        results.push(String(result[i]));
        results.push(String(rarray[i]));
    }
    return results.join('\x00');
}

export function test_decodeSync_base64_006() {
    let results = [];
    let that = new util.Base64()
    let array = new Uint8Array([99, 122, 69, 122]);
    let rarray = new Uint8Array([115, 49, 51]);
    let result = that.decodeSync(array);
    for (let i = 0; i < 3; i++) {
        results.push(String(result[i]));
        results.push(String(rarray[i]));
    }
    return results.join('\x00');
}

export function test_decodeSync_base64_007() {
    let results = [];
    let that = new util.Base64()
    let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
    let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
    let result = that.decodeSync(array);
    for (let i = 0; i < 14; i++) {
        results.push(String(result[i]));
        results.push(String(rarray[i]));
    }
    return results.join('\x00');
}

export function test_decodeSync_base64_008() {
    let results = [];
    let that = new util.Base64()
    let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 86, 117, 89, 50, 57, 107, 97, 87,
        53, 110, 73, 71, 108, 117, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
    let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32, 105,
        110, 32, 78, 111, 100, 101, 46, 106, 115]);
    let result = that.decodeSync(array);
    for (let i = 0; i < 26; i++) {
        results.push(String(result[i]));
        results.push(String(rarray[i]));
    }
    return results.join('\x00');
}

export function test_decodeSync_base64_009() {
    let results = [];
    let that = new util.Base64()
    let array = new Uint8Array([113, 75, 54, 98, 47, 119, 61, 61]);
    let rarray = new Uint8Array([168, 174, 155, 255]);
    let result = that.decodeSync(array);
    for (let i = 0; i < 4; i++) {
        results.push(String(result[i]));
        results.push(String(rarray[i]));
    }
    return results.join('\x00');
}

export function test_decodeSync_base64_010() {
    let results = [];
    let that = new util.Base64()
    let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
    let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
    let result = that.decodeSync(array);
    for (let i = 0; i < 6; i++) {
        results.push(String(result[i]));
        results.push(String(rarray[i]));
    }
    return results.join('\x00');
}

export function test_createRationalFromString_001() {
    let results = [];
    let res = util.RationalNumber.createRationalFromString('-1:2')
    let result1 = res.valueOf()
    results.push(String(result1));
    return results.join('\x00');
}

export function test_createRationalFromString_002() {
    let results = [];
    let res = util.RationalNumber.createRationalFromString('+3/4')
    let result1 = res.valueOf()
    results.push(String(result1));
    return results.join('\x00');
}

export function test_createRationalFromString_003() {
    let results = [];
    let res = util.RationalNumber.createRationalFromString('+3:-4')
    let result1 = res.valueOf()
    results.push(String(result1));
    return results.join('\x00');
}

export function test_createRationalFromString_004() {
    let results = [];
    let res = util.RationalNumber.createRationalFromString('+2:4')
    let result1 = res.valueOf()
    results.push(String(result1));
    return results.join('\x00');
}

export function test_createRationalFromString_005() {
    let results = [];
    let res = util.RationalNumber.createRationalFromString('-2:-4')
    let result1 = res.valueOf()
    results.push(String(result1));
    return results.join('\x00');
}

export function test_createRationalFromString_006() {
    let results = [];
    try {
        let rational = util.RationalNumber.createRationalFromString('123');
    } catch (e) {
        results.push(String(e.code));
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function test_createRationalFromString_007() {
    let results = [];
    try {
        let rational = util.RationalNumber.createRationalFromString('abc');
    } catch (e) {
        results.push(String(e.code));
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function test_createRationalFromString_008() {
    let results = [];
    try {
        let rational = util.RationalNumber.createRationalFromString('123abc');
    } catch (e) {
        results.push(String(e.code));
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function test_createRationalFromString_009() {
    let results = [];
    try {
        let rational = util.RationalNumber.createRationalFromString('abc:');
    } catch (e) {
        results.push(String(e.code));
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function test_createRationalFromString_010() {
    let results = [];
    try {
        let rational = util.RationalNumber.createRationalFromString(':abc');
    } catch (e) {
        results.push(String(e.code));
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function test_createRationalFromString_011() {
    let results = [];
    try {
        let rational = util.RationalNumber.createRationalFromString('abc/');
    } catch (e) {
        results.push(String(e.code));
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function test_createRationalFromString_012() {
    let results = [];
    try {
        let rational = util.RationalNumber.createRationalFromString('123:abc');
    } catch (e) {
        results.push(String(e.code));
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function test_createRationalFromString_013() {
    let results = [];
    try {
        let rational = util.RationalNumber.createRationalFromString('abc/123');
    } catch (e) {
        results.push(String(e.code));
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function test_createRationalFromString_014() {
    let results = [];
    try {
        let rational = util.RationalNumber.createRationalFromString('abc/abcd');
    } catch (e) {
        results.push(String(e.code));
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function test_createRationalFromString_015() {
    let results = [];
    try {
        let rational = util.RationalNumber.createRationalFromString('');
    } catch (e) {
        results.push(String(e.code));
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function test_compareTo_001() {
    let results = [];
    let pro = new util.RationalNumber(2, 1)
    let proc = new util.RationalNumber(3, 4)
    let res = pro.compareTo(proc)
    results.push(String(res));
    return results.join('\x00');
}

export function test_compareTo_002() {
    let results = [];
    let pro = new util.RationalNumber(2, 1)
    let proc = new util.RationalNumber(0, 0)
    let res = pro.compareTo(proc)
    results.push(String(res));
    return results.join('\x00');
}

export function test_compareTo_003() {
    let results = [];
    let pro = new util.RationalNumber(2, 1)
    let proc = new util.RationalNumber(8, 3)
    let res = pro.compareTo(proc)
    results.push(String(res));
    return results.join('\x00');
}

export function test_compareTo_004() {
    let results = [];
    let pro = new util.RationalNumber(2, 1)
    let proc = new util.RationalNumber(2, 1)
    let res = pro.compareTo(proc)
    results.push(String(res));
    return results.join('\x00');
}

export function test_compareTo_005() {
    let results = [];
    let pro = new util.RationalNumber(0, 0)
    let proc = new util.RationalNumber(2, 1)
    let res = pro.compareTo(proc)
    results.push(String(res));
    return results.join('\x00');
}

export function test_equals_001() {
    let results = [];
    let pro = new util.RationalNumber(2, 1)
    let proc = new util.RationalNumber(3, 4)
    let res = pro.equals(proc)
    results.push(String(res));
    return results.join('\x00');
}

export function test_equals_002() {
    let results = [];
    let pro = new util.RationalNumber(2, 1)
    let proc = new util.RationalNumber(4, 2)
    let res = pro.equals(proc)
    results.push(String(res));
    return results.join('\x00');
}

export function test_equals_003() {
    let results = [];
    let pro = new util.RationalNumber(0, 1)
    let proc = new util.RationalNumber(0, 2)
    let res = pro.equals(proc)
    results.push(String(res));
    return results.join('\x00');
}

export function test_equals_004() {
    let results = [];
    let pro = new util.RationalNumber(0, 0)
    let proc = new util.RationalNumber(0, 2)
    let res = pro.equals(proc)
    results.push(String(res));
    return results.join('\x00');
}

export function test_equals_005() {
    let results = [];
    let pro = new util.RationalNumber(-2, 0)
    let proc = new util.RationalNumber(2, 0)
    let res = pro.equals(proc)
    results.push(String(res));
    return results.join('\x00');
}

export function testRationalNumberValueOf001() {
    let results = [];
    let pro = new util.RationalNumber(2, 1)
    let res = pro.valueOf()
    results.push(String(res));
    return results.join('\x00');
}

export function testRationalNumberValueOf002() {
    let results = [];
    let pro = new util.RationalNumber(2, 10)
    let res = pro.valueOf()
    results.push(String(res));
    return results.join('\x00');
}

export function testRationalNumberValueOf003() {
    let results = [];
    let pro = new util.RationalNumber(1, 2)
    let res = pro.valueOf()
    results.push(String(res));
    return results.join('\x00');
}

export function testRationalNumberValueOf004() {
    let results = [];
    let pro = new util.RationalNumber(4, 2)
    let res = pro.valueOf()
    results.push(String(res));
    return results.join('\x00');
}

export function testRationalNumberValueOf005() {
    let results = [];
    let pro = new util.RationalNumber(4, 1)
    let res = pro.valueOf()
    results.push(String(res));
    return results.join('\x00');
}

export function testGetCommonDivisor001() {
    let results = [];
    let pro = new util.RationalNumber(0, 0)
    let res = pro.getCommonDivisor(4, 8)
    results.push(String(res));
    return results.join('\x00');
}

export function testGetCommonDivisor002() {
    let results = [];
    let pro = new util.RationalNumber(0, 0)
    let res = pro.getCommonDivisor(10, 15)
    results.push(String(res));
    return results.join('\x00');
}

export function testGetCommonDivisor003() {
    let results = [];
    let pro = new util.RationalNumber(0, 0)
    let res = pro.getCommonDivisor(8, 4)
    results.push(String(res));
    return results.join('\x00');
}

export function testGetCommonDivisor004() {
    let results = [];
    let pro = new util.RationalNumber(0, 0)
    let res = pro.getCommonDivisor(8, 16)
    results.push(String(res));
    return results.join('\x00');
}

export function testGetCommonDivisor005() {
    let results = [];
    let pro = new util.RationalNumber(0, 0)
    let res = pro.getCommonDivisor(2, 16)
    results.push(String(res));
    return results.join('\x00');
}

export function testGetCommonFactor001() {
    let results = [];
    let result = util.RationalNumber.getCommonFactor(4, 6);
    results.push(String(result));
    return results.join('\x00');
}

export function testGetCommonFactor002() {
    let results = [];
    let result = util.RationalNumber.getCommonFactor(1, 6);
    results.push(String(result));
    return results.join('\x00');
}

export function testGetCommonFactor003() {
    let results = [];
    try {
        let result = util.RationalNumber.getCommonFactor(0, 6);
    } catch (e) {
        results.push(String(e.code));
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function testGetCommonFactor004() {
    let results = [];
    try {
        let result = util.RationalNumber.getCommonFactor(0, 0);
    } catch (e) {
        results.push(String(e.code));
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function testGetCommonFactor005() {
    let results = [];
    try {
        let result = util.RationalNumber.getCommonFactor(null, null);
    } catch (e) {
        results.push(String(e.code));
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function testGetCommonFactor006() {
    let results = [];
    try {
        let result = util.RationalNumber.getCommonFactor('123', 456);
    } catch (e) {
        results.push(String(e.code));
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function testGetDenominator001() {
    let results = [];
    let pro = new util.RationalNumber(2, 1)
    let res = pro.getDenominator()
    results.push(String(res));
    return results.join('\x00');
}

export function testGetDenominator002() {
    let results = [];
    let pro = new util.RationalNumber(2, 3)
    let res = pro.getDenominator()
    results.push(String(res));
    return results.join('\x00');
}

export function testGetDenominator003() {
    let results = [];
    let pro = new util.RationalNumber(2, 0)
    let res = pro.getDenominator()
    results.push(String(res));
    return results.join('\x00');
}

export function testGetDenominator004() {
    let results = [];
    let pro = new util.RationalNumber(10, 5)
    let res = pro.getDenominator()
    results.push(String(res));
    return results.join('\x00');
}

export function testGetDenominator005() {
    let results = [];
    let pro = new util.RationalNumber(6, 3)
    let res = pro.getDenominator()
    results.push(String(res));
    return results.join('\x00');
}

export function testGetDenominator006() {
    let results = [];
    let pro = new util.RationalNumber(6, -3)
    let res = pro.getDenominator()
    results.push(String(res));
    return results.join('\x00');
}

export function testGetNumerator001() {
    let results = [];
    let pro = new util.RationalNumber(-2, 1)
    let res = pro.getNumerator()
    results.push(String(res));
    return results.join('\x00');
}

export function testGetNumerator002() {
    let results = [];
    let pro = new util.RationalNumber(0, 3)
    let res = pro.getNumerator()
    results.push(String(res));
    return results.join('\x00');
}

export function testGetNumerator003() {
    let results = [];
    let pro = new util.RationalNumber(2, 4)
    let res = pro.getNumerator()
    results.push(String(res));
    return results.join('\x00');
}

export function testGetNumerator004() {
    let results = [];
    let pro = new util.RationalNumber(3, 6)
    let res = pro.getNumerator()
    results.push(String(res));
    return results.join('\x00');
}

export function testGetNumerator005() {
    let results = [];
    let pro = new util.RationalNumber(10, 5)
    let res = pro.getNumerator()
    results.push(String(res));
    return results.join('\x00');
}

export function testisFinite001() {
    let results = [];
    let pro = new util.RationalNumber(-2, 1)
    let res = pro.isFinite()
    results.push(String(res));
    return results.join('\x00');
}

export function testisFinite002() {
    let results = [];
    let pro = new util.RationalNumber(0, 3)
    let res = pro.isFinite()
    results.push(String(res));
    return results.join('\x00');
}

export function testisFinite003() {
    let results = [];
    let pro = new util.RationalNumber(2, 0)
    let res = pro.isFinite()
    results.push(String(res));
    return results.join('\x00');
}

export function testisFinite004() {
    let results = [];
    let pro = new util.RationalNumber(1, 3)
    let res = pro.isFinite()
    results.push(String(res));
    return results.join('\x00');
}

export function testisFinite005() {
    let results = [];
    let pro = new util.RationalNumber(10, 5)
    let res = pro.isFinite()
    results.push(String(res));
    return results.join('\x00');
}

export function testisNaN001() {
    let results = [];
    let pro = new util.RationalNumber(-2, 1)
    let res = pro.isNaN()
    results.push(String(res));
    return results.join('\x00');
}

export function testisNaN002() {
    let results = [];
    let pro = new util.RationalNumber(0, 3)
    let res = pro.isNaN()
    results.push(String(res));
    return results.join('\x00');
}

export function testisNaN003() {
    let results = [];
    let pro = new util.RationalNumber(0, 0)
    let res = pro.isNaN()
    results.push(String(res));
    return results.join('\x00');
}

export function testisNaN004() {
    let results = [];
    let pro = new util.RationalNumber(10, 0)
    let res = pro.isNaN()
    results.push(String(res));
    return results.join('\x00');
}

export function testisNaN005() {
    let results = [];
    let pro = new util.RationalNumber(10, 1)
    let res = pro.isNaN()
    results.push(String(res));
    return results.join('\x00');
}

export function testisZero001() {
    let results = [];
    let pro = new util.RationalNumber(-2, 1)
    let res = pro.isZero()
    results.push(String(res));
    return results.join('\x00');
}

export function testisZero002() {
    let results = [];
    let pro = new util.RationalNumber(0, 3)
    let res = pro.isZero()
    results.push(String(res));
    return results.join('\x00');
}

export function testisZero003() {
    let results = [];
    let pro = new util.RationalNumber(0, 0)
    let res = pro.isZero()
    results.push(String(res));
    return results.join('\x00');
}

export function testisZero004() {
    let results = [];
    let pro = new util.RationalNumber(10, 2)
    let res = pro.isZero()
    results.push(String(res));
    return results.join('\x00');
}

export function testisZero005() {
    let results = [];
    let pro = new util.RationalNumber(1, 1)
    let res = pro.isZero()
    results.push(String(res));
    return results.join('\x00');
}

export function testRationalNumberToString001() {
    let results = [];
    let pro = new util.RationalNumber(-2, 1)
    let res = pro.toString()
    results.push(String(res));
    return results.join('\x00');
}

export function testRationalNumberToString002() {
    let results = [];
    let pro = new util.RationalNumber(0, 0)
    let res = pro.toString()
    results.push(String(res));
    return results.join('\x00');
}

export function testRationalNumberToString003() {
    let results = [];
    let pro = new util.RationalNumber(3, 0)
    let res = pro.toString()
    results.push(String(res));
    return results.join('\x00');
}

export function testRationalNumberToString004() {
    let results = [];
    let pro = new util.RationalNumber(-3, 0)
    let res = pro.toString()
    results.push(String(res));
    return results.join('\x00');
}

export function testRationalNumberToString005() {
    let results = [];
    let pro = new util.RationalNumber(2, 3)
    let res = pro.toString()
    results.push(String(res));
    return results.join('\x00');
}

export function testLruBufferUpdateGetCapacity001() {
    let results = [];
    let that = new util.LruBuffer()
    that.updateCapacity(10)
    let result = that.getCapacity()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferUpdateGetCapacity002() {
    let results = [];
    let that = new util.LruBuffer()
    that.updateCapacity(2147483646)
    let result = that.getCapacity()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferUpdateGetCapacity003() {
    let results = [];
    let that = new util.LruBuffer(100)
    that.updateCapacity(20)
    let result = that.getCapacity()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferUpdateGetCapacity004() {
    let results = [];
    let that = new util.LruBuffer(50)
    that.updateCapacity(2)
    let result = that.getCapacity()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferUpdateGetCapacity005() {
    let results = [];
    let that = new util.LruBuffer(200)
    that.updateCapacity(100)
    let result = that.getCapacity()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGet001() {
    let results = [];
    let that = new util.LruBuffer(100)
    that.put(1, 2)
    let result = that.get(1)
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGet002() {
    let results = [];
    let that = new util.LruBuffer(100)
    that.put(1, 2)
    let result = that.get(5)
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGet003() {
    let results = [];
    let that = new util.LruBuffer(100)
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    let result1 = that.get(20)
    let result2 = that.get('abcd')
    let result3 = that.get(2)
    results.push(String(result1));
    results.push(String(result2));
    results.push(String(result3));
    return results.join('\x00');
}

export function testLruBufferGet004() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('1111', 'bcjdshc')
    that.put(20, 'cdjcaxb')
    that.put('abcd', 15)
    let result1 = that.get('1111')
    let result2 = that.get(20)
    let result3 = that.get('abcd')
    let result4 = that.get(25)
    results.push(String(result1));
    results.push(String(result2));
    results.push(String(result3));
    results.push(String(result4));
    return results.join('\x00');
}

export function testLruBufferGet005() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('1111', 'bcjdshc')
    that.put(20, 'cdjcaxb')
    that.updateCapacity(2)
    that.put('abcd', 15)
    let result1 = that.get('1111')
    let result2 = that.get(20)
    let result3 = that.get('abcd')
    let result4 = that.get(25)
    results.push(String(result1));
    results.push(String(result2));
    results.push(String(result3));
    results.push(String(result4));
    return results.join('\x00');
}

export function testLruBufferPut001() {
    let results = [];
    let that = new util.LruBuffer()
    let temp = that.put('1111', 'bcjdshc')
    results.push(String(temp));
    return results.join('\x00');
}

export function testLruBufferPut002() {
    let results = [];
    let that = new util.LruBuffer()
    let temp1 = that.put('1111', 'bcjdshc')
    let temp2 = that.put('1111', 13)
    results.push(String(temp2));
    return results.join('\x00');
}

export function testLruBufferPut003() {
    let results = [];
    let that = new util.LruBuffer()
    let temp = that.put('1111', 'bcjdshc')
    let temp1 = that.put(1, 12)
    let temp2 = that.put(2, 5)
    let temp3 = that.put(2, 'adasfdad')
    let temp4 = that.put('abc', 10)
    results.push(String(temp1));
    results.push(String(temp2));
    results.push(String(temp3));
    results.push(String(temp4));
    return results.join('\x00');
}

export function testLruBufferPut004() {
    let results = [];
    let that = new util.LruBuffer()
    let temp = that.put('1111', 'bcjdshc')
    let temp1 = that.put(1, 12)
    let temp2 = that.put(2, 5)
    that.updateCapacity(2)
    let temp3 = that.put(2, 'adasfdad')
    let temp4 = that.put('1111', 10)
    results.push(String(temp));
    results.push(String(temp1));
    results.push(String(temp2));
    results.push(String(temp3));
    results.push(String(temp4));
    return results.join('\x00');
}

export function testLruBufferPut005() {
    let results = [];
    let that = new util.LruBuffer()
    let temp = that.put('1111', 'bcjdshc')
    let temp1 = that.put(1, 12)
    let temp2 = that.put(2, 5)
    let temp3 = that.put(1, 10)
    let temp4 = that.put(2, 22)
    let temp5 = that.put(2, 30)
    results.push(String(temp));
    results.push(String(temp1));
    results.push(String(temp2));
    results.push(String(temp3));
    results.push(String(temp4));
    results.push(String(temp5));
    return results.join('\x00');
}

export function testLruBufferGetCreateCount001() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.get(3)
    that.get(5)
    that.get(10)
    let result = that.getCreateCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetCreateCount002() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.get(6)
    that.get(8)
    that.get(20)
    let result = that.getCreateCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetCreateCount003() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.get('abc')
    that.get('cndk')
    let result = that.getCreateCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetCreateCount004() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(5, 2)
    that.put(10, 10)
    that.put('abcd', 'abcd')
    that.get(3)
    that.get(20)
    that.get(12)
    let result = that.getCreateCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetCreateCount005() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('xsjk', 'bcjds')
    that.put('ajc', 10)
    that.put('abcd', 15)
    that.get(2)
    that.get(10)
    that.get(30)
    let result = that.getCreateCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetMissCount001() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.get(3)
    that.get(5)
    that.get(10)
    let result = that.getMissCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetMissCount002() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(5, 2)
    that.put(1, 10)
    that.put('abcd', 'bcjsc')
    that.get(2)
    that.get(10)
    that.get(15)
    let result = that.getMissCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetMissCount003() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(10, 10)
    that.put(3, 20)
    that.put(12, 16)
    that.get(1)
    that.get(2)
    that.get(6)
    let result = that.getMissCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetMissCount004() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('acb', 'asdc')
    that.put('vfb', 1)
    that.put('abcd', 'abcd')
    that.get(3)
    that.get(5)
    that.get(10)
    let result = that.getMissCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetMissCount005() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.get(3)
    that.get(5)
    that.get(10)
    that.contains(2)
    that.contains(6)
    let result = that.getMissCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetMissCount006() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.get(1)
    that.get(2)
    that.get('abcd')
    let result = that.getMissCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetRemovalCount001() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.put(3, 20)
    that.put(5, 30)
    let result = that.getRemovalCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetRemovalCount002() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(10, 2)
    that.put(3, 2)
    that.put(15, 15)
    that.put(1, 20)
    let result = that.getRemovalCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetRemovalCount003() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('abc', 2)
    that.put('abcd', 'abcd')
    that.put(3, 2)
    let result = that.getRemovalCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetRemovalCount004() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.updateCapacity(2)
    that.put(3, 20)
    that.put(5, 30)
    let result = that.getRemovalCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetRemovalCount005() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.updateCapacity(3)
    that.put('string', 20)
    that.put('abc', 30)
    that.put(10, 20)
    let result = that.getRemovalCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetMatchCount001() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.get(1)
    that.get(2)
    that.get('abcd')
    let result = that.getMatchCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetMatchCount002() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(10, 2)
    that.put(2, 1)
    that.put('abcd', 15)
    that.get(10)
    that.get(2)
    that.get('abcd')
    that.get('string')
    let result = that.getMatchCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetMatchCount003() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(0, 1)
    that.put(30, 10)
    that.put('abcd', 15)
    that.get(0)
    that.get(30)
    that.get('abcd')
    let result = that.getMatchCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetMatchCount004() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.get(1)
    that.get(2)
    that.get('abcd')
    that.contains(2)
    that.contains('abcd')
    that.contains(20)
    let result = that.getMatchCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetMatchCount005() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.put('string', 'string')
    that.get(1)
    that.get(2)
    that.get('abcd')
    that.get('string')
    that.contains(2)
    that.contains('abcd')
    that.contains('string')
    that.contains(10)
    let result = that.getMatchCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetMatchCount006() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.get(5)
    let result = that.getMatchCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetPutCount001() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    let result = that.getPutCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetPutCount002() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(5, 3)
    that.put(2, 10)
    let result = that.getPutCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetPutCount003() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('string', 2)
    that.put('abcd', 1)
    that.put('ab', 'a')
    let result = that.getPutCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetPutCount004() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('string', 'string')
    that.put('ac', 'abc')
    that.put('abcd', 15)
    let result = that.getPutCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetPutCount005() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.updateCapacity(2)
    that.put('abcd', 'abc')
    let result = that.getPutCount()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetCapacity001() {
    let results = [];
    let that = new util.LruBuffer()
    let result = that.getCapacity()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetCapacity002() {
    let results = [];
    let that = new util.LruBuffer(2)
    let result = that.getCapacity()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetCapacity003() {
    let results = [];
    let that = new util.LruBuffer(100)
    let result = that.getCapacity()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetCapacity004() {
    let results = [];
    let that = new util.LruBuffer()
    that.updateCapacity(50)
    let result = that.getCapacity()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferGetCapacity005() {
    let results = [];
    let that = new util.LruBuffer(100)
    that.updateCapacity(10)
    let result = that.getCapacity()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferLength001() {
    let results = [];
    let that = new util.LruBuffer()
    let result = that.length
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferLength002() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    let result = that.length
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferLength003() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('abc', 2)
    that.put('string', 'string')
    let result = that.length
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferLength004() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.put('abcd', 20)
    let result = that.length
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferLength005() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.put('abcd', 20)
    that.updateCapacity(3);
    that.put(5, 33);
    that.put(25, 35);
    let result = that.length
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferClear001() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    let result1 = that.length
    that.clear()
    let result2 = that.length
    results.push(String(result1));
    results.push(String(result2));
    return results.join('\x00');
}

export function testLruBufferClear002() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put(5, 33);
    that.put(25, 35);
    let result1 = that.length
    that.clear()
    let result2 = that.length
    results.push(String(result1));
    results.push(String(result2));
    return results.join('\x00');
}

export function testLruBufferClear003() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('abc', 2)
    that.put(2, 'abc')
    that.put('ancd', 'abcd')
    that.put(10, 35)
    let result1 = that.length
    that.clear()
    let result2 = that.length
    results.push(String(result1));
    results.push(String(result2));
    return results.join('\x00');
}

export function testLruBufferClear004() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put(5, 33);
    that.updateCapacity(3);
    let result1 = that.length
    that.clear()
    let result2 = that.length
    results.push(String(result1));
    results.push(String(result2));
    return results.join('\x00');
}

export function testLruBufferClear005() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put(5, 33);
    that.put('abcd', 'string');
    that.updateCapacity(2);
    let result1 = that.length
    that.clear()
    let result2 = that.length
    results.push(String(result1));
    results.push(String(result2));
    return results.join('\x00');
}

export function testLruBufferIsEmpty001() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    let result = that.isEmpty()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferIsEmpty002() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    let result = that.isEmpty()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferIsEmpty003() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put(5, 33)
    let result = that.isEmpty()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferIsEmpty004() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('abc', 2)
    that.put('string', 10)
    that.put('ab', 'abc')
    let result = that.isEmpty()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferIsEmpty005() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(2, 10)
    that.put(5, 33);
    that.clear()
    let result = that.isEmpty()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferContains001() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    let result = that.contains(1)
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferContains002() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(0, 5)
    let result = that.contains(0)
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferContains003() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('abc', 'abc')
    let result = that.contains(1)
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferContains004() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put('abcd', 20)
    let result1 = that.contains(1)
    let result2 = that.contains(20)
    results.push(String(result1));
    results.push(String(result2));
    return results.join('\x00');
}

export function testLruBufferContains005() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put('string', 'string')
    let result1 = that.contains(1)
    let result2 = that.contains('string')
    let result3 = that.contains(0)
    results.push(String(result1));
    results.push(String(result2));
    results.push(String(result3));
    return results.join('\x00');
}

export function testLruBufferRemove001() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    let result = that.remove(1)
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferRemove002() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put('abcd', 20)
    let result1 = that.remove(1)
    let result2 = that.remove('abcd')
    results.push(String(result1));
    results.push(String(result2));
    return results.join('\x00');
}

export function testLruBufferRemove003() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    let result1 = that.remove(1)
    let result2 = that.remove(5)
    results.push(String(result1));
    results.push(String(result2));
    return results.join('\x00');
}

export function testLruBufferRemove004() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(0, 'abc')
    that.put('abcd', 20)
    let result1 = that.remove(1)
    let result2 = that.remove('abcd')
    results.push(String(result1));
    results.push(String(result2));
    return results.join('\x00');
}

export function testLruBufferRemove005() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    let result1 = that.remove(1)
    let result2 = that.remove(3)
    let result3 = that.get(3)
    results.push(String(result1));
    results.push(String(result2));
    results.push(String(result3));
    return results.join('\x00');
}

export function testLruBufferCreateDefault001() {
    let results = [];
    let that = new util.LruBuffer()
    let result = that.createDefault(1)
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferCreateDefault002() {
    let results = [];
    let that = new util.LruBuffer()
    let result = that.createDefault(0)
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferCreateDefault003() {
    let results = [];
    let that = new util.LruBuffer()
    let result = that.createDefault('string')
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferCreateDefault004() {
    let results = [];
    let that = new util.LruBuffer()
    let result = that.createDefault(10)
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferCreateDefault005() {
    let results = [];
    let that = new util.LruBuffer()
    let result1 = that.createDefault('abc')
    let result2 = that.createDefault('ab')
    results.push(String(result1));
    results.push(String(result2));
    return results.join('\x00');
}

export function testLruBufferKeys001() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('string', 'abc')
    let result = that.keys()
    results.push(String(result[0]));
    return results.join('\x00');
}

export function testLruBufferKeys002() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    let result = that.keys()
    results.push(String(result[0]));
    results.push(String(result[1]));
    results.push(String(result[2]));
    results.push(String(result[3]));
    return results.join('\x00');
}

export function testLruBufferKeys003() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    let result = that.keys()
    results.push(String(result[0]));
    results.push(String(result[1]));
    results.push(String(result[2]));
    results.push(String(result[3]));
    return results.join('\x00');
}

export function testLruBufferKeys004() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.contains(1)
    let result = that.keys()
    results.push(String(result[0]));
    results.push(String(result[1]));
    results.push(String(result[2]));
    results.push(String(result[3]));
    return results.join('\x00');
}

export function testLruBufferKeys005() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.remove(5)
    that.contains(3)
    that.get(1)
    that.contains('abc')
    let result = that.keys()
    results.push(String(result[0]));
    results.push(String(result[1]));
    results.push(String(result[2]));
    return results.join('\x00');
}

export function testLruBufferValues001() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('string', 'abc')
    let result = that.values()
    results.push(String(result[0]));
    return results.join('\x00');
}

export function testLruBufferValues002() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    let result = that.values()
    results.push(String(result[0]));
    results.push(String(result[1]));
    results.push(String(result[2]));
    results.push(String(result[3]));
    return results.join('\x00');
}

export function testLruBufferValues003() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    let result = that.values()
    results.push(String(result[0]));
    results.push(String(result[1]));
    results.push(String(result[2]));
    results.push(String(result[3]));
    return results.join('\x00');
}

export function testLruBufferValues004() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.contains(1)
    let result = that.values()
    results.push(String(result[0]));
    results.push(String(result[1]));
    results.push(String(result[2]));
    results.push(String(result[3]));
    return results.join('\x00');
}

export function testLruBufferValues005() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.remove(5)
    that.contains(3)
    that.get(1)
    that.contains('abc')
    let result = that.values()
    results.push(String(result[0]));
    results.push(String(result[1]));
    results.push(String(result[2]));
    return results.join('\x00');
}

export function testLruBufferToString001() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('1111', 'bcjdshc')
    that.put(1, 2)
    let result = that.toString()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferToString002() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('1111', 'bcjdshc')
    that.put(1, 2)
    that.get(1)
    that.get('1111')
    let result = that.toString()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferToString003() {
    let results = [];
    let that = new util.LruBuffer(100)
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    let result = that.toString()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferToString004() {
    let results = [];
    let that = new util.LruBuffer(100)
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.get(2)
    let result = that.toString()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferToString005() {
    let results = [];
    let that = new util.LruBuffer(100)
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.get(2)
    that.get(1)
    that.contains(5)
    let result = that.toString()
    results.push(String(result));
    return results.join('\x00');
}

export function testLruBufferEntries001() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('string', 'abc')
    let i = 0;
    let arr = {};
    for (let entry of that.entries()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    results.push(String(arr[1]));
    return results.join('\x00');
}

export function testLruBufferEntries002() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    let i = 0;
    let arr = {};
    for (let entry of that.entries()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    results.push(String(arr[1]));
    return results.join('\x00');
}

export function testLruBufferEntries003() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    let i = 0;
    let arr = {};
    for (let entry of that.entries()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    results.push(String(arr[0]));
    return results.join('\x00');
}

export function testLruBufferEntries004() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.contains(1)
    let i = 0;
    let arr = {};
    for (let entry of that.entries()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    results.push(String(arr[1]));
    results.push(String(arr[3]));
    return results.join('\x00');
}

export function testLruBufferEntries005() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.remove(5)
    that.contains(3)
    that.get(1)
    that.contains('abc')
    let i = 0;
    let arr = {};
    for (let entry of that.entries()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    results.push(String(arr[1]));
    results.push(String(arr[3]));
    results.push(String(arr[5]));
    return results.join('\x00');
}

export function testLruBufferSymboliterator001() {
    let results = [];
    let that = new util.LruBuffer()
    that.put('string', 'abc')
    that.put('abc', 20)
    let i = 0;
    let arr = [];
    for (let entry of that[Symbol.iterator]()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    results.push(String(arr[1]));
    return results.join('\x00');
}

export function testLruBufferSymboliterator002() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    let i = 0;
    let arr = {};
    for (let entry of that[Symbol.iterator]()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    results.push(String(arr[1]));
    return results.join('\x00');
}

export function testLruBufferSymboliterator003() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    let i = 0;
    let arr = {};
    for (let entry of that[Symbol.iterator]()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    results.push(String(arr[0]));
    return results.join('\x00');
}

export function testLruBufferSymboliterator004() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.contains(1)
    let i = 0;
    let arr = {};
    for (let entry of that[Symbol.iterator]()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    results.push(String(arr[1]));
    results.push(String(arr[3]));
    return results.join('\x00');
}

export function testLruBufferSymboliterator005() {
    let results = [];
    let that = new util.LruBuffer()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.remove(5)
    that.contains(3)
    that.get(1)
    that.contains('abc')
    let i = 0;
    let arr = {};
    for (let entry of that[Symbol.iterator]()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    results.push(String(arr[1]));
    results.push(String(arr[3]));
    results.push(String(arr[5]));
    return results.join('\x00');
}

export function testLruBufferAfterRemoval001() {
    let results = [];
    let arr = [];

    class ChildLruBuffer extends util.LruBuffer {
        constructor() {
            super();
        }

        static getInstance() {
            return new ChildLruBuffer();
        }

        afterRemoval(isEvict, key, value, newValue) {
            if (isEvict === false) {
                arr = [key, value, newValue];
            }
        }
    }

    ChildLruBuffer.getInstance().afterRemoval(false, 10, 30, null)
    results.push(String(arr[0]));
    return results.join('\x00');
}

export function testLruBufferAfterRemoval002() {
    let results = [];
    let arr = [];

    class ChildLruBuffer extends util.LruBuffer {
        constructor() {
            super();
        }

        static getInstance() {
            return new ChildLruBuffer();
        }

        afterRemoval(isEvict, key, value, newValue) {
            if (isEvict === false) {
                arr = [key, value, newValue];
            }
        }
    }

    ChildLruBuffer.getInstance().afterRemoval(false, 'string', 10, null)
    results.push(String(arr[0]));
    return results.join('\x00');
}

export function testLruBufferAfterRemoval003() {
    let results = [];
    let arr = [];

    class ChildLruBuffer extends util.LruBuffer {
        constructor() {
            super();
        }

        static getInstance() {
            return new ChildLruBuffer();
        }

        afterRemoval(isEvict, key, value, newValue) {
            if (isEvict === false) {
                arr = [key, value, newValue];
            }
        }
    }

    ChildLruBuffer.getInstance().afterRemoval(false, 10, 30, 12)
    results.push(String(arr[2]));
    return results.join('\x00');
}

export function testLruBufferAfterRemoval004() {
    let results = [];
    let arr = [];

    class ChildLruBuffer extends util.LruBuffer {
        constructor() {
            super();
        }

        static getInstance() {
            return new ChildLruBuffer();
        }

        afterRemoval(isEvict, key, value, newValue) {
            if (isEvict === false) {
                arr = [key, value, newValue];
            }
        }
    }

    ChildLruBuffer.getInstance().afterRemoval(false, 'abc', 30, 'string')
    results.push(String(arr[1]));
    return results.join('\x00');
}

export function testLruBufferAfterRemoval005() {
    let results = [];
    let arr = [];

    class ChildLruBuffer extends util.LruBuffer {
        constructor() {
            super();
        }

        static getInstance() {
            return new ChildLruBuffer();
        }

        afterRemoval(isEvict, key, value, newValue) {
            if (isEvict === true) {
                arr = [key, value, newValue];
            }
        }
    }

    ChildLruBuffer.getInstance().afterRemoval(true, 'abc', 'ab', 'string')
    results.push(String(arr[2]));
    return results.join('\x00');
}

export function testLruBufferAfterRemoval006() {
    let results = [];
    let arr = [];

    class ChildLruBuffer extends util.LruBuffer {
        constructor(capacity) {
            super(capacity);
        }

        afterRemoval(isEvict, key, value, newValue) {
            if (isEvict === true) {
                arr = [key, value];
            }
        }
    }

    let that = new ChildLruBuffer(2);
    that.put(1, 2)
    that.put(3, 10)
    that.put('abc', 20)
    results.push(String(arr[1]));
    return results.join('\x00');
}

export function testLruBufferAfterRemoval007() {
    let results = [];
    let arr = [];

    class ChildLruBuffer extends util.LruBuffer {
        constructor(capacity) {
            super(capacity);
        }

        afterRemoval(isEvict, key, value, newValue) {
            if (isEvict === false) {
                arr = [key, value, newValue];
            }
        }
    }

    let that = new ChildLruBuffer(3);
    that.put(1, 2)
    that.put(3, 10)
    that.put(1, 8)
    results.push(String(arr[2]));
    return results.join('\x00');
}

export function testLruBufferAfterRemoval008() {
    let results = [];
    let arrk = [];
    let arrv = [];

    class ChildLruBuffer extends util.LruBuffer {
        constructor(capacity) {
            super(capacity);
        }

        afterRemoval(isEvict, key, value, newValue) {
            if (isEvict === false) {
                arrk = Array.from(key);
                arrv = Array.from(value);
            }
        }
    }

    let that = new ChildLruBuffer(3);
    that.put(1, 2)
    that.put(3, 10)
    that.put(2, 8)
    that.clear();
    results.push(String(arrk[0]));
    results.push(String(arrk[1]));
    results.push(String(arrk[2]));
    results.push(String(arrv[0]));
    results.push(String(arrv[1]));
    results.push(String(arrv[2]));
    return results.join('\x00');
}

export function testIsAnyArrayBuffer001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isAnyArrayBuffer(new ArrayBuffer(1));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsAnyArrayBuffer002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isAnyArrayBuffer(true);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsAnyArrayBuffer003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isAnyArrayBuffer(false);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsAnyArrayBuffer004() {
    let results = [];
    let proc = new util.types();
    let buf = new ArrayBuffer(1);
    let result = proc.isAnyArrayBuffer(buf);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsAnyArrayBuffer005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isAnyArrayBuffer(new Boolean(false));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsArrayBufferView001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isArrayBufferView(new Int8Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsArrayBufferView002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isArrayBufferView(new Int32Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsArrayBufferView003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isArrayBufferView(new DataView(new ArrayBuffer(16)));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsArrayBufferView004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isArrayBufferView(false);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsArrayBufferView005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isArrayBufferView(new Int16Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsArgumentsObject001() {
    let results = [];
    let proc = new util.types();

    function foo() {
        let result = proc.isArgumentsObject(arguments);
        results.push(String(result));
    }

    let f = foo();
    return results.join('\x00');
}

export function testIsArgumentsObject002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isArgumentsObject(new Int8Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsArgumentsObject003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isArgumentsObject(true);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsArgumentsObject004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isArgumentsObject(false);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsArgumentsObject005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isArgumentsObject(new Boolean());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsArrayBuffer001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isArrayBuffer(new ArrayBuffer(0));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsArrayBuffer002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isArrayBuffer(true);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsArrayBuffer003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isArrayBuffer(false);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsArrayBuffer004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isArrayBuffer(new Int8Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsArrayBuffer005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isArrayBuffer(new Int16Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsAsyncFunction001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isAsyncFunction(false);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsAsyncFunction002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isAsyncFunction(function foo() {
    });
    results.push(String(result));
    return results.join('\x00');
}

export function testIsAsyncFunction003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isAsyncFunction(new Int8Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsAsyncFunction004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isAsyncFunction(true);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBigInt64Array001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBigInt64Array(new BigInt64Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBigInt64Array002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBigInt64Array(new Int32Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBigInt64Array003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBigInt64Array(new Uint8Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBigInt64Array004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBigInt64Array(new Float64Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBigInt64Array005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBigInt64Array(new Int8Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBigUint64Array001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBigUint64Array(new BigUint64Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBigUint64Array002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBigUint64Array(new Int8Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBigUint64Array003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBigUint64Array(new Float64Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBigUint64Array004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBigUint64Array(new Uint8Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBigUint64Array005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBigUint64Array(new BigInt64Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBigUint64Array006() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBigUint64Array(new Int8Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBooleanObject001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBooleanObject(new Boolean(false));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBooleanObject002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBooleanObject(new Boolean(true));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBooleanObject003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBooleanObject(true);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBooleanObject004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBooleanObject(false);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBooleanObject005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBooleanObject(Boolean(true));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBoxedPrimitive001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBoxedPrimitive(false);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBoxedPrimitive002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBoxedPrimitive(new Boolean(false));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBoxedPrimitive003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBoxedPrimitive(Symbol('foo'));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBoxedPrimitive004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBoxedPrimitive(Object(Symbol('foo')));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsBoxedPrimitive005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isBoxedPrimitive(new Boolean(true));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsDataView001() {
    let results = [];
    let proc = new util.types();
    const ab = new ArrayBuffer(20);
    let result = proc.isDataView(new DataView(ab));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsDataView002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isDataView(new Int8Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsDataView003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isDataView(new Float64Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsDataView004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isDataView(true);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsDataView005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isDataView(false);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsDate001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isDate(new Date());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsDate002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isDate(new Int8Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsDate003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isDate(true);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsDate004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isDate(new Int16Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsDate005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isDate(new Float64Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsExternal001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isExternal(new Float32Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsExternal002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isExternal(new Int8Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsExternal003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isExternal(true);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsExternal004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isExternal(false);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsExternal005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isExternal(new Int16Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsFloat32Array001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isFloat32Array(new Float32Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsFloat32Array002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isFloat32Array(new Int8Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsFloat32Array003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isFloat32Array(new Int16Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsFloat32Array004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isFloat32Array(new Float64Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsFloat32Array005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isFloat32Array(new Uint8Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsFloat64Array001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isFloat64Array(new Float64Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsFloat64Array002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isFloat64Array(new Int8Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsFloat64Array003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isFloat64Array(new Float32Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsFloat64Array004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isFloat64Array(new Uint8Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsFloat64Array005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isFloat64Array(new Int16Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsGeneratorFunction001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isGeneratorFunction(new Int8Array());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsGeneratorFunction002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isGeneratorFunction(function foo() {
    });
    results.push(String(result));
    return results.join('\x00');
}

export function testIsGeneratorFunction003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isGeneratorFunction(true);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsGeneratorFunction004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isGeneratorFunction(false);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsGeneratorObject001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isGeneratorObject(false);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsGeneratorObject002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isGeneratorObject(new Int8Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsGeneratorObject003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isGeneratorObject(new Int16Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsGeneratorObject004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isGeneratorObject(true);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsInt8Array001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isInt8Array(new Int8Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsInt8Array002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isInt8Array(new ArrayBuffer(0));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsInt8Array003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isInt8Array(new Int32Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsInt8Array004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isInt8Array(new Float64Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsInt8Array005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isInt8Array(new Uint8Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsInt16Array001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isInt16Array(new Int16Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsInt16Array002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isInt16Array(new Int8Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsInt16Array003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isInt16Array(new Int32Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsInt16Array004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isInt16Array(new Uint8Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsInt16Array005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isInt16Array(new Float64Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsInt32Array001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isInt32Array(new Int32Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsInt32Array002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isInt32Array(new Int8Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsInt32Array003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isInt32Array(new Int16Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsInt32Array004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isInt32Array(new Float64Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsInt32Array005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isInt32Array(new Uint8Array([]));
    results.push(String(result));
    return results.join('\x00');
}

export function testIsMap001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isMap(new Map());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsMap002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isMap(new Set());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsMap003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isMap(new String());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsMap004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isMap(new Object());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsMap005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isMap(new Boolean());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsMapIterator001() {
    let results = [];
    let proc = new util.types();
    const map = new Map();
    let result = proc.isMapIterator(map.keys());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsMapIterator002() {
    let results = [];
    let proc = new util.types();
    const map = new Map();
    let result = proc.isMapIterator(map.values());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsMapIterator003() {
    let results = [];
    let proc = new util.types();
    const map = new Map();
    let result = proc.isMapIterator(map.entries());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsMapIterator004() {
    let results = [];
    let proc = new util.types();
    const map = new Map();
    let result = proc.isMapIterator(map[Symbol.iterator]());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsMapIterator005() {
    let results = [];
    let proc = new util.types();
    const map = new Map();
    let result = proc.isMapIterator(map);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsModuleNamespaceObject002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isModuleNamespaceObject(url);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsModuleNamespaceObject003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isModuleNamespaceObject(file);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsModuleNamespaceObject004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isModuleNamespaceObject(process);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsModuleNamespaceObject005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isModuleNamespaceObject(app);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsNativeError001() {
    let results = [];
    let proc = new util.types();
    let result = proc.isNativeError(new TypeError());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsNativeError002() {
    let results = [];
    let proc = new util.types();
    let result = proc.isNativeError(new Error());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsNativeError003() {
    let results = [];
    let proc = new util.types();
    let result = proc.isNativeError(new RangeError());
    results.push(String(result));
    return results.join('\x00');
}

export function testIsNativeError004() {
    let results = [];
    let proc = new util.types();
    let result = proc.isNativeError(true);
    results.push(String(result));
    return results.join('\x00');
}

export function testIsNativeError005() {
    let results = [];
    let proc = new util.types();
    let result = proc.isNativeError(false);
    results.push(String(result));
    return results.join('\x00');
}

export function testAddBefore001() {
    let results = [];
    let res1 = ""
    let res2 = 0;
    util.Aspect.addBefore(MyClass, 'foo', false, (instance, arg1, arg2) => {
        instance.myFunc('intMsg');
        res1 = arg1;
        res2 = arg2;
    });
    let asp = new MyClass();
    let result = asp.foo('123', 111);
    results.push(String(res1));
    results.push(String(res2));
    results.push(String(result));
    return results.join('\x00');
}

export function testAddBefore002() {
    let results = [];
    let res1 = 0;
    let res2 = "";
    util.Aspect.addBefore(MyClass, 'bar', true, (MyClass, arg1) => {
        res1 = arg1;
        res2 = new MyClass().msg;
    });
    let asp = MyClass.bar(6);
    results.push(String(res1));
    results.push(String(res2));
    results.push(String(asp));
    return results.join('\x00');
}

export function testAddBefore003() {
    let results = [];
    let res = 0;
    util.Aspect.addBefore(MyClass, 'bar', true, (This, arg1) => {
        res = arg1;
        Reflect.set(This, 'buffer', 'intData');
    });
    let asp = MyClass.bar(6);
    results.push(String(res));
    results.push(String(asp));
    return results.join('\x00');
}

export async function testAddBefore004() {
    let results = [];
    util.Aspect.addBefore(MyClass, 'myAsync', false, (This, arg1) => {
        Reflect.set(This, 'msg', 'intMsg');
        results.push(String(arg1));
        results.push(String(This.msg));
    });
    let asp = new MyClass();
    let res = await asp.myAsync('456')
    results.push(String(res));
    results.push(String(asp.msg));
    return results.join('\x00');
}

export async function testAddBefore005() {
    let results = [];
    util.Aspect.addBefore(MyClass, 'beforeAsync', false, (MyClass, arg1) => {
        results.push(String(arg1));
    });
    let asp = new MyClass();
    let res = await asp.beforeAsync('123')
    results.push(String(res));
    return results.join('\x00');
}

export function testAddBefore006() {
    let results = [];
    try {
        util.Aspect.addBefore(MyClass, 'printFunc', false, () => {
        });
        let asp = new MyClass();
        let result = asp.func('111');
    } catch (e) {
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function testAddBefore007() {
    let results = [];
    try {
        util.Aspect.addBefore(MyClass, 123, false, () => {
        });
        let asp = new MyClass();
        let result = asp.func('111');
    } catch (e) {
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function testAddBefore009() {
    let results = [];
    util.Aspect.addBefore(MyClass, 'myFoo', false, (This, arg1) => {
        results.push(String(arg1));
        results.push(String(This.msg));
    });
    let asp = new MyClass();
    let result = asp.myFoo();
    results.push(String(result));
    return results.join('\x00');
}

export function testAddBefore010() {
    let results = [];
    util.Aspect.addBefore(MyClass, 'getBar', true, (This, arg1) => {
        results.push(String(arg1));
    });
    util.Aspect.addBefore(MyClass, 'getBar', true, (This, arg2) => {
        results.push(String(arg2));
    });
    util.Aspect.addBefore(MyClass, 'getBar', true, (This, arg3) => {
        results.push(String(arg3));
    });
    let asp = MyClass.getBar(6);
    results.push(String(asp));
    return results.join('\x00');
}

export function testAddBefore011() {
    let results = [];
    util.Aspect.addBefore(MyClassBase, 'setMethod', false, (MyClassBase, arg) => {
        results.push(String(arg));
    });
    let asp = new MyClass();
    let result = asp.setMethod(123);
    results.push(String(result));
    return results.join('\x00');
}

export function testAddBefore012() {
    let results = [];
    util.Aspect.addBefore(MyClassBase, 'setData', false, (MyClassBase, arg) => {
        MyClassBase.setBase('intDataBase');
        results.push(String(arg));
    });
    let asp = new MyClass();
    let result = asp.setData(100);
    results.push(String(result));
    results.push(String(asp.baseBuffer));
    return results.join('\x00');
}

export function testAddBefore013() {
    let results = [];
    util.Aspect.addBefore(MyClass, 'foo', false, (MyClass, arg1, arg2) => {
        MyClass.myFunc('intMsg');
        results.push(String(arg1));
        results.push(String(arg2));
    });
    util.Aspect.addAfter(MyClass, 'foo', false, (MyClass, arg1, arg2) => {
        results.push(String(arg1));
        results.push(String(arg2));
        return 0;
    });
    let asp = new MyClass();
    let result = asp.foo('123', 111);
    results.push(String(result));
    return results.join('\x00');
}

export function testAddBefore014() {
    let results = [];
    let asp = new MyClass();
    results.push(String(asp.myBeforeAsync.constructor.name));
    util.Aspect.addBefore(MyClass, 'myBeforeAsync', false, (This, arg1, arg2) => {
        results.push(String(arg1));
        results.push(String(arg2));
        results.push(String(This.msg));
    });
    asp.myBeforeAsync('string')
    results.push(String(asp.myBeforeAsync.constructor.name));
    return results.join('\x00');
}

export function testAddBefore015() {
    let results = [];
    util.Aspect.addBefore(MyClass, 'foo', false, (MyClass, arg1, arg2) => {
        MyClass.myFunc('intMsg');
        return 100;
    });
    util.Aspect.replace(MyClass, 'foo', false, (MyClass, arg1, arg2) => {
        results.push(String(arg1));
        results.push(String(arg2));
        return 0;
    });
    let asp = new MyClass();
    let result = asp.foo('123', 111);
    results.push(String(result));
    return results.join('\x00');
}

export function testAddAfter001() {
    let results = [];
    util.Aspect.addAfter(AfterClass, 'foo', false, (AfterClass, arg1, arg2) => {
        AfterClass.myFunc('intMsg');
        results.push(String(arg1));
        results.push(String(arg2));
    });
    let asp = new AfterClass();
    let result = asp.foo('123', 111);
    results.push(String(result));
    return results.join('\x00');
}

export function testAddAfter002() {
    let results = [];
    util.Aspect.addAfter(AfterClass, 'getData', false, (This, arg1, arg2) => {
        This.msg = 'intMsg';
        results.push(String(arg1));
        results.push(String(arg2));
        return arg1 + 100;
    });
    let asp = new AfterClass();
    let result = asp.getData('123');
    results.push(String(result));
    results.push(String(asp.msg));
    return results.join('\x00');
}

export function testAddAfter003() {
    let results = [];
    util.Aspect.addAfter(AfterClass, 'bar', true, (This, arg1) => {
        results.push(String(arg1));
        Reflect.set(This, 'buffer', 'intData');
    });
    let asp = AfterClass.bar(6);
    results.push(String(asp));
    return results.join('\x00');
}

export function testAddAfter004() {
    let results = [];
    util.Aspect.addAfter(AfterClass, 'myAsync', false, (This, ret, arg) => {
        results.push(String(arg));
        results.push(String(This.msg));
        results.push(String(ret instanceof Promise));
    });
    let asp = new AfterClass();
    asp.myAsync('123')
    return results.join('\x00');
}

export function testAddAfter005() {
    let results = [];
    util.Aspect.addAfter(AfterClass, 'afterAsync', false, (This, arg1) => {
        Reflect.set(This, 'msg', 'intMsg');
        results.push(String(This.msg));
    });
    let asp = new AfterClass();
    asp.afterAsync('456');
    return results.join('\x00');
}

export function testAddAfter006() {
    let results = [];
    try {
        util.Aspect.addAfter(AfterClass, 'printFunc', false, () => {
        });
        let asp = new AfterClass();
        let result = asp.func('111');
    } catch (e) {
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function testAddAfter007() {
    let results = [];
    try {
        util.Aspect.addAfter(AfterClass, 'func', 123, () => {
        });
        let asp = new AfterClass();
        let result = asp.func('111');
    } catch (e) {
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function testAddAfter009() {
    let results = [];
    util.Aspect.addAfter(AfterClass, 'myFoo', false, (This, arg1) => {
        results.push(String(arg1));
        results.push(String(This.msg));
        return 6;
    });
    let asp = new AfterClass();
    let result = asp.myFoo();
    results.push(String(result));
    return results.join('\x00');
}

export function testAddAfter010() {
    let results = [];
    util.Aspect.addAfter(AfterClass, 'getBar', true, (This, arg1) => {
        results.push(String(arg1));
    });
    util.Aspect.addAfter(AfterClass, 'getBar', true, (This, arg2) => {
        results.push(String(arg2));
    });
    util.Aspect.addAfter(AfterClass, 'getBar', true, (This, arg3) => {
        results.push(String(arg3));
    });
    let asp = AfterClass.getBar(6);
    results.push(String(asp));
    return results.join('\x00');
}

export function testAddAfter011() {
    let results = [];
    util.Aspect.addAfter(AfterClass, 'setMethod', false, (MyClassBase, arg) => {
        results.push(String(arg));
    });
    let asp = new AfterClass();
    let result = asp.setMethod(123);
    results.push(String(result));
    return results.join('\x00');
}

export function testAddAfter012() {
    let results = [];
    util.Aspect.addAfter(MyClassBase, 'setData', false, (MyClassBase, arg) => {
        MyClassBase.setBuffer('intDataBase');
        results.push(String(arg));
        return 0;
    });
    let asp = new AfterClass();
    let result = asp.setData(100);
    results.push(String(result));
    results.push(String(asp.strBuffer));
    return results.join('\x00');
}

export function testAddAfter014() {
    let results = [];
    util.Aspect.addAfter(MyClass, 'foo', false, (MyClass, arg1, arg2) => {
        MyClass.myFunc('intMsg');
        return 0;
    });
    util.Aspect.replace(MyClass, 'foo', false, (MyClass, arg1, arg2) => {
        results.push(String(arg1));
        results.push(String(arg2));
        return 100;
    });
    let asp = new MyClass();
    let result = asp.foo('123', 111);
    results.push(String(result));
    return results.join('\x00');
}

export function testAddAfter015() {
    let results = [];
    let asp = new AfterClass();
    results.push(String(asp.myAfterAsync.constructor.name));
    util.Aspect.addAfter(AfterClass, 'myAfterAsync', false, (This, ret, arg) => {
        results.push(String(arg));
        results.push(String(This.msg));
        results.push(String(ret instanceof Promise));
    });
    asp.myAfterAsync('str')
    results.push(String(asp.myAfterAsync.constructor.name));
    return results.join('\x00');
}

export function testReplace001() {
    let results = [];
    util.Aspect.replace(ReplaceClass, 'foo', false, (ReplaceClass, arg1, arg2) => {
        ReplaceClass.myFunc('intMsg');
        results.push(String(arg1));
        results.push(String(arg2));
        return 100;
    });
    let asp = new ReplaceClass();
    let result = asp.foo('123', 111);
    results.push(String(result));
    return results.join('\x00');
}

export function testReplace002() {
    let results = [];
    util.Aspect.replace(ReplaceClass, 'getData', false, (This, arg1, arg2) => {
        This.msg = 'intMsg';
        results.push(String(arg1));
        results.push(String(arg2));
        return 100;
    });
    let asp = new ReplaceClass();
    let result = asp.getData('123');
    results.push(String(result));
    results.push(String(asp.msg));
    return results.join('\x00');
}

export function testReplace003() {
    let results = [];
    util.Aspect.replace(ReplaceClass, 'bar', true, (This, arg1) => {
        results.push(String(arg1));
        Reflect.set(This, 'buffer', 'intData');
    });
    let asp = ReplaceClass.bar(6);
    results.push(String(asp));
    return results.join('\x00');
}

export function testReplace004() {
    let results = [];
    util.Aspect.replace(ReplaceClass, 'bar', true, (This, arg1) => {
        results.push(String(arg1));
        Reflect.set(This, 'buffer', 'intData');
        return 100;
    });
    let asp = ReplaceClass.bar(6);
    results.push(String(asp));
    results.push(String(ReplaceClass.buffer));
    return results.join('\x00');
}

export function testReplace005() {
    let results = [];
    util.Aspect.replace(ReplaceClass, 'myAsync', false, (MyClass, arg1) => {
        results.push(String(arg1));
    });
    let asp = new ReplaceClass();
    let result = asp.myAsync('123');
    return results.join('\x00');
}

export function testReplace006() {
    let results = [];
    let original = ReplaceClass.getBar;
    util.Aspect.replace(ReplaceClass, 'getBar', true, (This, arg) => {
        results.push(String(arg));
        return 100;
    });
    let asp = ReplaceClass.getBar(6);
    results.push(String(asp));
    util.Aspect.replace(ReplaceClass, 'getBar', true, (This, arg1) => {
        results.push(String(arg1));
        return original(arg1);
    });
    let result = ReplaceClass.getBar(6);
    results.push(String(result));
    return results.join('\x00');
}

export function testReplace007() {
    let results = [];
    util.Aspect.replace(ReplaceClass, 'myAsync', false, (This, arg1) => {
        Reflect.set(This, 'msg', 'intMsg');
        results.push(String(arg1));
        results.push(String(This.msg));
    });
    let asp = new ReplaceClass();
    asp.myAsync('456');
    return results.join('\x00');
}

export function testReplace009() {
    let results = [];
    try {
        util.Aspect.replace(ReplaceClass, 'printFunc', false, () => {
        });
        let asp = new ReplaceClass();
        let result = asp.func('111');
    } catch (e) {
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function testReplace010() {
    let results = [];
    try {
        util.Aspect.replace(ReplaceClass, 'func', 123, () => {
        });
        let asp = new ReplaceClass();
        let result = asp.func('111');
    } catch (e) {
        results.push(String(e.message));
    }
    return results.join('\x00');
}

export function testReplace011() {
    let results = [];
    util.Aspect.replace(ReplaceClass, 'myFoo', false, (This, arg1) => {
        results.push(String(arg1));
        results.push(String(This.msg));
        return 6;
    });
    let asp = new ReplaceClass();
    let result = asp.myFoo();
    results.push(String(result));
    return results.join('\x00');
}

export function testReplace013() {
    let results = [];
    util.Aspect.replace(ReplaceClass, 'setMethod', false, (MyClassBase, arg) => {
        results.push(String(arg));
    });
    let asp = new ReplaceClass();
    let result = asp.setMethod(10);
    results.push(String(result));
    return results.join('\x00');
}

export function testReplace014() {
    let results = [];
    util.Aspect.replace(MyClassBase, 'setData', false, (MyClassBase, arg) => {
        MyClassBase.setBuffer('intDataBase');
        results.push(String(arg));
        return 0;
    });
    let asp = new ReplaceClass();
    let result = asp.setData(100);
    results.push(String(result));
    results.push(String(asp.strBuffer));
    return results.join('\x00');
}

export function testReplace015() {
    let results = [];
    util.Aspect.replace(ReplaceClass, 'foo', false, (MyClass, arg1, arg2) => {
        MyClass.myFunc('intMsg');
        results.push(String(arg1));
        results.push(String(arg2));
        return 0;
    });
    util.Aspect.addBefore(ReplaceClass, 'foo', false, (MyClass, arg1, arg2) => {
        results.push(String(arg1));
        results.push(String(arg2));
        return 100;
    });
    let asp = new ReplaceClass();
    let result = asp.foo('123', 111);
    results.push(String(result));
    return results.join('\x00');
}

export function testReplace016() {
    let results = [];
    util.Aspect.replace(ReplaceClass, 'foo', false, (ReplaceClass, arg1, arg2) => {
        ReplaceClass.myFunc('intMsg');
        results.push(String(arg1));
        results.push(String(arg2));
        return 0;
    });
    util.Aspect.addAfter(ReplaceClass, 'foo', false, (ReplaceClass, arg1, arg2) => {
        results.push(String(arg1));
        results.push(String(arg2));
        return 100;
    });
    let asp = new ReplaceClass();
    let result = asp.foo('123', 111);
    results.push(String(result));
    return results.join('\x00');
}

export function testReplace017() {
    let results = [];
    let asp = new ReplaceClass();
    results.push(String(asp.replaceAsync.constructor.name));
    util.Aspect.replace(ReplaceClass, 'replaceAsync', false, (This, arg1) => {
        Reflect.set(This, 'msg', 'intMsg');
        results.push(String(arg1));
        results.push(String(This.msg));
    });
    asp.replaceAsync('123');
    results.push(String(asp.replaceAsync.constructor.name));
    return results.join('\x00');
}

export function testTextencoderencoding_001() {
    let results = [];
    let that = new util.TextEncoder('gB2312')
    let str = that.encoding
    results.push(String(str));
    that = new util.TextEncoder('Gb2312')
    str = that.encoding;
    results.push(String(str));
    return results.join('\x00');
}

export function testTextencoderencoding_002() {
    let results = [];
    let that = new util.TextEncoder('utf-16le')
    let str = that.encoding
    results.push(String(str));
    that = new util.TextEncoder('Utf-16le')
    str = that.encoding;
    results.push(String(str));
    return results.join('\x00');
}

export function testTextencoderencoding_003() {
    let results = [];
    let that = new util.TextEncoder('GbK')
    let str = that.encoding
    results.push(String(str));
    that = new util.TextEncoder('GBK')
    str = that.encoding;
    results.push(String(str));
    return results.join('\x00');
}

export function testTextencoderencoding_004() {
    let results = [];
    let that = new util.TextEncoder('UTF-16le')
    let str = that.encoding
    results.push(String(str));
    that = new util.TextEncoder('Utf-16le')
    str = that.encoding;
    results.push(String(str));
    return results.join('\x00');
}

export function testTextencoderencoding_005() {
    let results = [];
    let that = new util.TextEncoder('ISO-8859-3')
    let str = that.encoding
    results.push(String(str));
    that = new util.TextEncoder('IBM866')
    str = that.encoding;
    results.push(String(str));
    return results.join('\x00');
}

export function testAutoFinalizer_001() {
    let results = [];
    const originalFR = FinalizationRegistry;
    let gc, heldValue;
    try {
        FinalizationRegistry = class {
            constructor(cb) {
                gc = cb;
            }

            register(obj, val) {
                heldValue = val;
            }
        };
        new DeviceManageViewModel('test');
        gc(heldValue);
        results.push(String(DeviceManageViewModel.ans));
    } finally {
        FinalizationRegistry = originalFR;
    }
    return results.join('\x00');
}
