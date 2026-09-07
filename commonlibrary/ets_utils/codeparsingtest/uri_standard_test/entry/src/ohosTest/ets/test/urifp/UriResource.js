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
import uri from '@ohos.uri';

export function testUriConstruction002() {
    try {
        let a = { name: 'gaogao' };
        new uri.URI(a);
        return "";
    } catch (err) {
        return err.toString() + "|||" + err.code + "|||" + err.message;
    }
}

export function testEqualsTo006() {
    try {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = 666;
        gaogao.equalsTo(gaogao1);
        return "";
    } catch (err) {
        return err.toString() + "|||" + err.code + "|||" + err.message;
    }
}

export function testEqualsTo007() {
    try {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = { "0": "1" };
        gaogao.equalsTo(gaogao1);
        return "";
    } catch (err) {
        return err.toString() + "|||" + err.code + "|||" + err.message;
    }
}

export function testCreateFromPartsPara001() {
    try {
        uri.URI.createFromParts(1, "ssp", "fragment");
        return "";
    } catch (err) {
        return err.toString() + "|||" + err.code + "|||" + err.message;
    }
}

export function testCreateFromPartsPara002() {
    try {
        uri.URI.createFromParts("aaa", 1, "fragment");
        return "";
    } catch (err) {
        return err.toString() + "|||" + err.code + "|||" + err.message;
    }
}

export function testCreateFromPartsPara003() {
    try {
        uri.URI.createFromParts("aaa", "bbb", 1);
        return "";
    } catch (err) {
        return err.toString() + "|||" + err.code + "|||" + err.message;
    }
}

export function testAddQueryValuePara001() {
    try {
        let route = new uri.URI('https://www.test.com');
        route.addQueryValue(1, "value 1");
        return "";
    } catch (err) {
        return err.toString() + "|||" + err.code + "|||" + err.message;
    }
}

export function testAddQueryValuePara002() {
    try {
        let route = new uri.URI('https://www.test.com');
        route.addQueryValue("1", 1);
        return "";
    } catch (err) {
        return err.toString() + "|||" + err.code + "|||" + err.message;
    }
}

export function testAddEncodedSegmentPara001() {
    try {
        let route = new uri.URI('https://www.test.com');
        route.addEncodedSegment(1);
        return "";
    } catch (err) {
        return err.toString() + "|||" + err.code + "|||" + err.message;
    }
}

export function testAddSegmentPara001() {
    try {
        let route = new uri.URI('https://www.test.com');
        route.addSegment(1);
        return "";
    } catch (err) {
        return err.toString() + "|||" + err.code + "|||" + err.message;
    }
}

export function testGetQueryValuePara001() {
    try {
        let route1 = new uri.URI('https://www.test.com?param_g=value_1');
        route1.getQueryValue(2);
        return "";
    } catch (err) {
        return err.toString() + "|||" + err.code + "|||" + err.message;
    }
}

export function testGetQueryValuesPara001() {
    try {
        let route1 = new uri.URI('https://www.test.com?param_g=value_1');
        route1.getQueryValues(2);
        return "";
    } catch (err) {
        return err.toString() + "|||" + err.code + "|||" + err.message;
    }
}

export function testGetBooleanQueryValuePara001() {
    try {
        let route1 = new uri.URI('https://www.test.com?param_g=value_1');
        route1.getBooleanQueryValue(2, true);
        return "";
    } catch (err) {
        return err.toString() + "|||" + err.code + "|||" + err.message;
    }
}

export function testGetBooleanQueryValuePara002() {
    try {
        let route1 = new uri.URI('https://www.test.com?param_g=value_1');
        route1.getBooleanQueryValue("param_g", 2);
        return "";
    } catch (err) {
        return err.toString() + "|||" + err.code + "|||" + err.message;
    }
}
