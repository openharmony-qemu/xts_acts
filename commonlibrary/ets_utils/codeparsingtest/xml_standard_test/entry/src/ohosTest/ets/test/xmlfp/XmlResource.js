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
import xml from '@ohos.xml';
import util from '@ohos.util';

export function testParse002() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<!DOCTYPE note [\n<!ENTITY foo "baa">]>' +
            '<note importance="high" logged="true">' +
            '    <![CDATA[\r\nfuncrion matchwo(a,6)\r\n{\r\nreturn 1;\r\n}\r\n]]>' +
            '    <!--Hello, World!-->' +
            '    <company>John &amp; Hans</company>' +
            '    <title>Happy</title>' +
            '    <title>Happy</title>' +
            '    <lens>Work</lens>' +
            '    <lens>Play</lens>' +
            '    <?go there?>' +
            '    <a><b/></a>' +
            '    <h:table xmlns:h="http://www.w3.org/TR/html4/">' +
            '        <h:tr>' +
            '            <h:td>Apples</h:td>' +
            '            <h:td>Bananas</h:td>' +
            '        </h:tr>' +
            '    </h:table>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer);
    let str1 = '';

    function func1(name, value) {
        str1 += name + value + ' ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func1 }
    that.parse(options);
    return str1;
}
export function testParse003() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer);
    let str = "";

    function func(key, value) {
        str += 'key:' + key + ' value:' + value.getColumnNumber() + '  ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    that.parse(options);
    return str;
}
export function testParse004() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer);
    let str = "";

    function func(key, value) {
        str += 'key:' + key + ' value:' + value.getDepth() + '  ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    that.parse(options);
    return str;
}
export function testParse005() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer);
    let str = "";

    function func(key, value) {
        str += 'key:' + key + ' value:' + value.getLineNumber() + '  ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    that.parse(options);
    return str;
}
export function testParse006() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer);
    let str = "";

    function func(key, value) {
        str += 'key:' + key + ' value:' + value.getName() + '  ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    that.parse(options);
    return str;
}
export function testParse007() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer);
    let str = "";

    function func(key, value) {
        str += 'key:' + key + ' value:' + value.getNamespace() + '  ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    that.parse(options);
    return str;
}
export function testParse008() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer);
    let str = "";

    function func(key, value) {
        str += 'key:' + key + ' value:' + value.getPrefix() + '  ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    that.parse(options);
    return str;
}
export function testParse009() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer);
    let str = "";

    function func(key, value) {
        str += 'key:' + key + ' value:' + value.getText() + '  ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    that.parse(options);
    return str;
}
export function testParse010() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer);
    let str = "";

    function func(key, value) {
        str += 'key:' + key + ' value:' + value.isEmptyElementTag() + '  ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    that.parse(options);
    return str;
}
export function testParse011() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer);
    let str = "";

    function func(key, value) {
        str += 'key:' + key + ' value:' + value.isWhitespace() + '  ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    that.parse(options);
    return str;
}
export function testParse012() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer);
    let str = "";

    function func(key, value) {
        str += 'key:' + key + ' value:' + value.getAttributeCount() + '  ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    that.parse(options);
    return str;
}
export function testParse013() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <mess><![CDATA[This is a \r CDATA\n section]]></mess>' +
            '    <todo>Play</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer);
    let str = "";

    function func(key, value) {
        if (key === 5) {
            str += value.getText();
        }
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    that.parse(options);
    return str;
}
export function testParse014() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Hello\rWorld\n</title>' +
            '    <todo>Work\r\n</todo>' +
            '    <mess><![CDATA[This is a \r\n CDATA section]]></mess>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer);
    let str = "";

    function func(key, value) {
        if (key === 4 || key === 5) {
            str += value.getText();
        }
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    that.parse(options);
    return str;
}
export function testParse015() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="hi&amp;gh" logged="&lt;true">' +
            '    <title>Hello&gt;World&apos;</title>' +
            '    <todo>Wo&quot;rk</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer);
    let strAttr = "";
    let str = "";

    function funcAttr(name, value) {
        strAttr += name + ', ' + value + ' ';
        return true;
    }

    function func(name, value) {
        str += name + value + ' ';
        return true;
    }

    let options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeValueCallbackFunction: funcAttr,
        tagValueCallbackFunction: func
    }
    that.parse(options);
    return [str, strAttr];
}
export function testParse001() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<!DOCTYPE note [\n<!ENTITY foo "baa">]>' +
            '<note importance="high" logged="true">' +
            '    <![CDATA[\r\nfuncrion matchwo(a,6)\r\n{\r\nreturn 1;\r\n}\r\n]]>' +
            '    <!--Hello, World!-->' +
            '    <company>John &amp; Hans</company>' +
            '    <title>Happy</title>' +
            '    <title>Happy</title>' +
            '    <lens>Work</lens>' +
            '    <lens>Play</lens>' +
            '    <?go there?>' +
            '    <a><b/></a>' +
            '    <h:table xmlns:h="http://www.w3.org/TR/html4/">' +
            '        <h:tr>' +
            '            <h:td>Apples</h:td>' +
            '            <h:td>Bananas</h:td>' +
            '        </h:tr>' +
            '    </h:table>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let arrbuffer = textEncoder.encodeInto(strXml);
    let that = new xml.XmlPullParser(arrbuffer.buffer, 'UTF-8');
    let str = '';

    function func2(name, value) {
        str += name + ':' + value;
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, attributeValueCallbackFunction: func2 }
    that.parse(options);
    return str;
}
export function testXmlBusinessError001() {
    try {
        new xml.XmlSerializer(123, "utf-8");
        return '';
    } catch (e) {
        return e.toString();
    }
}
export function testXmlBusinessError002() {
    try {
        let arrayBuffer = new ArrayBuffer(2048);
        new xml.XmlSerializer(arrayBuffer, 123);
        return '';
    } catch (e) {
        return e.toString();
    }
}
export function testXmlBusinessError003() {
    try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
        thatSer.startElement(111);
        return '';
    } catch (e) {
        return e.toString();
    }
}
export function testXmlBusinessError004() {
    try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
        thatSer.startElement("note");
        thatSer.setAttributes(111, "high1");
        return '';
    } catch (e) {
        return e.toString();
    }
}
export function testXmlBusinessError005() {
    try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
        thatSer.startElement("note");
        thatSer.setAttributes("importance1", 111);
        return '';
    } catch (e) {
        return e.toString();
    }
}
export function testXmlBusinessError006() {
    try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "high");
        thatSer.setText(111);
        return '';
    } catch (e) {
        return e.toString();
    }
}
export function testXmlBusinessError007() {
    try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
        thatSer.startElement("note");
        thatSer.addEmptyElement(111);
        return '';
    } catch (e) {
        return e.toString();
    }
}
export function testXmlBusinessError008() {
    try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
        thatSer.setDeclaration();
        thatSer.setNamespace(111, "http://www.w3.org/TR/html4/");
        return '';
    } catch (e) {
        return e.toString();
    }
}
export function testXmlBusinessError009() {
    try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
        thatSer.setDeclaration();
        thatSer.setNamespace("h", 111);
        return '';
    } catch (e) {
        return e.toString();
    }
}
export function testXmlBusinessError010() {
    try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
        thatSer.startElement("note");
        thatSer.setComment(111);
        return '';
    } catch (e) {
        return e.toString();
    }
}
export function testXmlBusinessError011() {
    try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
        thatSer.setDocType(111);
        return '';
    } catch (e) {
        return e.toString();
    }
}
export function testXmlBusinessError012() {
    try {
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
        thatSer.setCDATA(111)
        return '';
    } catch (e) {
        return e.toString();
    }
}
export function testXmlBusinessError013() {
    try {
        new xml.XmlPullParser(111, 'UTF-8');
        return '';
    } catch (e) {
        return e.toString();
    }
}
export function testXmlBusinessError014() {
    try {
        let arrayBuffer = new ArrayBuffer(2048);
        new xml.XmlPullParser(arrayBuffer, 111);
        return '';
    } catch (e) {
        return e.toString();
    }
}
export function testXmlBusinessError015() {
    try {
        let strXml =
            '<?xml version="1.0" encoding="utf-8"?>' +
                '<!DOCTYPE note [\n<!ENTITY foo "baa">]>' +
                '<note importance="high" logged="true">' +
                '    <![CDATA[\r\nfuncrion matchwo(a,6)\r\n{\r\nreturn 1;\r\n}\r\n]]>' +
                '    <!--Hello, World!-->' +
                '    <company>John &amp; Hans</company>' +
                '    <title>Happy</title>' +
                '    <title>Happy</title>' +
                '    <todo>Work</todo>' +
                '    <todo>Play</todo>' +
                '    <?go there?>' +
                '    <a><b/></a>' +
                '    <h:table xmlns:h="http://www.w3.org/TR/html4/">' +
                '        <h:tr>' +
                '            <h:td>Apples</h:td>' +
                '            <h:td>Bananas</h:td>' +
                '        </h:tr>' +
                '    </h:table>' +
                '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer, 'UTF-8');
        let str1 = '';

        function func1(name, value) {
            str1 += name + ':' + value;
            return true;
        }

        let options = 111
        that.parse(options);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function testNodeName001() {
    try {
        let strXml =
            '<?xml version="1.0" encoding="UTF-8"?>' +
                '<note importance="high" logged="true">' +
                '<company>John &amp; Hans</company>' +
                '<tod<xml version="1.0" encoding="UTF-8"?><note importance="high" logged="true"></note>' +
                '</note>';
        let textec = new util.TextEncoder()
        let uint8 = textec.encodeInto(strXml);
        let that = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
        let str = '';

        function func(name, value) {
            str += name + value;
            return true;
        }

        let options = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func }
        that.parse(options);
        return '';
    } catch (e) {
        return e.code
    }
}
export function testNodeName002() {
    try {
        let strXml =
            '<?xml version="1.0" encoding="UTF-8"?>' +
                '<note importance="high" logged="true">' +
                '<company>John &amp; Hans</company>' +
                '<2todo>work</2todo>' +
                '</note>';
        let textec = new util.TextEncoder()
        let uint8 = textec.encodeInto(strXml);
        let that = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
        let str = '';

        function func(name, value) {
            str += name + value;
            return true;
        }

        let options = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func }
        that.parse(options);
        return '';
    } catch (e) {
        return e.code;
    }
}
export function testParseXml001() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <!--Hello, World!-->' +
            '    <company>John &amp; Hans</company>' +
            '    <lens>Work</lens>' +
            '    <h:table xmlns:h="http://www.w3.org/TR/html4/">' +
            '        <h:tr>' +
            '            <h:td>Apples</h:td>' +
            '        </h:tr>' +
            '    </h:table>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
    let result = '';

    function func(name, value) {
        result += name + ':' + value + ' ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, attributeValueCallbackFunction: func }
    pullParse.parseXml(options);
    return result.trim();
}
export function testParseXml002() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <![CDATA[funcrion \n matchwo(a,6)]]>' +
            '    <!--Hello, World!-->' +
            '    <company>John &amp; Hans</company>' +
            '    <title>Happy</title>' +
            '    <lens>Play</lens>' +
            '    <?go there?>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer);
    let result = '';

    function func(name, value) {
        result += name + value;
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func }
    pullParse.parseXml(options);
    return result.trim();
}
export function testParseXml003() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer);
    let result = '';

    function func(key, value) {
        result += 'key:' + key + ' value:' + value.getColumnNumber() + '  ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    pullParse.parseXml(options);
    return result.trim();
}
export function testParseXml004() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer);
    let result = '';

    function func(key, value) {
        result += 'key:' + key + ' value:' + value.getDepth() + '  ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    pullParse.parseXml(options);
    return result.trim();
}
export function testParseXml005() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let uin8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uin8.buffer);
    let result = '';

    function func(key, value) {
        result += 'key:' + key + ' value:' + value.getLineNumber() + '  ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    pullParse.parseXml(options);
    return result.trim();
}
export function testParseXml006() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer);
    let result = '';

    function func(key, value) {
        if (key == xml.EventType.START_TAG || key == xml.EventType.END_TAG) {
            result += 'key:' + key + ' value:' + value.getName() + '  ';
        }
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    pullParse.parseXml(options);
    return result.trim();
}
export function testParseXml007() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high">' +
            '<h:table xmlns:h="html4">' +
            '<h:tr><h:td>Bananas</h:td></h:tr>' +
            '</h:table>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer);
    let result = '';

    function func(key, value) {
        if (key == xml.EventType.START_TAG || key == xml.EventType.END_TAG) {
            result += 'key:' + key + ' value:' + value.getNamespace() + '  ';
        }
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: false, tokenValueCallbackFunction: func }
    pullParse.parseXml(options);
    return result.trim();
}
export function testParseXml008() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high">' +
            '<h:table xmlns:h="html4">' +
            '<h:tr><h:td>Bananas</h:td></h:tr>' +
            '</h:table>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer);
    let result = '';

    function func(key, value) {
        if (key == xml.EventType.START_TAG || key == xml.EventType.END_TAG) {
            result += 'key:' + key + ' value:' + value.getPrefix() + '  ';
        }
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: false, tokenValueCallbackFunction: func }
    pullParse.parseXml(options);
    return result.trim();
}
export function testParseXml009() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer);
    let result = '';

    function func(key, value) {
        if (key == xml.EventType.TEXT) {
            result += 'key:' + key + ' value:' + value.getText() + '  ';
        }
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    pullParse.parseXml(options);
    return result.trim();
}
export function testParseXml010() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high">' +
            '<title/>' +
            '<todo>Work</todo>' +
            '<todo/>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer);
    let result = '';

    function func(key, value) {
        if (key == xml.EventType.START_TAG) {
            result += 'key:' + key + ' value:' + value.isEmptyElementTag() + '  ';
        }
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    pullParse.parseXml(options);
    return result.trim();
}
export function testParseXml011() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Happy</title>' +
            '    <todo>Work</todo>' +
            '    <todo>Play</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer);
    let result = '';

    function func(key, value) {
        if (key == xml.EventType.START_TAG) {
            result += 'key:' + key + ' value:' + value.getAttributeCount() + '  ';
        }
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    pullParse.parseXml(options);
    return result.trim();
}
export function testParseXml012() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title>Hello\nWorld</title>' +
            '    <todo>Work\n</todo>' +
            '    <mess><![CDATA[This is a \n CDATA section]]></mess>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer);
    let result = '';

    function func(key, value) {
        if (key === xml.EventType.TEXT || key === xml.EventType.CDSECT) {
            result += value.getText() + ' ';
        }
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tokenValueCallbackFunction: func }
    pullParse.parseXml(options);
    return result.trim();
}
export function testParseXml013() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="hi&amp;gh" logged="&lt;true">' +
            '    <title>Hello&gt;World&apos;</title>' +
            '    <todo>Wo&quot;rk</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer);
    let resAttr = '';
    let result = '';

    function funcAttr(name, value) {
        resAttr += name + ', ' + value + ' ';
        return true;
    }

    function func(name, value) {
        if (name == xml.EventType.TEXT) {
            result += value.getText() + ' ';
        }
        return true;
    }

    let options = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeValueCallbackFunction: funcAttr,
        tokenValueCallbackFunction: func
    }
    pullParse.parseXml(options);
    return [result.trim(), resAttr.trim()];
}
export function testParseXml014() {
    let strXml =
        '<?xml version="1.0" encoding="UTF-8"?>' +
            '<note importance="high" logged="true">' +
            '<company><![CDATA[SYSTEM</company>' +
            '<todo>work</todo>' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer);
    let result = '';

    function func(name, value) {
        result += name + value;
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func }
    try {
        pullParse.parseXml(options);
    } catch (e) {
        return e.code;
    }
}
export function testParseXml015() {
    let strXml =
        '<?xml version="1.0" encoding="UTF-8"?>' +
            '<note importance="high" logged="true">' +
            '<company><![CDATA[';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer);
    let result = '';

    function func(name, value) {
        result += name + value;
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func }
    try {
        pullParse.parseXml(options);
    } catch (e) {
        return e.code;
    }
}
export function testParseXml016() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '<title>Happy</title>' +
            '<?go there' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer);
    let result = '';

    function func(name, value) {
        result += name + value;
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func }
    try {
        pullParse.parseXml(options);
    } catch (e) {
        return e.code;
    }
}
export function testParseXml017() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '<title>Happy</title>' +
            '<?go there';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer);
    let result = '';

    function func(name, value) {
        result += name + value;
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func }
    try {
        pullParse.parseXml(options);
    } catch (e) {
        return e.code;
    }
}
export function testParseXml018() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '<title>Happy</title>' +
            '<!--comment' +
            '</note>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer);
    let result = '';

    function func(name, value) {
        result += name + value;
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func }
    try {
        pullParse.parseXml(options);
    } catch (e) {
        return e.code;
    }
}
export function testParseXml019() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<column name="Giana"><value integer="1"/></column>' +
            '<column name="category"><value Boolean="true"/></column>' +
            '<column name="day"><value Boolean="3"/></column>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
    let findCategory = false;
    let categoryValue = "";

    function attrWithTag(tagName, key, value) {
        if (value === '1') {
            findCategory = true;
            return true;
        }
        if (findCategory) {
            categoryValue = value;
            return false;
        }
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, attributeWithTagCallbackFunction: attrWithTag }
    pullParse.parseXml(options);
    return categoryValue;
}
export function testParseXml020() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<column name="Giana"><value integer="1"/></column>' +
            '<column name="category"><value Boolean="true"/></column>' +
            '<column name="day"><value Boolean="3"/></column>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
    let str = '';

    function attrWithTag(tagName, key, value) {
        if (value === 'category') {
            return false;
        }
        str += tagName + ' ' + key + ' ' + value + ' ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, attributeWithTagCallbackFunction: attrWithTag }
    pullParse.parseXml(options);
    return str.trim();
}
export function testParseXml021() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<column name="Giana"><value integer="1"/></column>' +
            '<column name="category"><value Boolean="true"/></column>' +
            '<column name="day"><value Boolean="3"/></column>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
    let str = '';

    function attrWithTag(tagName, key, value) {
        if (value === 'category') {
            return false;
        }
        str += key + ' ' + value + ' ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, attributeWithTagCallbackFunction: attrWithTag }
    pullParse.parseXml(options);
    return str.trim();
}
export function testParseXml022() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<column name="Giana"><value integer="1"/></column>' +
            '<column name="category"><value Boolean="true"/></column>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
    let str = '';

    function attrWithTag(tagName, key, value) {
        str += tagName + ' ' + key + ' ' + value + ' ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, attributeWithTagCallbackFunction: attrWithTag }
    pullParse.parseXml(options);
    return str.trim();
}
export function testParseXml023() {
    let strXml =
        '<?xml version="1.0" encoding="utf-8"?>' +
            '<column name="Giana"><value integer="1"/></column>' +
            '<column name="category"><value Boolean="true"/></column>';
    let textEncoder = new util.TextEncoder();
    let uint8 = textEncoder.encodeInto(strXml);
    let pullParse = new xml.XmlPullParser(uint8.buffer, 'UTF-8');
    let str = '';

    function attrWithTag(tagName, key, value) {
        str += key + ' ' + value + ' ';
        return true;
    }

    let options = { supportDoctype: true, ignoreNameSpace: true, attributeWithTagCallbackFunction: attrWithTag }
    pullParse.parseXml(options);
    return str.trim();
}
