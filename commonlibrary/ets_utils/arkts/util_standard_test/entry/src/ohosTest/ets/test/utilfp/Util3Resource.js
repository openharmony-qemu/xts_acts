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

export function decodeTostring001() {
    let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: true });
    let uint8 = new Uint8Array([0xEF, 0xBB, 0xBF, 228, 189, 160, 0, 0, 229, 165, 189, 0]);
    let resStr = textDecoder.decodeToString(uint8);
    return [resStr, resStr.length];
}

export function decodeTostring0010() {
    let that = new util.TextEncoder('shift_jis');
    let result = that.encodeInto('こんにちは');
    let textDecode = util.TextDecoder.create('shift_jis');
    let res = textDecode.decodeToString(result);
    return res;
}

export function decodeTostring0011() {
    let that = new util.TextEncoder('iso-2022-jp');
    let result = that.encodeInto('こんにちは');
    let textDecode = util.TextDecoder.create('iso-2022-jp', { ignoreBOM: true });
    let res = textDecode.decodeToString(result);
    return res;
}

export function decodeTostring0012() {
    let that = new util.TextEncoder('ibm866');
    let result = that.encodeInto('Здравствуйте');
    let textDecode = util.TextDecoder.create('ibm866');
    let res = textDecode.decodeToString(result);
    return res;
}

export function decodeTostring0013() {
    let that = new util.TextEncoder('GBK');
    let result = that.encodeInto('abc哈熠');
    let textDecode = util.TextDecoder.create('GBK', { ignoreBOM: true });
    let data = textDecode.decodeToString(result);
    return data;
}

export function decodeTostring0014() {
    let that = new util.TextEncoder('GB2312');
    let result = that.encodeInto('abc哈熠');
    let textDecode = util.TextDecoder.create('GBK');
    let data = textDecode.decodeToString(result);
    return data;
}

export function decodeTostring0015() {
    let that = new util.TextEncoder('iso-8859-2');
    let result = that.encodeInto('Szia');
    let textDecode = util.TextDecoder.create('iso-8859-2');
    let data = textDecode.decodeToString(result);
    return data;
}

export function decodeTostring0016() {
    let that = new util.TextEncoder('iso-8859-4');
    let result = that.encodeInto('Tavaliselt tere päeval');
    let textDecode = util.TextDecoder.create('iso-8859-4', { ignoreBOM: true });
    let data = textDecode.decodeToString(result);
    return data;
}

export function decodeTostring0017() {
    let that = new util.TextEncoder('iso-8859-5');
    let result = that.encodeInto('Здравствуйте');
    let textDecode = util.TextDecoder.create('iso-8859-5', { ignoreBOM: false });
    let data = textDecode.decodeToString(result);
    return data;
}

export function decodeTostring0018() {
    let that = new util.TextEncoder('iso-8859-6');
    let result = that.encodeInto('مرحبا');
    let textDecode = util.TextDecoder.create('iso-8859-6');
    let data = textDecode.decodeToString(result);
    return data;
}

export function decodeTostring0019() {
    let that = new util.TextEncoder('iso-8859-7');
    let result = that.encodeInto('Γεια σου');
    let textDecode = util.TextDecoder.create('iso-8859-7');
    let data = textDecode.decodeToString(result);
    return data;
}

export function decodeTostring002() {
    let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: false });
    let uint8 = new Uint8Array([0xEF, 0xBB, 0xBF, 228, 189, 160, 0, 0, 229, 165, 189, 0]);
    let resStr = textDecoder.decodeToString(uint8);
    return [resStr, resStr.length];
}

export function decodeTostring0020() {
    let that = new util.TextEncoder('iso-8859-8');
    let result = that.encodeInto('שלום');
    let textDecode = util.TextDecoder.create('iso-8859-8', { ignoreBOM: true });
    let data = textDecode.decodeToString(result);
    return data;
}

export function decodeTostring0021() {
    let that = new util.TextEncoder('iso-8859-8');
    let result = that.encodeInto('שלום');
    let textDecode = util.TextDecoder.create('iso-8859-8', { ignoreBOM: true });
    let data = textDecode.decodeToString(result);
    return data;
}

export function decodeTostring0022() {
    let that = new util.TextEncoder('iso-8859-8-i');
    let result = that.encodeInto('שלום');
    let textDecode = util.TextDecoder.create('iso-8859-8-i', { ignoreBOM: true });
    let data = textDecode.decodeToString(result);
    return data;
}

export function decodeTostring0023() {
    let that = new util.TextEncoder('iso-8859-10');
    let result = that.encodeInto('Hei');
    let textDecode = util.TextDecoder.create('iso-8859-10', { ignoreBOM: true });
    let data = textDecode.decodeToString(result);
    return data;
}

export function decodeTostring0024() {
    let that = new util.TextEncoder('iso-8859-13');
    let result = that.encodeInto('Sveiki');
    let textDecode = util.TextDecoder.create('iso-8859-13');
    let data = textDecode.decodeToString(result);
    return data;
}

export function decodeTostring0025() {
    let that = new util.TextEncoder('iso-8859-14');
    let result = that.encodeInto('Diolch');
    let textDecode = util.TextDecoder.create('iso-8859-14', { ignoreBOM: true });
    let data = textDecode.decodeToString(result);
    return data;
}

export function decodeTostring0026() {
    let that = new util.TextEncoder('iso-8859-15');
    let result = that.encodeInto('Hola');
    let textDecode = util.TextDecoder.create('iso-8859-15');
    let data = textDecode.decodeToString(result);
    return data;
}

export function decodeTostring0027() {
    let that = new util.TextEncoder('koi8-r');
    let result = that.encodeInto('Привет, мир!');
    let textDecode = util.TextDecoder.create('koi8-r', { ignoreBOM: true });
    let data = textDecode.decodeToString(result);
    return data;
}

export function decodeTostring0028() {
    let that = new util.TextEncoder('koi8-u');
    let result = that.encodeInto('Привіт, світ');
    let textDecode = util.TextDecoder.create('koi8-u', { ignoreBOM: true });
    let data = textDecode.decodeToString(result);
    return data;
}

export function decodeTostring0029() {
    try {
        let textDecoder = util.TextDecoder.create('UTF-8', { fatal: true });
        let uint8arr = new Uint8Array([0xC0]);
        textDecoder.decodeToString(uint8arr);
        return '';
    } catch (e) {
        return e.message;
    }
}

export function decodeTostring003() {
    let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: true });
    let uint8 = new Uint8Array([228, 189, 160, 0, 0, 229, 165, 189, 0]);
    let resStr = textDecoder.decodeToString(uint8);
    return [resStr, resStr.length];
}

export function decodeTostring0030() {
    let textDecoder = util.TextDecoder.create('UTF-8', { fatal: false });
    let uint8 = new Uint8Array([0xC0]);
    let result = textDecoder.decodeToString(uint8);
    return result.length;
}

export function decodeTostring0031() {
    try {
        let textDecoder = util.TextDecoder.create('utf-16le', { fatal: true });
        let uint8 = new Uint8Array([0x00]);
        textDecoder.decodeToString(uint8);
        return '';
    } catch (e) {
        return e.message;
    }
}

export function decodeTostring0032() {
    let textDecoder = util.TextDecoder.create('utf-16le', { fatal: false });
    let uint8arr = new Uint8Array([0x00]);
    let result = textDecoder.decodeToString(uint8arr);
    return result.length;
}

export function decodeTostring0033() {
    try {
        let textDecoder = util.TextDecoder.create('utf-16be', { fatal: true });
        let uint8 = new Uint8Array([0x00]);
        textDecoder.decodeToString(uint8);
        return '';
    } catch (e) {
        return e.message;
    }
}

export function decodeTostring0034() {
    let textDecoder = util.TextDecoder.create('utf-16be', { fatal: false });
    let uint8 = new Uint8Array([0x00]);
    let result = textDecoder.decodeToString(uint8);
    return result.length;
}

export function decodeTostring004() {
    let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: false });
    let uint8 = new Uint8Array([228, 189, 160, 0, 0, 229, 165, 189, 0]);
    let resStr = textDecoder.decodeToString(uint8);
    return [resStr, resStr.length];
}

export function decodeTostring005() {
    let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: false });
    let uint8 = new Uint8Array([228, 189, 160, 229]);
    let retStr = textDecoder.decodeToString(uint8, { stream: true });
    let uint8arr = new Uint8Array([165, 189]);
    let resStr = textDecoder.decodeToString(uint8arr, { stream: true });
    return [retStr, resStr];
}

export function decodeTostring006() {
    let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: false });
    let uint8 = new Uint8Array();
    let resStr = textDecoder.decodeToString(uint8);
    return resStr;
}

export function decodeTostring007() {
    let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: false });
    let resStr = textDecoder.decodeToString(undefined);
    return resStr;
}

export function decodeTostring008() {
    let that = new util.TextEncoder('gb18030');
    let result = that.encodeInto('abc哈哈熠熠');
    let textDecode = util.TextDecoder.create('gb18030', { ignoreBOM: true });
    let res = textDecode.decodeToString(result);
    return res;
}

export function decodeTostring009() {
    let that = new util.TextEncoder('big5');
    let result = that.encodeInto('abc哈哈熠熠');
    let textDecode = util.TextDecoder.create('big5', { ignoreBOM: true });
    let res = textDecode.decodeToString(result);
    return res;
}

export function decodeWithStream001() {
    const that = util.TextDecoder.create('utf-8');
    const uint8arr = new Uint8Array([0, 65, 49, 53, 79, 75, 70, 69]);
    let retStr = that.decodeWithStream(uint8arr);
    return retStr;
}

export function decodeWithStream002() {
    const that = util.TextDecoder.create('utf-8');
    const uint8arr = new Uint8Array([67, 65, 49, 53, 0, 109, 112]);
    let retStr = that.decodeWithStream(uint8arr);
    return retStr;
}

export function decodeWithStream003() {
    const that = util.TextDecoder.create('utf-8');
    const uint8arr = new Uint8Array([84, 67, 65, 53, 49, 79, 0]);
    let retStr = that.decodeWithStream(uint8arr);
    return retStr;
}

export function testEncodeInto002() {
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encodeInto('\uD800楼楼')
    return result[5];
}

export function testEncodeInto003() {
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encodeInto('a\uD800楼楼')
    return result[0];
}

export function testEncodeInto004() {
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encodeInto('abc\uD800楼楼')
    return result[1];
}

export function testEncodeInto005() {
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encodeInto('123\uD800楼楼')
    return [result[0], result[9]];
}

export function testEncodeInto006() {
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encodeInto('123¥\uD800楼')
    return result[10];
}

export function testEncodeInto007() {
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encodeInto('¥¥')
    return result[0];
}

export function testEncodeInto008() {
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encodeInto('$$')
    return result[0];
}

export function testEncodeInto009() {
    let that = new util.TextEncoder('gb18030')
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encodeInto('abc哈哈熠熠')
    return [result[0], result[3], result[4], result[7], result[8]];
}

export function testEncodeInto010() {
    let that = new util.TextEncoder('GB18030')
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encodeInto('abc哈哈熠熠')
    return [result[0], result[3], result[4], result[7], result[8]];
}

export function testEncodeInto011() {
    let that = new util.TextEncoder('big5')
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encodeInto('abc哈哈熠熠')
    return [result[0], result[3], result[4], result[7], result[8]];
}

export function testEncodeInto012() {
    let that = new util.TextEncoder('shift_jis')
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encodeInto('abc哈哈熠熠')
    return [result[0], result[3], result[4], result[7], result[8]];
}

export function testEncodeInto013() {
    let that = new util.TextEncoder('iso-2022-jp')
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encodeInto('abc哈哈熠熠')
    return [result[0], result[3], result[4], result[7], result[8]];
}

export function testEncodeInto014() {
    let that = new util.TextEncoder('ibm866')
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encodeInto('abc哈哈熠熠')
    return [result[0], result[3], result[4]];
}

export function testEncodeInto015() {
    let that = new util.TextEncoder('macintosh')
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encodeInto('abc哈哈熠熠')
    return [result[0], result[3], result[4]];
}

export function testEncodeInto016() {
    let that = new util.TextEncoder('GBK');
    let result = that.encodeInto('abc哈熠');
    let res = new Uint8Array([97, 98, 99, 185, 254, 236, 218]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto017() {
    let that = new util.TextEncoder('GB2312');
    let result = that.encodeInto('abc哈熠');
    let res = new Uint8Array([97, 98, 99, 185, 254, 236, 218]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto018() {
    let that = new util.TextEncoder('iso-8859-2');
    let result = that.encodeInto('¡Hola, Mundo!');
    let res = new Uint8Array([26, 72, 111, 108, 97, 44, 32, 77, 117, 110, 100, 111, 33]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto019() {
    let that = new util.TextEncoder('iso-8859-3');
    let result = that.encodeInto('¡Hola, Mundo!');
    let res = new Uint8Array([26, 72, 111, 108, 97, 44, 32, 77, 117, 110, 100, 111, 33]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto020() {
    let that = new util.TextEncoder('iso-8859-4');
    let result = that.encodeInto('¡Hola, Mundo!');
    let res = new Uint8Array([26, 72, 111, 108, 97, 44, 32, 77, 117, 110, 100, 111, 33]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto021() {
    let that = new util.TextEncoder('iso-8859-5');
    let result = that.encodeInto('¡Hola, Mundo!');
    let res = new Uint8Array([26, 72, 111, 108, 97, 44, 32, 77, 117, 110, 100, 111, 33]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto022() {
    let that = new util.TextEncoder('iso-8859-6');
    let result = that.encodeInto('¡Hola, Mundo!');
    let res = new Uint8Array([26, 72, 111, 108, 97, 44, 32, 77, 117, 110, 100, 111, 33]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto023() {
    let that = new util.TextEncoder('iso-8859-7');
    let result = that.encodeInto('¡Hola, Mundo!');
    let res = new Uint8Array([26, 72, 111, 108, 97, 44, 32, 77, 117, 110, 100, 111, 33]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto024() {
    let that = new util.TextEncoder('iso-8859-8');
    let result = that.encodeInto('¡Hola, Mundo!');
    let res = new Uint8Array([26, 72, 111, 108, 97, 44, 32, 77, 117, 110, 100, 111, 33]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto025() {
    let that = new util.TextEncoder('iso-8859-8-i');
    let result = that.encodeInto('¡Hola, Mundo!');
    let res = new Uint8Array([26, 72, 111, 108, 97, 44, 32, 77, 117, 110, 100, 111, 33]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto026() {
    let that = new util.TextEncoder('iso-8859-10');
    let result = that.encodeInto('¡Hola, Mundo!');
    let res = new Uint8Array([26, 72, 111, 108, 97, 44, 32, 77, 117, 110, 100, 111, 33]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto027() {
    let that = new util.TextEncoder('iso-8859-13');
    let result = that.encodeInto('¡Hola, Mundo!');
    let res = new Uint8Array([26, 72, 111, 108, 97, 44, 32, 77, 117, 110, 100, 111, 33]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto028() {
    let that = new util.TextEncoder('iso-8859-14');
    let result = that.encodeInto('¡Hola, Mundo!');
    let res = new Uint8Array([26, 72, 111, 108, 97, 44, 32, 77, 117, 110, 100, 111, 33]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto029() {
    let that = new util.TextEncoder('iso-8859-15');
    let result = that.encodeInto('¡Hola, Mundo!');
    let res = new Uint8Array([161, 72, 111, 108, 97, 44, 32, 77, 117, 110, 100, 111, 33]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto030() {
    let that = new util.TextEncoder('koi8-r');
    let result = that.encodeInto('Привет, мир!');
    let res = new Uint8Array([240, 210, 201, 215, 197, 212, 44, 32, 205, 201, 210, 33]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto031() {
    let that = new util.TextEncoder('koi8-u');
    let result = that.encodeInto('Привіт, світ');
    let res = new Uint8Array([240, 210, 201, 215, 166, 212, 44, 32, 211, 215, 166, 212]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto032() {
    let that = new util.TextEncoder('windows-874');
    let result = that.encodeInto('สวัสดี，โลก');
    let res = new Uint8Array([202, 199, 209, 202, 180, 213, 63, 226, 197, 161]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto033() {
    let that = new util.TextEncoder('windows-1250');
    let result = that.encodeInto('Ahoj, svět');
    let res = new Uint8Array([65, 104, 111, 106, 44, 32, 115, 118, 236, 116]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto034() {
    let that = new util.TextEncoder('windows-1251');
    let result = that.encodeInto('Привет, мир');
    let res = new Uint8Array([207, 240, 232, 226, 229, 242, 44, 32, 236, 232, 240]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto035() {
    let that = new util.TextEncoder('windows-1252');
    let result = that.encodeInto('Hi, World');
    let res = new Uint8Array([72, 105, 44, 32, 87, 111, 114, 108, 100]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto036() {
    let that = new util.TextEncoder('windows-1253');
    let result = that.encodeInto('Γεια σας, κόσμο');
    let res = new Uint8Array([195, 229, 233, 225, 32, 243, 225, 242, 44, 32, 234, 252, 243, 236, 239]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto037() {
    let that = new util.TextEncoder('windows-1254');
    let result = that.encodeInto('Merhaba, dünya');
    let res = new Uint8Array([77, 101, 114, 104, 97, 98, 97, 44, 32, 100, 252, 110, 121, 97]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto038() {
    let that = new util.TextEncoder('windows-1255');
    let result = that.encodeInto('שלום, עולם');
    let res = new Uint8Array([249, 236, 229, 237, 44, 32, 242, 229, 236, 237]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto039() {
    let that = new util.TextEncoder('windows-1256');
    let result = that.encodeInto('مرحبا, العالم');
    let res = new Uint8Array([227, 209, 205, 200, 199, 44, 32, 199, 225, 218, 199, 225, 227]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto040() {
    let that = new util.TextEncoder('windows-1257');
    let result = that.encodeInto('Tere, maailma');
    let res = new Uint8Array([84, 101, 114, 101, 44, 32, 109, 97, 97, 105, 108, 109, 97]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto041() {
    let that = new util.TextEncoder('windows-1258');
    let result = that.encodeInto('Chào, thế giới');
    let res = new Uint8Array([67, 104, 224, 111, 44, 32, 116, 104, 26, 32, 103, 105, 26, 105]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto042() {
    let that = new util.TextEncoder('euc-jp');
    let result = that.encodeInto('こんにちは、世界!');
    let res = new Uint8Array([164, 179, 164, 243, 164, 203, 164, 193, 164, 207, 161, 162, 192, 164, 179, 166, 33]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto043() {
    let that = new util.TextEncoder('euc-kr');
    let result = that.encodeInto('안녕, 세상!');
    let res = new Uint8Array([190, 200, 179, 231, 44, 32, 188, 188, 187, 243, 33]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto044() {
    let that = new util.TextEncoder('x-mac-cyrillic');
    let result = that.encodeInto('Привет, мир!');
    let res = new Uint8Array([143, 240, 232, 226, 229, 242, 44, 32, 236, 232, 240, 33]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto045() {
    let that = new util.TextEncoder('utf-16be');
    let result = that.encodeInto('abc哈熠');
    let res = new Uint8Array([0, 97, 0, 98, 0, 99, 84, 200, 113, 160]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeInto046() {
    let that = new util.TextEncoder('utf-16le');
    let result = that.encodeInto('abc哈熠');
    let res = new Uint8Array([97, 0, 98, 0, 99, 0, 200, 84, 160, 113]);
    for (let i = 0; i < result.length; i++) {
        if (result[i] !== res[i]) return false;
    }
    return true;
}

export function testEncodeIntoThrowError001() {
    try {
        let that = new util.TextEncoder()
        let buffer = new ArrayBuffer(20)
        let result = new Uint8Array(buffer)
        result = that.encodeInto(123)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function testEncodeIntoThrowError002() {
    try {
        let that = new util.TextEncoder()
        let buffer = new ArrayBuffer(20)
        let result = new Uint8Array(buffer)
        result = that.encodeInto({ ignoreBOM: true })
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function testEncoding_001() {
    let that = new util.TextEncoder('big5')
    let str = that.encoding
    return str;
}

export function testEncoding_002() {
    let that = new util.TextEncoder('iso-8859-2')
    let str = that.encoding
    return str;
}

export function testEncoding_003() {
    let that = new util.TextEncoder('euc-kr')
    let str = that.encoding
    return str;
}

export function testEncoding_004() {
    let that = new util.TextEncoder('ibm866')
    let str = that.encoding
    return str;
}

export function testEncoding_005() {
    let that = new util.TextEncoder('x-mac-cyrillic')
    let str = that.encoding
    return str;
}

export function testEncoding_create_001() {
    let that = util.TextEncoder.create()
    let str = that.encoding
    return str;
}

export function testEncoding_create_002() {
    let that = util.TextEncoder.create('iso-8859-2')
    let str = that.encoding
    return str;
}

export function testEncoding_create_003() {
    let that = util.TextEncoder.create('euc-kr')
    let str = that.encoding
    return str;
}

export function testEncoding_create_004() {
    let that = util.TextEncoder.create('ibm866')
    let str = that.encoding
    return str;
}

export function testEncoding_create_005() {
    let that = util.TextEncoder.create('x-mac-cyrillic')
    let str = that.encoding
    return str;
}

export function testEnd001() {
    let decoder = new util.StringDecoder('macintosh');
    let input = new Uint8Array([0X61]);
    const decoded = decoder.end(input);
    return decoded;
}

export function testEnd002() {
    let decoder = new util.StringDecoder('utf-8');
    const decoded = decoder.end("abc");
    return decoded;
}

export function testEnd003() {
    let decoder = new util.StringDecoder('utf-8');
    let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
    const decoded = decoder.end(input);
    return decoded;
}

export function testEnd004() {
    let decoder = new util.StringDecoder('utf-8');
    let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
    const decoded = decoder.write(input.slice(0, 5));
    const decodeend = decoder.end(input.slice(5));
    return [decoded, decodeend];
}

export function testTextDecoderCreate001() {
    let that = util.TextDecoder.create('utf-8', { ignoreBOM: true })
    let retStr = that.encoding
    return retStr;
}

export function testTextDecoderCreate0010() {
    let that = util.TextDecoder.create(undefined, { ignoreBOM: true });
    let encodingStr = that.encoding;
    return encodingStr;
}

export function testTextDecoderCreate0013() {
    let that = util.TextDecoder.create(null, { ignoreBOM: true });
    let encodingStr = that.encoding;
    return encodingStr;
}

export function testTextDecoderCreate002() {
    let that = util.TextDecoder.create('utf-16le')
    let encodingStr = that.encoding
    return encodingStr;
}

export function testTextDecoderCreate003() {
    let that = util.TextDecoder.create('utf-16be')
    let encodingStr = that.encoding
    return encodingStr;
}

export function testTextDecoderCreate004() {
    let that = util.TextDecoder.create('utf-16be', { ignoreBOM: true })
    let encodingStr = that.encoding
    return encodingStr;
}

export function testTextDecoderCreate005() {
    let that = util.TextDecoder.create('utf-16be', { ignoreBOM: false })
    let encodingStr = that.encoding
    return encodingStr;
}

export function testTextDecoderCreate006() {
    let that = util.TextDecoder.create()
    let encodingStr = that.encoding
    return encodingStr;
}

export function testTextDecoderCreate007() {
    let that = util.TextDecoder.create(undefined, { ignoreBOM: false })
    let encodingStr = that.encoding
    return encodingStr;
}

export function testTextDecoderCreate008() {
    let that = util.TextDecoder.create(undefined);
    let encodingStr = that.encoding;
    return encodingStr;
}

export function testTextDecoderCreate009() {
    let that = util.TextDecoder.create('utf-8', undefined);
    let encodingStr = that.encoding;
    return encodingStr;
}

export function testTextDecoderCreate011() {
    let that = util.TextDecoder.create(null);
    let encodingStr = that.encoding;
    return encodingStr;
}

export function testTextDecoderCreate012() {
    let that = util.TextDecoder.create('utf-8', null);
    let encodingStr = that.encoding;
    return encodingStr;
}

export function testTextDecoderCreateThrowError001() {
    try {
        let that = util.TextDecoder.create(123, { ignoreBOM: false })
        let encodingStr = that.encoding
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function testTextDecoderCreateThrowError002() {
    try {
        let that = util.TextDecoder.create('utf-16be', 'ignoreBOM')
        let encodingStr = that.encoding
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function testTextDecoderCreateThrowError003() {
    try {
        let that = util.TextDecoder.create('utf-16be', 123)
        let encodingStr = that.encoding
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function testWrite001() {
    let decoder = new util.StringDecoder('utf-8');
    let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
    const decoded = decoder.write(input);
    return decoded;
}

export function testWrite002() {
    let decoder = new util.StringDecoder('utf-8');
    const decoded = decoder.write("abc");
    return decoded;
}

export function testWrite003() {
    let decoder = new util.StringDecoder('big5');
    let input = new Uint8Array([167, 65, 166, 110]);
    const decoded = decoder.write(input);
    return decoded;
}

export function testWrite004() {
    let decoder = new util.StringDecoder('iso-8859-2');
    let input = new Uint8Array([0X61, 0X62, 0X63]);
    const decoded = decoder.write(input);
    return decoded;
}

export function testWrite005() {
    let decoder = new util.StringDecoder('koi8-r');
    let input = new Uint8Array([97, 98, 99]);
    const decoded = decoder.write(input);
    return decoded;
}

export function testWrite006() {
    let decoder = new util.StringDecoder('windows-1250');
    let input = new Uint8Array([0X61, 0X62, 0X63]);
    const decoded = decoder.write(input);
    return decoded;
}

export function testWrite007() {
    let stringDecoder = new util.StringDecoder('utf-8');
    let uint8 = new Uint8Array([228, 189, 160, 0, 229, 165, 189]);
    let resStr = stringDecoder.write(uint8);
    return [resStr, resStr.length];
}

export function testWrite008() {
    let stringDecoder = new util.StringDecoder('utf-8');
    let uint8 = new Uint8Array([0, 228, 189, 160, 229]);
    let retStr = stringDecoder.write(uint8);
    let uint8arr = new Uint8Array([165, 189]);
    let resStr = stringDecoder.end(uint8arr);
    return [retStr, resStr];
}

export function testWrite009() {
    let textEncoder = new util.TextEncoder('gb18030');
    let result = textEncoder.encodeInto('abc熠熠');
    let stringDecoder = new util.StringDecoder('gb18030');
    let res = stringDecoder.write(result);
    return res;
}

export function testWrite010() {
    let textEncoder = new util.TextEncoder('big5');
    let result = textEncoder.encodeInto('abc熠熠');
    let stringDecoder = new util.StringDecoder('big5');
    let res = stringDecoder.write(result);
    return res;
}

export function testWrite011() {
    let textEncoder = new util.TextEncoder('shift_jis');
    let result = textEncoder.encodeInto('こんにちは');
    let stringDecoder = new util.StringDecoder('shift_jis');
    let res = stringDecoder.write(result);
    return res;
}

export function testWrite012() {
    let textEncoder = new util.TextEncoder('iso-2022-jp');
    let result = textEncoder.encodeInto('こんにちは');
    let stringDecoder = new util.StringDecoder('iso-2022-jp');
    let res = stringDecoder.write(result);
    return res;
}

export function testWrite013() {
    let textEncoder = new util.TextEncoder('ibm866');
    let result = textEncoder.encodeInto('Здравствуйте');
    let stringDecoder = new util.StringDecoder('ibm866');
    let res = stringDecoder.write(result);
    return res;
}

export function testWrite014() {
    let textEncoder = new util.TextEncoder('GBK');
    let result = textEncoder.encodeInto('abc熠熠');
    let stringDecoder = new util.StringDecoder('GBK');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite015() {
    let textEncoder = new util.TextEncoder('GB2312');
    let result = textEncoder.encodeInto('abc熠熠');
    let stringDecoder = new util.StringDecoder('GBK');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite016() {
    let textEncoder = new util.TextEncoder('iso-8859-2');
    let result = textEncoder.encodeInto('Szia');
    let stringDecoder = new util.StringDecoder('iso-8859-2');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite017() {
    let textEncoder = new util.TextEncoder('iso-8859-4');
    let result = textEncoder.encodeInto('Tavaliselt tere päeval');
    let stringDecoder = new util.StringDecoder('iso-8859-4');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite018() {
    let textEncoder = new util.TextEncoder('iso-8859-5');
    let result = textEncoder.encodeInto('Здравствуйте');
    let stringDecoder = new util.StringDecoder('iso-8859-5');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite019() {
    let textEncoder = new util.TextEncoder('iso-8859-6');
    let result = textEncoder.encodeInto('مرحبا');
    let stringDecoder = new util.StringDecoder('iso-8859-6');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite020() {
    let textEncoder = new util.TextEncoder('iso-8859-7');
    let result = textEncoder.encodeInto('Γεια σου');
    let stringDecoder = new util.StringDecoder('iso-8859-7');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite021() {
    let textEncoder = new util.TextEncoder('iso-8859-8');
    let result = textEncoder.encodeInto('שלום');
    let stringDecoder = new util.StringDecoder('iso-8859-8');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite022() {
    let textEncoder = new util.TextEncoder('macintosh');
    let result = textEncoder.encodeInto('é£');
    let stringDecoder = new util.StringDecoder('macintosh');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite023() {
    let textEncoder = new util.TextEncoder('iso-8859-8-i');
    let result = textEncoder.encodeInto('שלום');
    let stringDecoder = new util.StringDecoder('iso-8859-8-i');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite024() {
    let textEncoder = new util.TextEncoder('iso-8859-10');
    let result = textEncoder.encodeInto('Hei');
    let stringDecoder = new util.StringDecoder('iso-8859-10');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite025() {
    let textEncoder = new util.TextEncoder('iso-8859-13');
    let result = textEncoder.encodeInto('Sveiki');
    let stringDecoder = new util.StringDecoder('iso-8859-13');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite026() {
    let textEncoder = new util.TextEncoder('iso-8859-14');
    let result = textEncoder.encodeInto('Diolch');
    let stringDecoder = new util.StringDecoder('iso-8859-14');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite027() {
    let textEncoder = new util.TextEncoder('iso-8859-15');
    let result = textEncoder.encodeInto('Hola');
    let stringDecoder = new util.StringDecoder('iso-8859-15');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite028() {
    let textEncoder = new util.TextEncoder('koi8-r');
    let result = textEncoder.encodeInto('Привет, мир!');
    let stringDecoder = new util.StringDecoder('koi8-r');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite029() {
    let textEncoder = new util.TextEncoder('koi8-u');
    let result = textEncoder.encodeInto('Привіт, світ');
    let stringDecoder = new util.StringDecoder('koi8-u');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite030() {
    let textEncoder = new util.TextEncoder();
    let buffer = new ArrayBuffer(4);
    let dest = new Uint8Array(buffer);
    textEncoder.encodeIntoUint8Array('😃', dest);
    let stringDecoder = new util.StringDecoder();
    let result = stringDecoder.write(dest);
    return result;
}

export function testWrite031() {
    let textEncoder = new util.TextEncoder();
    let buffer = new ArrayBuffer(10);
    let dest = new Uint8Array(buffer);
    textEncoder.encodeIntoUint8Array('aé中😃', dest);
    let stringDecoder = new util.StringDecoder();
    let result = stringDecoder.write(dest);
    return result;
}

export function testWrite032() {
    let textEncoder = new util.TextEncoder();
    let buffer = new ArrayBuffer(4);
    let dest = new Uint8Array(buffer);
    textEncoder.encodeIntoUint8Array('😃🤞', dest);
    let stringDecoder = new util.StringDecoder();
    let result = stringDecoder.write(dest);
    return result;
}

export function testWrite033() {
    let textEncoder = new util.TextEncoder();
    let buffer = new ArrayBuffer(8);
    let dest = new Uint8Array(buffer);
    textEncoder.encodeIntoUint8Array('😃🤞', dest);
    let stringDecoder = new util.StringDecoder();
    let result = stringDecoder.write(dest);
    return result;
}

export function testWrite034() {
    let textEncoder = new util.TextEncoder();
    let buffer = new ArrayBuffer(10);
    let dest = new Uint8Array(buffer);
    textEncoder.encodeIntoUint8Array('a😃🤞b', dest);
    let stringDecoder = new util.StringDecoder();
    let result = stringDecoder.write(dest);
    return result;
}

export function testWrite035() {
    let textEncoder = new util.TextEncoder('windows-874');
    let result = textEncoder.encodeInto('สวัสดี');
    let stringDecoder = new util.StringDecoder('windows-874');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite036() {
    let textEncoder = new util.TextEncoder('windows-1251');
    let result = textEncoder.encodeInto('Привет, мир');
    let stringDecoder = new util.StringDecoder('windows-1251');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite037() {
    let textEncoder = new util.TextEncoder('windows-1252');
    let result = textEncoder.encodeInto('Hi, World');
    let stringDecoder = new util.StringDecoder('windows-1252');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite038() {
    let textEncoder = new util.TextEncoder('windows-1253');
    let result = textEncoder.encodeInto('Γεια σας, κόσμο');
    let stringDecoder = new util.StringDecoder('windows-1253');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite039() {
    let textEncoder = new util.TextEncoder('windows-1254');
    let result = textEncoder.encodeInto('Merhaba, dünya');
    let stringDecoder = new util.StringDecoder('windows-1254');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite040() {
    let textEncoder = new util.TextEncoder('windows-1255');
    let result = textEncoder.encodeInto('שלום, עולם');
    let stringDecoder = new util.StringDecoder('windows-1255');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite041() {
    let textEncoder = new util.TextEncoder('windows-1256');
    let result = textEncoder.encodeInto('مرحبا, العالم');
    let stringDecoder = new util.StringDecoder('windows-1256');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite042() {
    let textEncoder = new util.TextEncoder('windows-1257');
    let result = textEncoder.encodeInto('Tere, maailma');
    let stringDecoder = new util.StringDecoder('windows-1257');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite043() {
    let textEncoder = new util.TextEncoder('windows-1258');
    let result = textEncoder.encodeInto('Chào');
    let stringDecoder = new util.StringDecoder('windows-1258');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite044() {
    let textEncoder = new util.TextEncoder('euc-jp');
    let result = textEncoder.encodeInto('こんにちは');
    let stringDecoder = new util.StringDecoder('euc-jp');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite045() {
    let textEncoder = new util.TextEncoder('euc-kr');
    let result = textEncoder.encodeInto('안녕, 세상');
    let stringDecoder = new util.StringDecoder('euc-kr');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite046() {
    let textEncoder = new util.TextEncoder('euc-kr');
    let result = textEncoder.encodeInto('안녕, 세상');
    let stringDecoder = new util.StringDecoder('euc-kr');
    let data = stringDecoder.write(result);
    return data;
}

export function testWrite047() {
    let textEncoder = new util.TextEncoder('x-mac-cyrillic');
    let result = textEncoder.encodeInto('Привет, мир!');
    let stringDecoder = new util.StringDecoder('x-mac-cyrillic');
    let data = stringDecoder.write(result);
    return data;
}

export function testencodeInto001() {
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let result = new Uint8Array(buffer)
    result = that.encodeInto('abc')
    return result[0];
}

export function testencodeIntoUint8Array001() {
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let dest = new Uint8Array(buffer, 0, 13)
    let result = new Uint32Array(20)
    result = that.encodeIntoUint8Array('\uD800A\uDF06A楼HiA', dest)
    return [result.read, result.written];
}

export function testencodeIntoUint8Array002() {
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(6)
    let dest = new Uint8Array(buffer)
    let result = new Object()
    result = that.encodeIntoUint8Array('abc\u2603d', dest)
    return [result.read, result.written];
}

export function testencodeIntoUint8Array003() {
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(4)
    let dest = new Uint8Array(buffer)
    let result = new Object()
    result = that.encodeIntoUint8Array('abcd', dest)
    return [result.read, result.written];
}

export function testencodeIntoUint8Array004() {
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(4)
    let dest = new Uint8Array(buffer)
    let result = new Object()
    result = that.encodeIntoUint8Array('12345', dest)
    return [result.read, result.written];
}

export function testencodeIntoUint8Array005() {
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(4)
    let dest = new Uint8Array(buffer)
    let result = new Object()
    result = that.encodeIntoUint8Array('123 4*!@#', dest)
    return [result.read, result.written];
}

export function testencodeIntoUint8Array006() {
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(4)
    let dest = new Uint8Array(buffer)
    let result = new Object()
    result = that.encodeIntoUint8Array('', dest)
    return [result.read, result.written];
}

export function testencodeIntoUint8Array007() {
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let dest = new Uint8Array(buffer)
    let result = new Uint32Array(20)
    result = that.encodeIntoUint8Array('12ab', dest)
    return [result.read, result.written];
}

export function testencodeIntoUint8Array008() {
    let that = new util.TextEncoder()
    let buffer = new ArrayBuffer(20)
    let dest = new Uint8Array(buffer, 0, 0)
    let result = new Uint32Array(20)
    result = that.encodeIntoUint8Array('\uD800A\uDF06A楼HiA', dest)
    return [result.read, result.written];
}

export function testencodeIntoUint8Array009() {
    let that = new util.TextEncoder('big5')
    let buffer = new ArrayBuffer(20)
    let dest = new Uint8Array(buffer, 0, 10)
    let result = new Uint32Array(20)
    result = that.encodeIntoUint8Array('\uD800A\uDF06A楼HiA', dest)
    return [result.read, result.written];
}

export function testencodeIntoUint8Array010() {
    let that = new util.TextEncoder('shift_jis')
    let buffer = new ArrayBuffer(20)
    let dest = new Uint8Array(buffer, 0, 5)
    let result = new Uint32Array(20)
    result = that.encodeIntoUint8Array('\uD800A\uDF06A楼HiA', dest)
    return [result.read, result.written];
}

export function testencodeIntoUint8Array011() {
    let that = new util.TextEncoder('iso-2022-jp')
    let buffer = new ArrayBuffer(20)
    let dest = new Uint8Array(buffer, 0, 7)
    let result = new Uint32Array(20)
    result = that.encodeIntoUint8Array('\uD800A\uDF06A楼HiA', dest)
    return [result.read, result.written];
}

export function testencodeIntoUint8Array012() {
    let that = new util.TextEncoder('ibm866')
    let buffer = new ArrayBuffer(20)
    let dest = new Uint8Array(buffer, 0, 4)
    let result = new Uint32Array(20)
    result = that.encodeIntoUint8Array('\uD800A\uDF06A楼HiA', dest)
    return [result.read, result.written];
}

export function testencodeIntoUint8Array013() {
    let that = new util.TextEncoder('macintosh')
    let buffer = new ArrayBuffer(20)
    let dest = new Uint8Array(buffer, 0, 10)
    let result = new Uint32Array(20)
    result = that.encodeIntoUint8Array('\uD800A\uDF06A楼HiA', dest)
    return [result.read, result.written];
}

