/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import url from '@ohos.url';
let Url = url;


export function testParamsAppend006() {
    let results = [];
    try {
    let that = new Url.URL('https://example.com?foo=1&bar=2')
    let params = new Url.URLParams(that.search)
    params.append(123,"456")
    } catch (err) {
    results.push(err.toString());
    results.push(err.code);
    results.push(err.message);
    }
    return results.join('\x00');
}

export function testParamsDelete006() {
    let results = [];
    try {
    let that = new Url.URL('https://example.com?foo=1&bar=2');
    let params = new Url.URLParams(that.search);
    params.delete();
    } catch (err) {
    results.push(err.code);
    }
    return results.join('\x00');
}

export function testParamsDelete007() {
    let results = [];
    try {
    let that = new Url.URL('https://example.com?foo=1&bar=2');
    let params = new Url.URLParams(that.search);
    params.delete(4);
    } catch (err) {
    results.push(err.toString());
    results.push(err.code);
    results.push(err.message);
    }
    return results.join('\x00');
}

export function testNewURLParams001() {
    let results = [];
    let params = new Url.URLParams(undefined);
    let result = params.toString();
    results.push(result);
    let params1 = new Url.URLParams(null);
    let result1 = params1.toString();
    results.push(result1);
    return results.join('\x00');
}

export function testParamsEntries001() {
    let results = [];
    let params = new Url.URLParams("key1=value1&key2=value2");
    let i=0;
    let arr={};
    for(let pair of params.entries()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[1]);
    return results.join('\x00');
}

export function testParamsEntries002() {
    let results = [];
    let params = new Url.URLParams("key1=value1&key2=value2")
    let i=0;
    let arr={};
    for(let pair of params.entries()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[2]);
    return results.join('\x00');
}

export function testParamsEntries003() {
    let results = [];
    let params = new Url.URLParams("key1=value1&key2=value2")
    params.append("foo","jk")
    let i=0;
    let arr={};
    for(let pair of params.entries()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[5]);
    return results.join('\x00');
}

export function testParamsEntries004() {
    let results = [];
    let params = new Url.URLParams("key1=value1&key2=value2")
    let i=0;
    let arr={};
    for(let pair of params.entries()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[3]);
    return results.join('\x00');
}

export function testParamsEntries005() {
    let results = [];
    let params = new Url.URLParams("key1=value1&key2=value2")
    params.append("jss","txt")
    let i=0;
    let arr={};
    for(let pair of params.entries()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[4]);
    return results.join('\x00');
}

export function testParamsSymboliterator001() {
    let results = [];
    let params = new Url.URLParams("key1=value1&key2=value2");
    let i=0;
    let arr={};
    for(let pair of params[Symbol.iterator]()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[1]);
    return results.join('\x00');
}

export function testParams002() {
    let results = [];
    let params = new Url.URLParams("key1=value1&key2=value2")
    let i=0;
    let arr={};
    for(let pair of params[Symbol.iterator]()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[2]);
    return results.join('\x00');
}

export function testParamsSymbolIterator003() {
    let results = [];
    let params = new Url.URLParams("key1=value1&key2=value2")
    params.append("foo","jk")
    let i=0;
    let arr={};
    for(let pair of params[Symbol.iterator]()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[5]);
    return results.join('\x00');
}

export function testParams004() {
    let results = [];
    let params = new Url.URLParams("key1=value1&key2=value2")
    let i=0;
    let arr={};
    for(let pair of params[Symbol.iterator]()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[3]);
    return results.join('\x00');
}

export function testParams005() {
    let results = [];
    let params = new Url.URLParams("key1=value1&key2=value2")
    params.append("jss","txt")
    let i=0;
    let arr={};
    for(let pair of params[Symbol.iterator]()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[4]);
    return results.join('\x00');
}

export function testParamsForEach001() {
    let results = [];
    let params = new Url.URLParams("key1=value1&key2=value2")
    let arr={};
    let i = 0;
    function func(value, key, SearchParams)
    {
    arr[i] = value + " " + key + " " + (params === SearchParams)
    i++
    }
    params.forEach(func);
    results.push(arr[0]);
    return results.join('\x00');
}

export function testParamsForEach002() {
    let results = [];
    let params = new Url.URLParams("key1=value1&key2=value2");
    let arr={};
    let i = 0;
    function func(value, key, SearchParams)
    {
    arr[i] = value + " " + key + " " + (params === SearchParams)
    i++
    }
    params.forEach(func);
    results.push(arr[1]);
    return results.join('\x00');
}

export function testParamsForEach003() {
    let results = [];
    let params = new Url.URLParams("key1=value1&key2=value2");
    params.append("foo","jk");
    let arr={};
    let i = 0;
    function func(value, key, SearchParams)
    {
    arr[i] = value + " " + key + " " + (params === SearchParams)
    i++
    }
    params.forEach(func);
    results.push(arr[2]);
    return results.join('\x00');
}

export function testParamsForEach004() {
    let results = [];
    let params = new Url.URLParams("foo=bar&jss=txt");
    let arr={};
    let i = 0;
    function func(value, key, SearchParams)
    {
    arr[i] = value + " " + key + " " + (params === SearchParams)
    i++
    }
    params.forEach(func);
    results.push(arr[1]);
    return results.join('\x00');
}

export function testParamsForEach005() {
    let results = [];
    let params = new Url.URLParams("foo=bar&jss=txt");
    params.append("foo","jk");
    let arr={};
    let i = 0;
    function func(value, key, SearchParams)
    {
    arr[i] = value + " " + key + " " + (params === SearchParams)
    i++
    }
    params.forEach(func);
    results.push(arr[0]);
    return results.join('\x00');
}

export function testParamsForEach006() {
    let results = [];
    try {
    let params = new Url.URLParams("foo=bar&jss=txt");
    let arr={};
    let i = 0;
    let func = [0, 2, 4, 6, 8];
    params.forEach(func);
    } catch(err) {
    results.push(err.code);
    }
    return results.join('\x00');
}

export function testParamsForEach007() {
    let results = [];
    let params = new Url.URLParams("key1=value1&key2=value2")
    let arr = {};
    let i = 0;
    function func(value, key, SearchParams)
    {
    arr[i] = value + " " + key + " " + (params === SearchParams)
    i++
    }
    params.forEach(func, undefined);
    results.push(arr[0]);
    arr = {};
    i = 0;
    params.forEach(func, null);
    results.push(arr[0]);
    return results.join('\x00');
}

export function testParamsGet006() {
    let results = [];
    try{
    let params = new Url.URLParams("key1=value1&key2=value2")
    params.append("jss","JL")
    let a = 666;
    let result =  params.get(a)
    }catch(err){
    results.push(err.code);
    }
    return results.join('\x00');
}

export function testParamsGetAll006() {
    let results = [];
    try {
    let params = new Url.URLParams("key1=value1&key2=value2&key3=大")
    params.append("key3","A3A")
    let b = 666;
    let result =  params.getAll(b)
    } catch(err) {
    results.push(err.code);
    }
    return results.join('\x00');
}

export function testParamsHas006() {
    let results = [];
    let params = new Url.URLParams("小=value1&￥=value2&key3=大")
    try {
    let a = 1;
    params.has(a);
    } catch(e) {
    results.push(e.code);
    }
    return results.join('\x00');
}

export function testParamsKeys001() {
    let results = [];
    let params = new Url.URLParams("小=value1&￥=value2&key3=大");
    let arr={};
    let i = 0;
    for(let key of params.keys()) {
    arr[i] = key
    i++
    }
    results.push(arr[0]);
    return results.join('\x00');
}

export function testParamsKeys002() {
    let results = [];
    let params = new Url.URLParams("小=value1&￥=value2&key3=大");
    let arr={};
    let i = 0;
    for(let key of params.keys()) {
    arr[i] = key
    i++
    }
    results.push(arr[1]);
    return results.join('\x00');
}

export function testParamsKeys003() {
    let results = [];
    let params = new Url.URLParams("小=value1&￥=value2&key3=大");
    let arr={};
    let i = 0;
    for(let key of params.keys()) {
    arr[i] = key
    i++
    }
    results.push(arr[2]);
    return results.join('\x00');
}

export function testParamsKeys004() {
    let results = [];
    let params = new Url.URLParams("小=value1&￥=value2&key3=大&key4=六");
    let arr={};
    let i = 0;
    for(let key of params.keys()) {
    arr[i] = key
    i++
    }
    results.push(arr[3]);
    return results.join('\x00');
}

export function testParamsKeys005() {
    let results = [];
    let params = new Url.URLParams("小=value1&￥=value2&key3=大&key4=六&key5=发");
    let arr={};
    let i = 0;
    for(let key of params.keys()) {
    arr[i] = key
    i++
    }
    results.push(arr[4]);
    return results.join('\x00');
}

export function testParamsSet007() {
    let results = [];
    try {
    let params = new Url.URLParams("1=value1&2=value2&key3=3");
    let a = 12;
    params.set(a,'BBB');
    let res = params.toString();
    } catch(err) {
    results.push(err.code);
    }
    return results.join('\x00');
}

export function testParamsValues001() {
    let results = [];
    let params = new Url.URLParams("d=value1&c=value2&b=大")
    let arr={}
    let i = 0
    for(let value  of params.values()) {
    arr[i] = value
    i++
    }
    results.push(arr[0]);
    return results.join('\x00');
}

export function testParamsValues002() {
    let results = [];
    let params = new Url.URLParams("d=value1&c=value2&b=大")
    let arr={}
    let i = 0
    for(let value  of params.values()) {
    arr[i] = value
    i++
    }
    results.push(arr[1]);
    return results.join('\x00');
}

export function testParamsValues003() {
    let results = [];
    let params = new Url.URLParams("d=value1&c=value2&b=大")
    params.append("a","ACA")
    let arr={}
    let i = 0
    for(let value  of params.values()) {
    arr[i] = value
    i++
    }
    results.push(arr[3]);
    return results.join('\x00');
}

export function testParamsValues004() {
    let results = [];
    let params = new Url.URLParams("d=value1&c=value2&b=大&4=key4")
    let arr={}
    let i = 0
    for(let value  of params.values()) {
    arr[i] = value
    i++
    }
    results.push(arr[3]);
    return results.join('\x00');
}

export function testParamsValues005() {
    let results = [];
    let params = new Url.URLParams("d=value1&c=value2&b=大&4=key4&5=key5")
    let arr={}
    let i = 0
    for(let value  of params.values()) {
    arr[i] = value
    i++
    }
    results.push(arr[4]);
    return results.join('\x00');
}

export function testParamsConstruction002() {
    let results = [];
    let params = new Url.URLParams({
    user: 'abc',
    query: ['first', 'second']
    });
    let result= params.toString()
    results.push(result);
    return results.join('\x00');
}

export function testParamsConstruction004() {
    let results = [];
    const map = new Map();
    map.set('user', 'abc');
    map.set('query', 'xyz');
    let params = new Url.URLParams(map)
    let result= params.toString()
    results.push(result);
    return results.join('\x00');
}

export function testParamsConstruction005() {
    let results = [];
    function* getQueryPairs() {
    yield ['user', 'abc'];
    yield ['query', 'first'];
    yield ['query', 'second'];
    }
    let params = new Url.URLParams(getQueryPairs());
    let result= params.toString()
    results.push(result);
    return results.join('\x00');
}

export function testParamsConstruction007() {
    let results = [];
    let param
    let params = new Url.URLParams(param)
    params.append('abcde','fghki')
    let paramsResult = params.toString()
    results.push(paramsResult);
    return results.join('\x00');
}

export function testParamsConstruction008() {
    let results = [];
    try {
    let param = 123456789;
    let params = new Url.URLParams(param)
    } catch(err) {
    results.push(err.code);
    }
    return results.join('\x00');
}

export function testNewURLSearchParams001() {
    let results = [];
    let params = new Url.URLSearchParams(undefined);
    let result = params.toString()
    results.push(result);
    let params1 = new Url.URLSearchParams(null);
    let result2 = params1.toString()
    results.push(result2);
    return results.join('\x00');
}

export function testUrlAppend006() {
    let results = [];
    let that = new Url.URL('https://example.com?foo=1&bar=2')
    let params = new Url.URLSearchParams(that.search)
    try {
    let a = 1;
    params.append(a, "123")
    } catch(e) {
    results.push(e.code);
    }
    return results.join('\x00');
}

export function testUrlEntries001() {
    let results = [];
    let params = new Url.URLSearchParams("key1=value1&key2=value2");
    let i=0;
    let arr={};
    for(let pair of params.entries()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[1]);
    return results.join('\x00');
}

export function testUrlEntries002() {
    let results = [];
    let params = new Url.URLSearchParams("key1=value1&key2=value2")
    let i=0;
    let arr={};
    for(let pair of params.entries()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[2]);
    return results.join('\x00');
}

export function testUrlEntries003() {
    let results = [];
    let params = new Url.URLSearchParams("key1=value1&key2=value2")
    params.append("foo","jk")
    let i=0;
    let arr={};
    for(let pair of params.entries()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[5]);
    return results.join('\x00');
}

export function testUrlEntries004() {
    let results = [];
    let params = new Url.URLSearchParams("key1=value1&key2=value2")
    let i=0;
    let arr={};
    for(let pair of params.entries()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[3]);
    return results.join('\x00');
}

export function testUrlEntries005() {
    let results = [];
    let params = new Url.URLSearchParams("key1=value1&key2=value2")
    params.append("jss","txt")
    let i=0;
    let arr={};
    for(let pair of params.entries()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[4]);
    return results.join('\x00');
}

export function testUrlSymboliterator001Adapt001() {
    let results = [];
    let params = new Url.URLSearchParams("key1=value1&key2=value2");
    let i=0;
    let arr={};
    for(let pair of params[Symbol.iterator]()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[1]);
    return results.join('\x00');
}

export function testUrlSymboliterator002Adapt001() {
    let results = [];
    let params = new Url.URLSearchParams("key1=value1&key2=value2")
    let i=0;
    let arr={};
    for(let pair of params[Symbol.iterator]()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[2]);
    return results.join('\x00');
}

export function testUrlSymboliterator003Adapt001() {
    let results = [];
    let params = new Url.URLSearchParams("key1=value1&key2=value2")
    params.append("foo","jk")
    let i=0;
    let arr={};
    for(let pair of params[Symbol.iterator]()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[5]);
    return results.join('\x00');
}

export function testUrlSymboliterator004Adapt001() {
    let results = [];
    let params = new Url.URLSearchParams("key1=value1&key2=value2")
    let i=0;
    let arr={};
    for(let pair of params[Symbol.iterator]()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[3]);
    return results.join('\x00');
}

export function testUrlSymboliterator005Adapt001() {
    let results = [];
    let params = new Url.URLSearchParams("key1=value1&key2=value2")
    params.append("jss","txt")
    let i=0;
    let arr={};
    for(let pair of params[Symbol.iterator]()) {
    arr[i]=pair[0];
    i++;
    arr[i]=pair[1];
    i++;
    }
    results.push(arr[4]);
    return results.join('\x00');
}

export function testUrlForEach001() {
    let results = [];
    let params = new Url.URLSearchParams("key1=value1&key2=value2")
    let arr={};
    let i = 0;
    function func(value, key, SearchParams)
    {
    arr[i] = value + " " + key + " " + (params === SearchParams)
    i++
    }
    params.forEach(func);
    results.push(arr[0]);
    return results.join('\x00');
}

export function testUrlForEach002() {
    let results = [];
    let params = new Url.URLSearchParams("key1=value1&key2=value2");
    let arr={};
    let i = 0;
    function func(value, key, SearchParams)
    {
    arr[i] = value + " " + key + " " + (params === SearchParams)
    i++
    }
    params.forEach(func);
    results.push(arr[1]);
    return results.join('\x00');
}

export function testUrlForEach003() {
    let results = [];
    let params = new Url.URLSearchParams("key1=value1&key2=value2");
    params.append("foo","jk");
    let arr={};
    let i = 0;
    function func(value, key, SearchParams)
    {
    arr[i] = value + " " + key + " " + (params === SearchParams)
    i++
    }
    params.forEach(func);
    results.push(arr[2]);
    return results.join('\x00');
}

export function testUrlForEach004() {
    let results = [];
    let params = new Url.URLSearchParams("foo=bar&jss=txt");
    let arr={};
    let i = 0;
    function func(value, key, SearchParams)
    {
    arr[i] = value + " " + key + " " + (params === SearchParams)
    i++
    }
    params.forEach(func);
    results.push(arr[1]);
    return results.join('\x00');
}

export function testUrlForEach005() {
    let results = [];
    let params = new Url.URLSearchParams("foo=bar&jss=txt");
    params.append("foo","jk");
    let arr={};
    let i = 0;
    function func(value, key, SearchParams)
    {
    arr[i] = value + " " + key + " " + (params === SearchParams)
    i++
    }
    params.forEach(func);
    results.push(arr[0]);
    return results.join('\x00');
}

export function testUrlForEach006() {
    let results = [];
    let params = new Url.URLSearchParams("key1=value1&key2=value2")
    let arr = {};
    let i = 0;
    function func(value, key, SearchParams)
    {
    arr[i] = value + " " + key + " " + (params === SearchParams)
    i++
    }
    params.forEach(func, undefined);
    results.push(arr[0]);
    arr = {}
    i = 0;
    params.forEach(func, null);
    results.push(arr[0]);
    return results.join('\x00');
}

export function testUrlHas006() {
    let results = [];
    let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大")
    params.append("￥","ACA")
    try {
    let a = 1;
    params.has(a);
    } catch(e) {
    results.push(e.code);
    }
    return results.join('\x00');
}

export function testUrlKeys001() {
    let results = [];
    let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大");
    let arr={};
    let i = 0;
    for(let key of params.keys()) {
    arr[i] = key
    i++
    }
    results.push(arr[0]);
    return results.join('\x00');
}

export function testUrlKeys002() {
    let results = [];
    let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大");
    let arr={};
    let i = 0;
    for(let key of params.keys()) {
    arr[i] = key
    i++
    }
    results.push(arr[1]);
    return results.join('\x00');
}

export function testUrlKeys003() {
    let results = [];
    let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大");
    let arr={};
    let i = 0;
    for(let key of params.keys()) {
    arr[i] = key
    i++
    }
    results.push(arr[2]);
    return results.join('\x00');
}

export function testUrlKeys004() {
    let results = [];
    let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大&key4=六");
    let arr={};
    let i = 0;
    for(let key of params.keys()) {
    arr[i] = key
    i++
    }
    results.push(arr[3]);
    return results.join('\x00');
}

export function testUrlKeys005() {
    let results = [];
    let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大&key4=六&key5=发");
    let arr={};
    let i = 0;
    for(let key of params.keys()) {
    arr[i] = key
    i++
    }
    results.push(arr[4]);
    return results.join('\x00');
}

export function testUrlSet006() {
    let results = [];
    try {
    let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
    let a = 12;
    params.set(a, 'BBB');
    } catch(err) {
    results.push(err.code);
    }
    return results.join('\x00');
}

export function testUrlValues001() {
    let results = [];
    let params = new Url.URLSearchParams("d=value1&c=value2&b=大")
    let arr={}
    let i = 0
    for(let value  of params.values()) {
    arr[i] = value
    i++
    }
    results.push(arr[0]);
    return results.join('\x00');
}

export function testUrlValues002() {
    let results = [];
    let params = new Url.URLSearchParams("d=value1&c=value2&b=大")
    let arr={}
    let i = 0
    for(let value  of params.values()) {
    arr[i] = value
    i++
    }
    results.push(arr[1]);
    return results.join('\x00');
}

export function testUrlValues003() {
    let results = [];
    let params = new Url.URLSearchParams("d=value1&c=value2&b=大")
    params.append("a","ACA")
    let arr={}
    let i = 0
    for(let value  of params.values()) {
    arr[i] = value
    i++
    }
    results.push(arr[3]);
    return results.join('\x00');
}

export function testUrlValues004() {
    let results = [];
    let params = new Url.URLSearchParams("d=value1&c=value2&b=大&4=key4")
    let arr={}
    let i = 0
    for(let value  of params.values()) {
    arr[i] = value
    i++
    }
    results.push(arr[3]);
    return results.join('\x00');
}

export function testUrlValues005() {
    let results = [];
    let params = new Url.URLSearchParams("d=value1&c=value2&b=大&4=key4&5=key5")
    let arr={}
    let i = 0
    for(let value  of params.values()) {
    arr[i] = value
    i++
    }
    results.push(arr[4]);
    return results.join('\x00');
}

export function testUrlSearchParamsConstruction002() {
    let results = [];
    let params = new Url.URLSearchParams({
    user: 'abc',
    query: ['first', 'second']
    });
    let result= params.toString()
    results.push(result);
    return results.join('\x00');
}

export function testUrlSearchParamsConstruction004() {
    let results = [];
    const map = new Map();
    map.set('user', 'abc');
    map.set('query', 'xyz');
    let params = new Url.URLSearchParams(map)
    let result= params.toString()
    results.push(result);
    return results.join('\x00');
}

export function testUrlSearchParamsConstruction005() {
    let results = [];
    function* getQueryPairs() {
    yield ['user', 'abc'];
    yield ['query', 'first'];
    yield ['query', 'second'];
    }
    let params = new Url.URLSearchParams(getQueryPairs());
    let result= params.toString()
    results.push(result);
    return results.join('\x00');
}

export function testUrlSearchParamsConstruction007() {
    let results = [];
    let param
    let params = new Url.URLSearchParams(param)
    params.append('abcde','fghki')
    let paramsResult = params.toString()
    results.push(paramsResult);
    return results.join('\x00');
}

export function testNewUrl001() {
    let results = [];
    let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment', undefined)
    let result = params.toString()
    results.push(result);
    let params1 = new Url.URL('http://username:password@host:8080/directory/file?query#fragment', null)
    let result2 = params1.toString()
    results.push(result2);
    return results.join('\x00');
}

export function testUrlparseURL008() {
    let results = [];
    try{
    let params = new Url.URL()
    expect(params != null).assertTrue()
    let a = 666;
    let b = 666;
    Url.URL.parseURL(a, b)
    } catch(err) {
    results.push(err.code);
    }
    return results.join('\x00');
}

export function testUrlparseURL009() {
    let results = [];
    try{
    let params = new Url.URL()
    expect(params != null).assertTrue()
    let a = '666666';
    let b = 666666;
    Url.URL.parseURL(a, b)
    } catch(err) {
    results.push(err.code);
    }
    return results.join('\x00');
}

export function testUrlparseURL0034() {
    let results = [];
    let strUrl = '?newsId=HB-1-snhs/index_v2-search&urlInfo=%7B%22hot_topic%22%3A%221%22%2C%22keyword%22%3A%22' +
    '%25E6%2598%25A5%25E8%2589%25B2%25E5%25AF%2584%25E6%2583%2585%25E4%25BA%25BA%2520%25E4%25BD%2595%25E5' +
    '%258F%2594%25E5%258E%25BB%25E4%25B8%2596%22%2C%22query_class%22%3A%22%25E6%2583%2585%25E6%2584%259F' +
    '%22%2C%22query_id%22%3A%227VZkV%22%2C%22query_rank%22%3A%2227%22%2C%22query_resultVersion%22%3A%220' +
    '%22%2C%22query_wordType%22%3A%22harmony%22%2C%22searchFrom%22%3A%22hot_topic%22%7D';
    let urlObj = new Url.URLParams(strUrl);
    let value1 = 'HB-1-snhs/index_v2-search';
    let value2 = '{"hot_topic":"1","keyword":"%E6%98%A5%E8%89%B2%E5%AF%84%E6%83%85%E4%BA%BA%20%E4%BD%95%E5%8F' +
    '%94%E5%8E%BB%E4%B8%96","query_class":"%E6%83%85%E6%84%9F","query_id":"7VZkV","query_rank":"27",' +
    '"query_resultVersion":"0","query_wordType":"harmony","searchFrom":"hot_topic"}'
    let a = urlObj.values();
    results.push(a[0]);
    results.push(a[1]);
    return results.join('\x00');
}

export function testUrlparseURL0041() {
    let results = [];
    const u2 = Url.URL.parseURL(`https://a.cn?phone=%2B86`)
    const phone2 = u2.params.get('phone')
    results.push(u2.params.toString());
    results.push(phone2.toString());
    return results.join('\x00');
}

export function testUrlparseURL0042() {
    let results = [];
    const u2 = Url.URL.parseURL(`https://a.cn?phone=%2B86+9`)
    const phone2 = u2.params.get('phone')
    results.push(u2.params.toString());
    results.push(phone2.toString());
    return results.join('\x00');
}
