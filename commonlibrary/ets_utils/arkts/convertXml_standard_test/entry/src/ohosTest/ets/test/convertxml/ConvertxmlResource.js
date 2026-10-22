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
import convertxml from '@ohos.convertxml';

function getDefaultOptions() {
    return {
        trim: false,
        declarationKey: "_declaration",
        instructionKey: "_instruction",
        attributesKey: "_attributes",
        textKey: "_text",
        cdataKey: "_cdata",
        doctypeKey: "_doctype",
        commentKey: "_comment",
        parentKey: "_parent",
        typeKey: "_type",
        nameKey: "_name",
        elementsKey: "_elements"
    };
}

export function testConvert028() {
    let xml = '<?xml version="1.0" encoding="utf-8"?><![CDATA[ \t <foo>\r\n</bar> \t ]]>';
    let conv = new convertxml.ConvertXML();
    let options = getDefaultOptions();
    let result = conv.convertToJSObject(xml, options);
    return result._elements[0]._cdata;
}

export function testConvert029() {
    let xml = '<?xml version="1.0" encoding="utf-8"?><![CDATA[ \t data\n]]><![CDATA[< > " and & \t ]]>';
    let conv = new convertxml.ConvertXML();
    let options = getDefaultOptions();
    let result = conv.convertToJSObject(xml, options);
    let cdata0 = result._elements[0]._cdata;
    let cdata1 = result._elements[1]._cdata;
    return JSON.stringify([cdata0, cdata1]);
}

export function testConvert041() {
    let xml = '<?xml version="1.0" encoding="utf-8"?><![CDATA[\nHello\\n World\\\n \tHello\\t World\\\t]]>';
    let conv = new convertxml.ConvertXML();
    let result = conv.convertToJSObject(xml);
    return result._elements[0]._cdata;
}

export function testBusinessError001() {
    let conv = new convertxml.ConvertXML();
    let options = getDefaultOptions();
    try {
        conv.convertToJSObject(123, options);
        return "";
    } catch (e) {
        return e.toString();
    }
}

export function testBusinessError002() {
    let xml = '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '    <title>Happy</title>' +
        '    <todo>Work</todo>' +
        '    <todo>Play</todo>' +
        '</note>';
    let conv = new convertxml.ConvertXML();
    let options = 123;
    try {
        conv.convertToJSObject(xml, options);
        return "";
    } catch (e) {
        return e.toString();
    }
}

export function testBusinessError003() {
    let conv = new convertxml.ConvertXML();
    try {
        conv.convertToJSObject(111, 123);
        return "";
    } catch (e) {
        return e.toString();
    }
}

export function testConvert056() {
    let strXml = '<?xml version="1.0" encoding="utf-8"?><![CDATA[ \t <foo>\r\n</bar> \t ]]>';
    let conv = new convertxml.ConvertXML();
    let options = getDefaultOptions();
    let result = conv.fastConvertToJSObject(strXml, options);
    return result._elements[0]._cdata;
}

export function testConvert064() {
    let strXml = '<?xml version="1.0" encoding="utf-8"?><![CDATA[\nHello\\n World\\\n \tHello\\t World\\\t]]>';
    let conv = new convertxml.ConvertXML();
    let result = conv.fastConvertToJSObject(strXml);
    return result._elements[0]._cdata;
}
