/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import pasteboard from '@ohos.pasteboard'
import image from '@ohos.multimedia.image';
import Want from '@ohos.app.ability.Want';

let TAG = "PASTEBOARD_TAG"

class Sizes {
  height: number = 3;
  width: number = 5;
}

let opt: ESObject = {
  size: new Sizes(),
  pixelFormat: 3,
  editable: true,
  alphaType: 1,
  scaleMode: 1
}

const ARRAY_BUFFER = new ArrayBuffer(256);

const WANT: Want = {
  bundleName: "com.acts.distributeddatamgr.pasteboardtest",
  abilityName: "com.acts.distributeddatamgr.pasteboardtest.MainAbility"
};

export default function PasteboardReturnvalue() {
  describe('PasteboardReturnvalue', () => {
    console.info('start################################start');

    beforeEach(async () => {
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.clearData();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_CreateHtmlTextRecord_001
     * @tc.number SUB_Pasteboard_Returnvalue_001
     * @tc.desc   Test createHtmlTextRecord return value - htmlText field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_CreateHtmlTextRecord_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_CreateHtmlTextRecord_001 start");
      try {
        let html = "<!DOCTYPE html><html><head><meta charset=\"utf-8\"><title>Test</title></head><body><h1>Test</h1></body></html>";
        let record: pasteboard.PasteDataRecord = pasteboard.createHtmlTextRecord(html);
        expect(record != null).assertTrue();
        expect(record.htmlText).assertEqual(html);
        expect(record.mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_HTML);
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_CreateHtmlTextRecord_001 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_CreateHtmlTextRecord_002
     * @tc.number SUB_Pasteboard_Returnvalue_002
     * @tc.desc   Test createHtmlTextRecord return value - plainText field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_CreateHtmlTextRecord_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_CreateHtmlTextRecord_002 start");
      try {
        let html = "<!DOCTYPE html><html><head><meta charset=\"utf-8\"><title>Test</title></head><body><h1>Test</h1></body></html>";
        let record: pasteboard.PasteDataRecord = pasteboard.createHtmlTextRecord(html);
        let plainText: string = record.toPlainText();
        expect(plainText != null).assertTrue();
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_CreateHtmlTextRecord_002 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_CreateWantRecord_001
     * @tc.number SUB_Pasteboard_Returnvalue_003
     * @tc.desc   Test createWantRecord return value - want field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_CreateWantRecord_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_CreateWantRecord_001 start");
      try {
        let record: pasteboard.PasteDataRecord = pasteboard.createWantRecord(WANT);
        expect(record != null).assertTrue();
        expect(record.want != null).assertTrue();
        expect(record.want.bundleName).assertEqual(WANT.bundleName);
        expect(record.mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_WANT);
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_CreateWantRecord_001 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_CreateWantRecord_002
     * @tc.number SUB_Pasteboard_Returnvalue_004
     * @tc.desc   Test createWantRecord return value - plainText field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_CreateWantRecord_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_CreateWantRecord_002 start");
      try {
        let record: pasteboard.PasteDataRecord = pasteboard.createWantRecord(WANT);
        let plainText: string = record.toPlainText();
        expect(plainText != null).assertTrue();
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_CreateWantRecord_002 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_CreatePlainTextRecord_001
     * @tc.number SUB_Pasteboard_Returnvalue_005
     * @tc.desc   Test createPlainTextRecord return value - plainText field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_CreatePlainTextRecord_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_CreatePlainTextRecord_001 start");
      try {
        let text = "Hello World";
        let record: pasteboard.PasteDataRecord = pasteboard.createPlainTextRecord(text);
        expect(record != null).assertTrue();
        expect(record.plainText).assertEqual(text);
        expect(record.mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_PLAIN);
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_CreatePlainTextRecord_001 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_CreatePlainTextRecord_002
     * @tc.number SUB_Pasteboard_Returnvalue_006
     * @tc.desc   Test createPlainTextRecord return value - toPlainText coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_CreatePlainTextRecord_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_CreatePlainTextRecord_002 start");
      try {
        let text = "Hello World";
        let record: pasteboard.PasteDataRecord = pasteboard.createPlainTextRecord(text);
        let plainText: string = record.toPlainText();
        expect(plainText).assertEqual(text);
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_CreatePlainTextRecord_002 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_CreateUriRecord_001
     * @tc.number SUB_Pasteboard_Returnvalue_007
     * @tc.desc   Test createUriRecord return value - uri field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_CreateUriRecord_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_CreateUriRecord_001 start");
      try {
        let uri = "dataability:///com.example.myapplication1/user.txt";
        let record: pasteboard.PasteDataRecord = pasteboard.createUriRecord(uri);
        expect(record != null).assertTrue();
        expect(record.uri).assertEqual(uri);
        expect(record.mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_URI);
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_CreateUriRecord_001 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_CreateUriRecord_002
     * @tc.number SUB_Pasteboard_Returnvalue_008
     * @tc.desc   Test createUriRecord return value - toPlainText coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_CreateUriRecord_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_CreateUriRecord_002 start");
      try {
        let uri = "dataability:///com.example.myapplication1/user.txt";
        let record: pasteboard.PasteDataRecord = pasteboard.createUriRecord(uri);
        let plainText: string = record.toPlainText();
        expect(plainText).assertEqual(uri);
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_CreateUriRecord_002 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_CreateRecord_001
     * @tc.number SUB_Pasteboard_Returnvalue_009
     * @tc.desc   Test createRecord return value - htmlText field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_CreateRecord_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_CreateRecord_001 start");
      try {
        let html = "<html>hello</html>";
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_HTML, html);
        expect(record != null).assertTrue();
        expect(record.htmlText).assertEqual(html);
        expect(record.mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_HTML);
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_CreateRecord_001 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_CreateRecord_002
     * @tc.number SUB_Pasteboard_Returnvalue_010
     * @tc.desc   Test createRecord return value - want field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_CreateRecord_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_CreateRecord_002 start");
      try {
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_WANT, WANT);
        expect(record != null).assertTrue();
        expect(record.want != null).assertTrue();
        expect(record.want.bundleName).assertEqual(WANT.bundleName);
        expect(record.mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_WANT);
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_CreateRecord_002 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_CreateRecord_003
     * @tc.number SUB_Pasteboard_Returnvalue_011
     * @tc.desc   Test createRecord return value - mimeType field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_CreateRecord_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_CreateRecord_003 start");
      try {
        let customMimeType = "custom/mime";
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord(customMimeType, ARRAY_BUFFER);
        expect(record != null).assertTrue();
        expect(record.mimeType).assertEqual(customMimeType);
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_CreateRecord_003 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_CreateRecord_004
     * @tc.number SUB_Pasteboard_Returnvalue_012
     * @tc.desc   Test createRecord return value - plainText field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_CreateRecord_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_CreateRecord_004 start");
      try {
        let text = "plain text content";
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, text);
        expect(record != null).assertTrue();
        expect(record.plainText).assertEqual(text);
        expect(record.mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_PLAIN);
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_CreateRecord_004 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_CreateRecord_005
     * @tc.number SUB_Pasteboard_Returnvalue_013
     * @tc.desc   Test createRecord return value - uri field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_CreateRecord_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_CreateRecord_005 start");
      try {
        let uri = "file:///data/storage/el2/base/files/test.txt";
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_URI, uri);
        expect(record != null).assertTrue();
        expect(record.uri).assertEqual(uri);
        expect(record.mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_URI);
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_CreateRecord_005 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_CreateRecord_006
     * @tc.number SUB_Pasteboard_Returnvalue_014
     * @tc.desc   Test createRecord return value - pixelMap field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_CreateRecord_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_CreateRecord_006 start");
      try {
        let color = new ArrayBuffer(128);
        await image.createPixelMap(color, opt).then((pixelMap) => {
          let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_PIXELMAP, pixelMap);
          expect(record != null).assertTrue();
          expect(record.pixelMap != null).assertTrue();
          expect(record.mimeType).assertEqual(pasteboard.MIMETYPE_PIXELMAP);
        });
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_CreateRecord_006 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_CreateRecord_007
     * @tc.number SUB_Pasteboard_Returnvalue_015
     * @tc.desc   Test createRecord return value - data field coverage and addEntry/getData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_CreateRecord_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_CreateRecord_007 start");
      try {
        let html = "<html>hello</html>";
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
        record.addEntry(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.addEntry(pasteboard.MIMETYPE_TEXT_HTML, html);
        console.info("record: " + record);
        expect(record != null).assertTrue();
        let types: string[] = record.getValidTypes([
          pasteboard.MIMETYPE_TEXT_PLAIN,
          pasteboard.MIMETYPE_TEXT_HTML,
          pasteboard.MIMETYPE_TEXT_URI
        ]);
        console.info("types: " + types);
        expect(types.length).assertEqual(3);
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_CreateRecord_007 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_CreateRecord_008
     * @tc.number SUB_Pasteboard_Returnvalue_016
     * @tc.desc   Test createRecord return value - data field coverage getData method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_CreateRecord_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_CreateRecord_008 start");
      try {
        let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
        record.addEntry(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.getData(pasteboard.MIMETYPE_TEXT_PLAIN).then((value: pasteboard.ValueType) => {
          let textPlainContent = value as string;
          expect(textPlainContent).assertEqual('hello');
        }).catch((err: ESObject) => {
          console.info("SUB_Pasteboard_Returnvalue_CreateRecord_008 error: " + err);
          expect().assertFalse();
        });
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_CreateRecord_008 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_GetPrimaryPixelMap_001
     * @tc.number SUB_Pasteboard_Returnvalue_017
     * @tc.desc   Test getPrimaryPixelMap return value - isEditable field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_GetPrimaryPixelMap_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_GetPrimaryPixelMap_001 start");
      try {
        let color = new ArrayBuffer(128);
        await image.createPixelMap(color, opt).then(async (pixelMap) => {
          let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_PIXELMAP, pixelMap);
          let primaryPixelMap: image.PixelMap = pasteData.getPrimaryPixelMap();
          expect(primaryPixelMap != null).assertTrue();
          let isEditable = primaryPixelMap.isEditable;
          expect(isEditable != null).assertTrue();
          console.info("isEditable: " + isEditable);
        });
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_GetPrimaryPixelMap_001 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_GetPrimaryPixelMap_002
     * @tc.number SUB_Pasteboard_Returnvalue_018
     * @tc.desc   Test getPrimaryPixelMap return value - isStrideAlignment field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_GetPrimaryPixelMap_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_GetPrimaryPixelMap_002 start");
      try {
        let color = new ArrayBuffer(128);
        await image.createPixelMap(color, opt).then(async (pixelMap) => {
          let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_PIXELMAP, pixelMap);
          let primaryPixelMap: image.PixelMap = pasteData.getPrimaryPixelMap();
          expect(primaryPixelMap != null).assertTrue();
          let isStrideAlignment = primaryPixelMap.isStrideAlignment;
          expect(isStrideAlignment != null).assertTrue();
          console.info("isStrideAlignment: " + isStrideAlignment);
        });
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_GetPrimaryPixelMap_002 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_GetProperty_001
     * @tc.number SUB_Pasteboard_Returnvalue_019
     * @tc.desc   Test getProperty return value - additions field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_GetProperty_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_GetProperty_001 start");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let prop: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(prop != null).assertTrue();
        expect(prop.additions != null).assertTrue();
        prop.additions = { 'TestKey': { 'TestValue': 123 } };
        let prop2: pasteboard.PasteDataProperty = pasteData.getProperty();
        expect(prop2.additions != null).assertTrue();
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_GetProperty_001 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_GetRecordAt_001
     * @tc.number SUB_Pasteboard_Returnvalue_020
     * @tc.desc   Test getRecordAt return value - htmlText field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_GetRecordAt_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_GetRecordAt_001 start");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, '<html>test</html>');
        let record: pasteboard.PasteDataRecord = pasteData.getRecordAt(0);
        expect(record != null).assertTrue();
        expect(record.htmlText).assertEqual('<html>test</html>');
        expect(record.mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_HTML);
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_GetRecordAt_001 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_GetRecordAt_002
     * @tc.number SUB_Pasteboard_Returnvalue_021
     * @tc.desc   Test getRecordAt return value - want field coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_GetRecordAt_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_GetRecordAt_002 start");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_WANT, WANT);
        let record: pasteboard.PasteDataRecord = pasteData.getRecordAt(0);
        expect(record != null).assertTrue();
        expect(record.want != null).assertTrue();
        expect(record.want.bundleName).assertEqual(WANT.bundleName);
        expect(record.mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_WANT);
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_GetRecordAt_002 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_GetRecord_001
     * @tc.number SUB_Pasteboard_Returnvalue_022
     * @tc.desc   Test getRecord return value coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_GetRecord_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_GetRecord_001 start");
      try {
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'test content');
        let record: pasteboard.PasteDataRecord = pasteData.getRecord(0);
        expect(record != null).assertTrue();
        expect(record.plainText).assertEqual('test content');
        expect(record.mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_PLAIN);
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_GetRecord_001 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_RemoteData_001
     * @tc.number SUB_Pasteboard_Returnvalue_023
     * @tc.desc   Test isRemoteData return value - false coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Pasteboard_Returnvalue_RemoteData_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_Pasteboard_Returnvalue_RemoteData_001 start");
      try {
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'local data');
        await systemPasteBoard.setData(pasteData);
        let isRemote = systemPasteBoard.isRemoteData();
        expect(isRemote != null).assertTrue();
        console.info("isRemoteData false result: " + isRemote);
      } catch(err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info("SUB_Pasteboard_Returnvalue_RemoteData_001 end");
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_001
     * @tc.number SUB_Pasteboard_Returnvalue_024
     * @tc.desc   Test createRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_001 start');
      try{
        let mimeType = "x".repeat(1024);
        let pasteData = pasteboard.createRecord(mimeType, ARRAY_BUFFER);
        let text: string = pasteData.toPlainText();
        expect(text.length == 0).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_001 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_002
     * @tc.number SUB_Pasteboard_Returnvalue_025
     * @tc.desc   Test createRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_002 start');
      try{
        let mimeType = "x".repeat(1025);
        expect(mimeType.length == 1025).assertTrue();
        let pasteData = pasteboard.createRecord(mimeType, ARRAY_BUFFER);
        let text: string = pasteData.toPlainText();
        expect(text.length == 1025).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_002 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_003
     * @tc.number SUB_Pasteboard_Returnvalue_026
     * @tc.desc   Test addEntry API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_003 start');
      try{
        let mimeType = "x".repeat(1024);
        expect(mimeType.length == 1024).assertTrue();
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.addEntry(mimeType, ARRAY_BUFFER);
        let text: string = record.toPlainText();
        expect(text).assertEqual('hello');
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_003 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_004
     * @tc.number SUB_Pasteboard_Returnvalue_027
     * @tc.desc   Test addEntry API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_004 start');
      try{
        let mimeType = "x".repeat(1025);
        expect(mimeType.length == 1025).assertTrue();
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.addEntry(mimeType, ARRAY_BUFFER);
        let text: string = record.toPlainText();
        expect(text.length == 1025).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_004 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_005
     * @tc.number SUB_Pasteboard_Returnvalue_028
     * @tc.desc   Test getData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_005 start');
      try{
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let mimeType = "x".repeat(1024);
        expect(mimeType.length == 1024).assertTrue();
        record.addEntry(mimeType, ARRAY_BUFFER);
        let pastedata = record.getData(mimeType);
        expect(pastedata != null).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_005 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_006
     * @tc.number SUB_Pasteboard_Returnvalue_029
     * @tc.desc   Test getData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_006 start');
      try{
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let mimeType = "x".repeat(1025);
        let pastedata = record.getData(mimeType);
        expect(pastedata != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_006 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_007
     * @tc.number SUB_Pasteboard_Returnvalue_030
     * @tc.desc   Test getPrimaryPixelMap API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_007 start');
      try{
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        image.createPixelMap(buffer, opt).then((pixelMap: image.PixelMap) => {
          let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('pixelMap', pixelMap);
          pasteData.addRecord(textRecord);
          let count: number = pasteData.getRecordCount();
          expect(count).assertEqual(2);
          let pixelmapdata: image.PixelMap = pasteData.getPrimaryPixelMap();
          expect(pixelmapdata != null).assertTrue();
          let editable = pixelmapdata.isEditable;
          expect(editable).assertTrue();
          })
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_007 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_008
     * @tc.number SUB_Pasteboard_Returnvalue_031
     * @tc.desc   Test getPrimaryPixelMap API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_008 start');
      try{
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: false,
          alphaType: image.AlphaType.UNPREMUL
        };
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        image.createPixelMap(buffer, opt).then((pixelMap: image.PixelMap) => {
          let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('pixelMap', pixelMap);
          pasteData.addRecord(textRecord);
          let count: number = pasteData.getRecordCount();
          expect(count).assertEqual(2);
          let pixelmapdata: image.PixelMap = pasteData.getPrimaryPixelMap();
          let editable = pixelmapdata.isEditable;
          expect(editable).assertFalse();
          })
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_008 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_009
     * @tc.number SUB_Pasteboard_Returnvalue_032
     * @tc.desc   Test getPrimaryPixelMap API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_009 start');
      try{
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        image.createPixelMap(buffer, opt).then((pixelMap: image.PixelMap) => {
          let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('pixelMap', pixelMap);
          pasteData.addRecord(textRecord);
          let count: number = pasteData.getRecordCount();
          expect(count).assertEqual(2);
          let pixelmapdata: image.PixelMap = pasteData.getPrimaryPixelMap();
          let scaleModetrideAlignment = pixelmapdata.isStrideAlignment;
          expect(scaleModetrideAlignment).assertFalse();
          })
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_009 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_010
     * @tc.number SUB_Pasteboard_Returnvalue_033
     * @tc.desc   Test setProperty API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_010 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "test");
        let prop = pasteData.getProperty();
        prop.tag = '';
        prop.localOnly = true;
        prop.shareOption = pasteboard.ShareOption.CROSSDEVICE;
        pasteData.setProperty(prop);
        let newprop = pasteData.getProperty();
        let newmimetypes = newprop.mimeTypes;
        expect(newmimetypes[0]).assertEqual('text/plain');
        let newtag = newprop.tag;
        expect(newtag).assertEqual('');
        let newlocal = newprop.localOnly;
        expect(newlocal).assertFalse();
        let newshare = newprop.shareOption;
        expect(newshare).assertEqual(pasteboard.ShareOption.CROSSDEVICE);
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_010 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_011
     * @tc.number SUB_Pasteboard_Returnvalue_034
     * @tc.desc   Test setProperty API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_011 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "test");
        let prop = pasteData.getProperty();
        prop.mimeTypes[0] = 'text/html';
        prop.localOnly = false;
        prop.shareOption = pasteboard.ShareOption.LOCALDEVICE;
        pasteData.setProperty(prop);
        let newprop = pasteData.getProperty();
        let newmimetypes = newprop.mimeTypes;
        expect(newmimetypes[0]).assertEqual('text/plain');
        let newlocal = newprop.localOnly;
        expect(newlocal).assertTrue();
        let newshare = newprop.shareOption;
        expect(newshare).assertEqual(pasteboard.ShareOption.LOCALDEVICE);
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_011 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_012
     * @tc.number SUB_Pasteboard_Returnvalue_035
     * @tc.desc   Test setProperty API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_012 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "test");
        let prop = pasteData.getProperty();
        prop.mimeTypes[0] = '';
        prop.shareOption = pasteboard.ShareOption.INAPP;
        pasteData.setProperty(prop);
        let newprop = pasteData.getProperty();
        let newmimetypes = newprop.mimeTypes;
        expect(newmimetypes[0]).assertEqual('text/plain');
        let newshare = newprop.shareOption;
        expect(newshare).assertEqual(pasteboard.ShareOption.INAPP);
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_012 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_013
     * @tc.number SUB_Pasteboard_Returnvalue_036
     * @tc.desc   Test getRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_013 start');
      try{
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        image.createPixelMap(buffer, opt).then((pixelMap: image.PixelMap) => {
          let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('pixelMap', pixelMap);
          pasteData.addRecord(textRecord);
          let pasteDataRecord = pasteData.getRecord(0);
          let mimetypedata = pasteDataRecord.pixelMap;
          expect(mimetypedata != null).assertTrue();
          })
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_013 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_014
     * @tc.number SUB_Pasteboard_Returnvalue_037
     * @tc.desc   Test getRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_014 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello world");
        let pasteDataRecord = pasteData.getRecord(0);
        let mimetypedata = pasteDataRecord.plainText;
        expect(mimetypedata).assertEqual("hello world");
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_014 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_015
     * @tc.number SUB_Pasteboard_Returnvalue_038
     * @tc.desc   Test getRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_015 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, "dataability:///com.example.myapplication1/user.txt");
        let pasteDataRecord = pasteData.getRecord(0);
        let mimetypedata = pasteDataRecord.uri;
        expect(mimetypedata).assertEqual("dataability:///com.example.myapplication1/user.txt");
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_015 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_016
     * @tc.number SUB_Pasteboard_Returnvalue_039
     * @tc.desc   Test getRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_016 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, "<html>hello</html>");
        let pasteDataRecord = pasteData.getRecord(0);
        let mimetypedata = pasteDataRecord.htmlText;
        expect(mimetypedata).assertEqual("<html>hello</html>");
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_016 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_017
     * @tc.number SUB_Pasteboard_Returnvalue_040
     * @tc.desc   Test getRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_017 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_WANT, WANT);
        let pasteDataRecord = pasteData.getRecord(0);
        let mimetypedata = pasteDataRecord.want;
        expect(pasteDataRecord.mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_WANT);
        expect(String(WANT.bundleName)).assertEqual(mimetypedata.bundleName)
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_017 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_018
     * @tc.number SUB_Pasteboard_Returnvalue_041
     * @tc.desc   Test getRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_018 start');
      try{
        let pasteData = pasteboard.createData('String', ARRAY_BUFFER);
        let pasteDataRecord = pasteData.getRecord(0);
        let mimetypedata = pasteDataRecord.data;
        expect(mimetypedata != null).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_018 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_019
     * @tc.number SUB_Pasteboard_Returnvalue_042
     * @tc.desc   Test getTag API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_019 start');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
        let pasteDataProperty = pasteData.getProperty();
        pasteDataProperty.tag = "test_tag";
        pasteData.setProperty(pasteDataProperty);
        await systemPasteboard.setData(pasteData);
        let data = await systemPasteboard.getData();
        let dataTag = data.getTag();
        expect(dataTag).assertEqual("test_tag");
        systemPasteboard.clearDataSync();
        console.info(TAG + 'clearDataSync success');
      } catch (err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_019 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_020
     * @tc.number SUB_Pasteboard_Returnvalue_043
     * @tc.desc   Test replaceRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_020 start');
      try{
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        image.createPixelMap(buffer, opt).then((pixelMap: image.PixelMap) => {
          let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('pixelMap', pixelMap);
          let isReplace = pasteData.replaceRecordAt(0, textRecord);
          expect(isReplace).assertTrue();
          })
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_020 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_021
     * @tc.number SUB_Pasteboard_Returnvalue_044
     * @tc.desc   Test replaceRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_021 start');
      try{
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: false,
          alphaType: image.AlphaType.UNPREMUL
        };
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        image.createPixelMap(buffer, opt).then((pixelMap: image.PixelMap) => {
          let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('pixelMap', pixelMap);
          let isReplace = pasteData.replaceRecordAt(0, textRecord);
          expect(isReplace).assertTrue();
          })
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_021 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_022
     * @tc.number SUB_Pasteboard_Returnvalue_045
     * @tc.desc   Test replaceRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_022 start');
      try{
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        image.createPixelMap(buffer, opt).then((pixelMap: image.PixelMap) => {
          let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('pixelMap', pixelMap);
          let isReplace = pasteData.replaceRecordAt(0, textRecord);
          expect(isReplace).assertTrue();
          })
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_022 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_023
     * @tc.number SUB_Pasteboard_Returnvalue_046
     * @tc.desc   Test replaceRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_023 start');
      try{
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        image.createPixelMap(buffer, opt).then((pixelMap: image.PixelMap) => {
          let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('pixelMap', pixelMap);
          let isReplace = pasteData.replaceRecord(0, textRecord);
          expect(isReplace).assertTrue();
        })
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_023 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_024
     * @tc.number SUB_Pasteboard_Returnvalue_047
     * @tc.desc   Test replaceRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_024 start');
      try{
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: false,
          alphaType: image.AlphaType.UNPREMUL
        };
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        image.createPixelMap(buffer, opt).then((pixelMap: image.PixelMap) => {
          let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('pixelMap', pixelMap);
          let isReplace = pasteData.replaceRecord(0, textRecord);
          expect(isReplace).assertTrue();
          })
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_024 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Returnvalue_Abnormal_025
     * @tc.number SUB_Pasteboard_Returnvalue_048
     * @tc.desc   Test replaceRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Returnvalue_Abnormal_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_025 start');
      try{
        let buffer = new ArrayBuffer(128);
        let realSize: image.Size = { height: 3, width: 5 };
        let opt: image.InitializationOptions = {
          size: realSize,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "Hello World");
        image.createPixelMap(buffer, opt).then((pixelMap: image.PixelMap) => {
          let textRecord: pasteboard.PasteDataRecord = pasteboard.createRecord('pixelMap', pixelMap);
          let isReplace = pasteData.replaceRecord(0, textRecord);
          expect(isReplace).assertTrue();
          })
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Returnvalue_Abnormal_025 end');
      done();
    })
  });
}