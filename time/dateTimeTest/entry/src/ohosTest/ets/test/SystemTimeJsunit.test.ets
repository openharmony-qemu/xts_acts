/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import systemTime from "@ohos.systemTime";
import { BusinessError } from '@ohos.base';

export default function systemTimeJsunit() {
  describe('systemTimeTest', () => {
    console.info('====>---------------systemTimeTest start-----------------------');

    /**
     * @tc.name   SUB_systemTime_getCurrentTime_JS_API_0100
     * @tc.number SUB_systemTime_getCurrentTime_JS_API_0100
     * @tc.desc   Test getCurrentTime callback with isNano null, expect success (null coerced to false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_getCurrentTime_JS_API_0100", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_getCurrentTime_JS_API_0100 start----------------");
      try {
        let isNano: boolean | null = null;
        systemTime.getCurrentTime(isNano, (error, data) => {
          if (error) {
            expect().assertFail();
          } else {
            expect(data != null).assertEqual(true);
          }
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
      console.info("====>----------SUB_systemTime_getCurrentTime_JS_API_0100 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_getCurrentTime_JS_API_0200
     * @tc.number SUB_systemTime_getCurrentTime_JS_API_0200
     * @tc.desc   Test getCurrentTime callback with isNano undefined, expect success (undefined coerced to false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_getCurrentTime_JS_API_0200", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_getCurrentTime_JS_API_0200 start----------------");
      try {
        let isNano: boolean | undefined = undefined;
        systemTime.getCurrentTime(isNano, (error, data) => {
          if (error) {
            expect().assertFail();
          } else {
            expect(data != null).assertEqual(true);
          }
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
      console.info("====>----------SUB_systemTime_getCurrentTime_JS_API_0200 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_getCurrentTime_JS_API_0300
     * @tc.number SUB_systemTime_getCurrentTime_JS_API_0300
     * @tc.desc   Test getCurrentTime promise with isNano null, expect success (null coerced to false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_getCurrentTime_JS_API_0300", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_getCurrentTime_JS_API_0300 start----------------");
      try {
        let isNano: boolean | null = null;
        await systemTime.getCurrentTime(isNano).then((data) => {
          expect(data != null).assertEqual(true);
          done();
        }).catch((error: BusinessError) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
      console.info("====>----------SUB_systemTime_getCurrentTime_JS_API_0300 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_getCurrentTime_JS_API_0400
     * @tc.number SUB_systemTime_getCurrentTime_JS_API_0400
     * @tc.desc   Test getCurrentTime promise with isNano undefined, expect success (default false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_getCurrentTime_JS_API_0400", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_getCurrentTime_JS_API_0400 start----------------");
      try {
        let isNano: boolean | undefined = undefined;
        await systemTime.getCurrentTime(isNano).then((data) => {
          expect(data != null).assertEqual(true);
          done();
        }).catch((error: BusinessError) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
      console.info("====>----------SUB_systemTime_getCurrentTime_JS_API_0400 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_getRealActiveTime_JS_API_0100
     * @tc.number SUB_systemTime_getRealActiveTime_JS_API_0100
     * @tc.desc   Test getRealActiveTime callback with isNano null, expect success (null coerced to false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_getRealActiveTime_JS_API_0100", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_getRealActiveTime_JS_API_0100 start----------------");
      try {
        let isNano: boolean | null = null;
        systemTime.getRealActiveTime(isNano, (error, data) => {
          if (error) {
            expect().assertFail();
          } else {
            expect(data != null).assertEqual(true);
          }
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
      console.info("====>----------SUB_systemTime_getRealActiveTime_JS_API_0100 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_getRealActiveTime_JS_API_0200
     * @tc.number SUB_systemTime_getRealActiveTime_JS_API_0200
     * @tc.desc   Test getRealActiveTime callback with isNano undefined, expect success (undefined coerced to false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_getRealActiveTime_JS_API_0200", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_getRealActiveTime_JS_API_0200 start----------------");
      try {
        let isNano: boolean | undefined = undefined;
        systemTime.getRealActiveTime(isNano, (error, data) => {
          if (error) {
            expect().assertFail();
          } else {
            expect(data != null).assertEqual(true);
          }
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
      console.info("====>----------SUB_systemTime_getRealActiveTime_JS_API_0200 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_getRealActiveTime_JS_API_0300
     * @tc.number SUB_systemTime_getRealActiveTime_JS_API_0300
     * @tc.desc   Test getRealActiveTime promise with isNano null, expect success (null coerced to false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_getRealActiveTime_JS_API_0300", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_getRealActiveTime_JS_API_0300 start----------------");
      try {
        let isNano: boolean | null = null;
        await systemTime.getRealActiveTime(isNano).then((data) => {
          expect(data != null).assertEqual(true);
          done();
        }).catch((error: BusinessError) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
      console.info("====>----------SUB_systemTime_getRealActiveTime_JS_API_0300 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_getRealActiveTime_JS_API_0400
     * @tc.number SUB_systemTime_getRealActiveTime_JS_API_0400
     * @tc.desc   Test getRealActiveTime promise with isNano undefined, expect success (default false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_getRealActiveTime_JS_API_0400", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_getRealActiveTime_JS_API_0400 start----------------");
      try {
        let isNano: boolean | undefined = undefined;
        await systemTime.getRealActiveTime(isNano).then((data) => {
          expect(data != null).assertEqual(true);
          done();
        }).catch((error: BusinessError) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
      console.info("====>----------SUB_systemTime_getRealActiveTime_JS_API_0400 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_getRealTime_JS_API_0100
     * @tc.number SUB_systemTime_getRealTime_JS_API_0100
     * @tc.desc   Test getRealTime callback with isNano null, expect success (null coerced to false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_getRealTime_JS_API_0100", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_getRealTime_JS_API_0100 start----------------");
      try {
        let isNano: boolean | null = null;
        systemTime.getRealTime(isNano, (error, data) => {
          if (error) {
            expect().assertFail();
          } else {
            expect(data != null).assertEqual(true);
          }
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
      console.info("====>----------SUB_systemTime_getRealTime_JS_API_0100 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_getRealTime_JS_API_0200
     * @tc.number SUB_systemTime_getRealTime_JS_API_0200
     * @tc.desc   Test getRealTime callback with isNano undefined, expect success (undefined coerced to false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_getRealTime_JS_API_0200", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_getRealTime_JS_API_0200 start----------------");
      try {
        let isNano: boolean | undefined = undefined;
        systemTime.getRealTime(isNano, (error, data) => {
          if (error) {
            expect().assertFail();
          } else {
            expect(data != null).assertEqual(true);
          }
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
      console.info("====>----------SUB_systemTime_getRealTime_JS_API_0200 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_getRealTime_JS_API_0300
     * @tc.number SUB_systemTime_getRealTime_JS_API_0300
     * @tc.desc   Test getRealTime promise with isNano null, expect success (null coerced to false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_getRealTime_JS_API_0300", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_getRealTime_JS_API_0300 start----------------");
      try {
        let isNano: boolean | null = null;
        await systemTime.getRealTime(isNano).then((data) => {
          expect(data != null).assertEqual(true);
          done();
        }).catch((error: BusinessError) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
      console.info("====>----------SUB_systemTime_getRealTime_JS_API_0300 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_getRealTime_JS_API_0400
     * @tc.number SUB_systemTime_getRealTime_JS_API_0400
     * @tc.desc   Test getRealTime promise with isNano undefined, expect success (default false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_getRealTime_JS_API_0400", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_getRealTime_JS_API_0400 start----------------");
      try {
        let isNano: boolean | undefined = undefined;
        await systemTime.getRealTime(isNano).then((data) => {
          expect(data != null).assertEqual(true);
          done();
        }).catch((error: BusinessError) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
      console.info("====>----------SUB_systemTime_getRealTime_JS_API_0400 end-----------------");
    });

  });
};
