'use static';
/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { util, xml } from '@kit.ArkTS';
import { testXml } from './Testxml';


export function testXmlDynamicSerializer() {
  const TAG = 'DynamicXmlConcurrentTest0001';
  try {
    const ser = new xml.XmlDynamicSerializer();
    ser.startElement('note');
    ser.setAttributes('importance', '馃槉');
    ser.endElement();
    const buf = ser.getOutput();
    if (!buf || buf.byteLength === 0) {
      throw new Error(`${TAG} empty output`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testSetComment() {
  const TAG = 'DynamicXmlConcurrentTest0002';
  try {
    console.log(`${TAG} test start`);
    const ser = new xml.XmlDynamicSerializer();
    ser.setComment('馃槉');
    const buf = ser.getOutput();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('<!--馃槉-->')) {
      throw new Error(`${TAG} comment mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testSetCdata() {
  const TAG = 'DynamicXmlConcurrentTest0003';
  try {
    console.log(`${TAG} test start`);
    const emoji = '\ud83d\udc7f';
    let that = new xml.XmlDynamicSerializer();
    that.setCdata(emoji);
    let arrayBuffer = that.getOutput();
    let uint8 = new Uint8Array(arrayBuffer);
    let result = util.TextDecoder.create().decodeToString(uint8);
    if (result !== '<![CDATA[👿]]>') {
      console.info('==========',result)
      throw new Error(`${TAG} cdata mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testSetDocType() {
  const TAG = 'DynamicXmlConcurrentTest0004';
  try {
    console.log(`${TAG} test start`);
    const ser = new xml.XmlDynamicSerializer();
    ser.setDocType('馃槉');
    const buf = ser.getOutput();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('<!DOCTYPE 馃槉>')) {
      throw new Error(`${TAG} doctype mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testSetDeclaration() {
  const TAG = 'DynamicXmlConcurrentTest0005';
  try {
    console.log(`${TAG} test start`);
    const ser = new xml.XmlDynamicSerializer();
    ser.setDeclaration();          // 鍙兘璋冧竴娆★紝鎺ュ彛瀛樺湪鍗冲彲
    const buf = ser.getOutput();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('<?xml')) {
      throw new Error(`${TAG} declaration missing`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testSetNamespace() {
  const TAG = 'DynamicXmlConcurrentTest0006';
  try {
    console.log(`${TAG} test start`);
    const ser = new xml.XmlDynamicSerializer();
    ser.setNamespace('ns', 'http://test');
    ser.startElement('note');
    ser.endElement();
    const buf = ser.getOutput();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('xmlns:ns=')) {
      throw new Error(`${TAG} namespace mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testSetText() {
  const TAG = 'DynamicXmlConcurrentTest0007';
  try {
    console.log(`${TAG} test start`);
    const ser = new xml.XmlDynamicSerializer();
    ser.startElement('note');
    ser.setText('inner');
    ser.endElement();
    const buf = ser.getOutput();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('>inner<')) {
      throw new Error(`${TAG} text mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testAddEmptyElement() {
  const TAG = 'DynamicXmlConcurrentTest0008';
  try {
    console.log(`${TAG} test start`);
    const ser = new xml.XmlDynamicSerializer();
    ser.addEmptyElement('empty');
    const buf = ser.getOutput();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('<empty/>')) {
      throw new Error(`${TAG} empty element mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


// 1. XmlSerializer 鏋勯€犲嚱鏁帮紙ArrayBuffer 瓒冲闀匡級

export function testXmlSerializerConstructor() {
  const TAG = 'testXmlSerializerConstructor';
  try {
    console.log(`${TAG} start`);
    const expectDecl = '<?xml version="1.0" encoding="utf-8"?>';
    const buf = new ArrayBuffer(expectDecl.length + 10);
    const ser = new xml.XmlSerializer(buf);
    ser.setDeclaration();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf)).slice(0, expectDecl.length);
    if (str !== expectDecl) {
      throw new Error(`decl mismatch: ${str}`);
    }
    console.log(`${TAG} end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 2. setAttributes 姝ｅ父鍒嗘敮锛堢涓€娆″嚭鐜帮級

export function testSetAttributes() {
  const TAG = 'testSetAttributes';
  try {
    console.log(`${TAG} start`);
    const buf = new ArrayBuffer(2048);
    const ser = new xml.XmlSerializer(buf);
    ser.startElement('note');
    ser.setAttributes('importance', 'high');
    ser.endElement();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('importance="high"')) {
      throw new Error(`attr not found`);
    }
    console.log(`${TAG} end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 3. addEmptyElement 姝ｅ父鍒嗘敮

export function testAddEmptyElement2() {
  const TAG = 'testAddEmptyElement';
  try {
    console.log(`${TAG} start`);
    const buf = new ArrayBuffer(256);
    const ser = new xml.XmlSerializer(buf);
    ser.addEmptyElement('empty');
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('<empty/>')) {
      throw new Error(`empty element mismatch`);
    }
    console.log(`${TAG} end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 4. setDeclaration

export function testSetDeclaration2() {
  const TAG = 'testSetDeclaration';
  try {
    console.log(`${TAG} start`);
    const buf = new ArrayBuffer(256);
    const ser = new xml.XmlSerializer(buf);
    ser.setDeclaration();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('<?xml version="1.0" encoding="utf-8"?>')) {
      throw new Error(`decl mismatch`);
    }
    console.log(`${TAG} end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 5. startElement 姝ｅ父鍒嗘敮

export function testStartElement() {
  const TAG = 'testStartElement';
  try {
    console.log(`${TAG} start`);
    const buf = new ArrayBuffer(256);
    const ser = new xml.XmlSerializer(buf);
    ser.startElement('note');
    ser.endElement();
    const str = new util.TextDecoder().decodeToString(new Uint8Array(buf));
    if (!str.includes('<note/>')) {
      throw new Error(`startElement mismatch`);
    }
    console.log(`${TAG} end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}
