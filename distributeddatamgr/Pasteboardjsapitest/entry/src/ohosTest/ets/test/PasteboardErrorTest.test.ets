/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import pasteboard from '@ohos.pasteboard';
import { BusinessError } from '@ohos.base';

export default function PasteboardErrorTest() {
  describe('PasteboardErrorTest', () => {
    console.info('start################################start');

    beforeEach(async () => {
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.clearData();
    })

    /**
     * @tc.name   getRecord12900001_002
     * @tc.number newfile3Test_012
     * @tc.desc   getRecord index out of range error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getRecord12900001_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("getRecord12900001_002 start");
      let pasteData = pasteboard.createData('text/plain', 'hello');
      try {
        pasteData.getRecord(100);
      } catch (err) {
        console.info("getRecord with out of range index error, err code: " + err.code);
        expect(err.code).assertEqual("12900001");
      }
      console.info("getRecord12900001_002 end");
      done();
    });

    /**
     * @tc.name   removeRecord12900001_002
     * @tc.number newfile3Test_017
     * @tc.desc   removeRecord index out of range error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('removeRecord12900001_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("removeRecord12900001_002 start");
      let pasteData = pasteboard.createData('text/plain', 'hello');
      try {
        pasteData.removeRecord(200);
      } catch (err) {
        console.info("removeRecord with out of range index error, err code: " + err.code);
        expect(err.code).assertEqual("12900001");
      }
      console.info("removeRecord12900001_002 end");
      done();
    });

    /**
     * @tc.name   replaceRecord12900001_002
     * @tc.number newfile3Test_019
     * @tc.desc   replaceRecord index out of range error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('replaceRecord12900001_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("replaceRecord12900001_002 start");
      let pasteData = pasteboard.createData('text/plain', 'hello');
      let record = pasteboard.createRecord('text/plain', 'world');
      try {
        pasteData.replaceRecord(300, record);
      } catch (err) {
        console.info("replaceRecord with out of range index error, err code: " + err.code);
        expect(err.code).assertEqual("12900001");
      }
      console.info("replaceRecord12900001_002 end");
      done();
    });

    /**
     * @tc.name   getDataSource12900005_001
     * @tc.number newfile3Test_024
     * @tc.desc   getDataSource no remote data error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getDataSource12900005_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("getDataSource12900005_001 start");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        let source = systemPasteboard.getDataSource();
        console.info("getDataSource is: " + source);
      } catch (err) {
        console.info("getDataSource error, err code: " + err.code);
        expect(err.code).assertEqual("12900005");
      }
      console.info("getDataSource12900005_001 end");
      done();
    });

    /**
     * @tc.name   clearDataSync12900005_001
     * @tc.number newfile3Test_028
     * @tc.desc   clearDataSync no permission error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('clearDataSync12900005_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("clearDataSync12900005_001 start");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.clearDataSync();
      } catch (err) {
        console.info("clearDataSync error, err code: " + err.code);
        expect(err.code).assertEqual("12900005");
      }
      console.info("clearDataSync12900005_001 end");
      done();
    });

    /**
     * @tc.name   setDataSync12900005_001
     * @tc.number newfile3Test_036
     * @tc.desc   setDataSync no permission error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDataSync12900005_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("setDataSync12900005_001 start");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      let pasteData = pasteboard.createData('text/plain', 'hello');
      try {
        systemPasteboard.setDataSync(pasteData);
      } catch (err) {
        console.info("setDataSync error, err code: " + err.code);
        expect(err.code).assertEqual("12900005");
      }
      console.info("setDataSync12900005_001 end");
      done();
    });

    /**
     * @tc.name   getUnifiedData201_001
     * @tc.number newfile3Test_037
     * @tc.desc   getUnifiedData no data error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getUnifiedData201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("getUnifiedData201_001 start");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.getUnifiedData();
      } catch (err) {
        console.info("getUnifiedData error, err code: " + err.code);
        expect(err.code).assertEqual("201");
      }
      console.info("getUnifiedData201_001 end");
      done();
    });

    /**
     * @tc.name   getUnifiedData27787277_002
     * @tc.number newfile3Test_038
     * @tc.desc   getUnifiedData data type error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getUnifiedData27787277_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("getUnifiedData27787277_002 start");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      let pasteData = pasteboard.createData('text/plain', 'hello');
      await systemPasteboard.setData(pasteData);
      try {
        await systemPasteboard.getUnifiedData();
      } catch (err) {
        console.info("getUnifiedData error, err code: " + err.code);
        expect(err.code).assertEqual("27787277");
      }
      console.info("getUnifiedData27787277_002 end");
      done();
    });

    /**
     * @tc.name   getUnifiedDataSync201_001
     * @tc.number newfile3Test_039
     * @tc.desc   getUnifiedDataSync no data error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getUnifiedDataSync201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("getUnifiedDataSync201_001 start");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.getUnifiedDataSync();
      } catch (err) {
        console.info("getUnifiedDataSync error, err code: " + err.code);
        expect(err.code).assertEqual("201");
      }
      console.info("getUnifiedDataSync201_001 end");
      done();
    });

    /**
     * @tc.name   getUnifiedDataSync12900005_002
     * @tc.number newfile3Test_040
     * @tc.desc   getUnifiedDataSync no permission error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getUnifiedDataSync12900005_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("getUnifiedDataSync12900005_002 start");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      let pasteData = pasteboard.createData('text/plain', 'hello');
      await systemPasteboard.setData(pasteData);
      try {
        systemPasteboard.getUnifiedDataSync();
      } catch (err) {
        console.info("getUnifiedDataSync error, err code: " + err.code);
        expect(err.code).assertEqual("12900005");
      }
      console.info("getUnifiedDataSync12900005_002 end");
      done();
    });

    /**
     * @tc.name   removeAppShareOptions201_001
     * @tc.number newfile3Test_043
     * @tc.desc   removeAppShareOptions no data error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('removeAppShareOptions201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("removeAppShareOptions201_001 start");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.removeAppShareOptions();
      } catch (err) {
        console.info("removeAppShareOptions error, err code: " + err.code);
        expect(err.code).assertEqual("201");
      }
      console.info("removeAppShareOptions201_001 end");
      done();
    });

    /**
     * @tc.name   convertToText401_001
     * @tc.number newfile3Test_047
     * @tc.desc   convertToText callback parameter type error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('convertToText401_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("convertToText401_001 start");
      let record = pasteboard.createRecord('text/plain', 'hello');
      try {
        (record as any).convertToText('invalid');
      } catch (err) {
        console.info("convertToText with invalid callback error, err code: " + err.code);
        expect(err.code).assertEqual("401");
      }
      console.info("convertToText401_001 end");
      done();
    });

    /**
     * @tc.name   hasDataSync12900005_001
     * @tc.number newfile3Test_048
     * @tc.desc   hasDataSync no permission error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hasDataSync12900005_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("hasDataSync12900005_001 start");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.hasDataSync();
      } catch (err) {
        console.info("hasDataSync error, err code: " + err.code);
        expect(err.code).assertEqual("12900005");
      }
      console.info("hasDataSync12900005_001 end");
      done();
    });

    /**
     * @tc.name   getDataSync201001
     * @tc.number newfile3Test_049
     * @tc.desc   getDataSync no data error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getDataSync201001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("getDataSync201001 start");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.getDataSync();
      } catch (err) {
        console.info("getDataSync error, err code: " + err.code);
        expect(err.code).assertEqual("201");
      }
      console.info("getDataSync201001 end");
      done();
    });

    /**
     * @tc.name   getDataSync12900005_002
     * @tc.number newfile3Test_050
     * @tc.desc   getDataSync no permission error test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getDataSync12900005_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("getDataSync12900005_002 start");
      let systemPasteboard = pasteboard.getSystemPasteboard();
      let pasteData = pasteboard.createData('text/plain', 'hello');
      await systemPasteboard.setData(pasteData);
      try {
        systemPasteboard.getDataSync();
      } catch (err) {
        console.info("getDataSync error, err code: " + err.code);
        expect(err.code).assertEqual("12900005");
      }
      console.info("getDataSync12900005_002 end");
      done();
    });
  });
}
