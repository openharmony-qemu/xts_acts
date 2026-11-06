'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';

import Utils from '../../Util.test';

import util from '@ohos.util';

class ProbeClass3 {
  tag: int = 1;
}

interface ProbeIface3 {
  tag: int;
}

function probeFn3(): int {
  return 0;
}

export default function TextDecoderCreateTest(): void {
  describe('TextDecoderCreateTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_0100
     * @tc.name testTdCreateThrows001
     * @tc.desc Verify TextDecoder.create throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let v3a13: ESObject = ESValue.wrap([0x61]);
        try {
          util.TextDecoder.create(v3a13 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3a14: ESObject = ESValue.wrap(['utf-8']);
        try {
          util.TextDecoder.create(v3a14 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3a18: ESObject = ESValue.wrap(probeFn3);
        try {
          util.TextDecoder.create(v3a18 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let obj3: ProbeIface3 = { tag: 5 };
        let v3a20: ESObject = ESValue.wrap(obj3);
        try {
          util.TextDecoder.create(v3a20 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3c1: ESObject = ESValue.Null;
        try {
          util.TextDecoder.create('utf-8', v3c1 as util.TextDecoderOptions);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3c2: ESObject = ESValue.wrapNumber(Number.NaN);
        try {
          util.TextDecoder.create('utf-8', v3c2 as util.TextDecoderOptions);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3c3: ESObject = ESValue.wrapNumber(7);
        try {
          util.TextDecoder.create('utf-8', v3c3 as util.TextDecoderOptions);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3c4: ESObject = ESValue.wrapString('utf-8');
        try {
          util.TextDecoder.create('utf-8', v3c4 as util.TextDecoderOptions);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3c5: ESObject = ESValue.wrapBoolean(true);
        try {
          util.TextDecoder.create('utf-8', v3c5 as util.TextDecoderOptions);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3c6: ESObject = ESValue.wrap([1, 2]);
        try {
          util.TextDecoder.create('utf-8', v3c6 as util.TextDecoderOptions);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_0200
     * @tc.name testTdCreateThrows002
     * @tc.desc Verify TextDecoder.create throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateThrows002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let v3c7: ESObject = ESValue.wrap(new ProbeClass3());
        try {
          util.TextDecoder.create('utf-8', v3c7 as util.TextDecoderOptions);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3c8: ESObject = ESValue.wrap(new Map<string, int>());
        try {
          util.TextDecoder.create('utf-8', v3c8 as util.TextDecoderOptions);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let opt3d: util.TextDecoderOptions = { fatal: ESValue.wrapNumber(1) as boolean };
          util.TextDecoder.create('utf-8', opt3d);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let opt3d: util.TextDecoderOptions = { fatal: ESValue.wrapNumber(0) as boolean };
          util.TextDecoder.create('utf-8', opt3d);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let opt3d: util.TextDecoderOptions = { fatal: ESValue.wrapString('true') as boolean };
          util.TextDecoder.create('utf-8', opt3d);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let opt3d: util.TextDecoderOptions = { fatal: ESValue.Null as boolean };
          util.TextDecoder.create('utf-8', opt3d);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let opt3d: util.TextDecoderOptions = { ignoreBOM: ESValue.wrapNumber(1) as boolean };
          util.TextDecoder.create('utf-8', opt3d);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let opt3d: util.TextDecoderOptions = { ignoreBOM: ESValue.wrapNumber(-1) as boolean };
          util.TextDecoder.create('utf-8', opt3d);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let opt3d: util.TextDecoderOptions = { ignoreBOM: ESValue.wrapString('yes') as boolean };
          util.TextDecoder.create('utf-8', opt3d);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let opt3d: util.TextDecoderOptions = { ignoreBOM: ESValue.Null as boolean };
          util.TextDecoder.create('utf-8', opt3d);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_0300
     * @tc.name testTdCreateThrows003
     * @tc.desc Verify TextDecoder.create throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateThrows003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let opt3f1: util.TextDecoderOptions = { fatal: true };
        let d3f1 = util.TextDecoder.create('utf-8', opt3f1);
        try {
          d3f1.decodeToString(new Uint8Array([0xFF]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let opt3f3: util.TextDecoderOptions = { fatal: true };
        let d3f3 = util.TextDecoder.create('utf-8', opt3f3);
        try {
          d3f3.decodeToString(new Uint8Array([0xED, 0xA0, 0x80]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let opt3f4: util.TextDecoderOptions = { fatal: true };
        let d3f4 = util.TextDecoder.create('utf-8', opt3f4);
        try {
          d3f4.decodeToString(new Uint8Array([0xE4, 0xBD]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let opt3f7: util.TextDecoderOptions = { fatal: true };
        let d3f7 = util.TextDecoder.create('utf-8', opt3f7);
        try {
          d3f7.decodeToString(new Uint8Array([0xFF]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        let r3f7 = d3f7.decodeToString(new Uint8Array([0x61]));
        expect(r3f7).assertEqual('a');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_0400
     * @tc.name testTdCreateFatal001
     * @tc.desc Verify TextDecoder.create with fatal option handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateFatal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dCa2 = util.TextDecoder.create();
        expect(dCa2.fatal).assertFalse();
        expect(dCa2.ignoreBOM).assertFalse();

      }
      {
        let dCa4 = util.TextDecoder.create('utf-8');
        expect(dCa4.fatal).assertFalse();
        expect(dCa4.ignoreBOM).assertFalse();

      }
      {
        let dOptA6: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dCa6 = util.TextDecoder.create('utf-8', dOptA6);
        expect(dCa6.fatal).assertTrue();
        expect(dCa6.ignoreBOM).assertTrue();

      }
      {
        let dEncU8: string | undefined = undefined;
        let dOptA8: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let dCa8 = util.TextDecoder.create(dEncU8, dOptA8);
        expect(dCa8.encoding).assertEqual('utf-8');
        expect(dCa8.fatal).assertTrue();

      }
      {
        let dOptU9: util.TextDecoderOptions | undefined = undefined;
        let dCa9 = util.TextDecoder.create('utf-8', dOptU9);
        expect(dCa9.fatal).assertFalse();
        expect(dCa9.ignoreBOM).assertFalse();

      }
      {
        let dOpt1: util.TextDecoderOptions = { fatal: true };
        let dCf1 = util.TextDecoder.create('gbk', dOpt1);
        expect(dCf1.fatal).assertTrue();
        expect(dCf1.ignoreBOM).assertFalse();

      }
      {
        let dOpt2: util.TextDecoderOptions = { ignoreBOM: true };
        let dCf2 = util.TextDecoder.create('gbk', dOpt2);
        expect(dCf2.ignoreBOM).assertTrue();
        expect(dCf2.fatal).assertFalse();

      }
      {
        let dOpt3: util.TextDecoderOptions = { fatal: false };
        let dCf3 = util.TextDecoder.create('gbk', dOpt3);
        expect(dCf3.fatal).assertFalse();

      }
      {
        let dOpt5: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let dCf5 = util.TextDecoder.create('gbk', dOpt5);
        expect(dCf5.fatal).assertTrue();
        expect(dCf5.ignoreBOM).assertFalse();

      }
      {
        let dOpt6: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let dCf6 = util.TextDecoder.create('gbk', dOpt6);
        expect(dCf6.fatal).assertFalse();
        expect(dCf6.ignoreBOM).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_0500
     * @tc.name testTdCreateFatal002
     * @tc.desc Verify TextDecoder.create with fatal option handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateFatal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dOpt7: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dCf7 = util.TextDecoder.create('gbk', dOpt7);
        expect(dCf7.fatal).assertTrue();
        expect(dCf7.ignoreBOM).assertTrue();

      }
      {
        let dOpt8: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dCf8a = util.TextDecoder.create('big5', dOpt8);
        let dCf8b = util.TextDecoder.create('big5', dOpt8);
        expect(dCf8a.fatal).assertEqual(dCf8b.fatal);

      }
      {
        let dOpt9: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let dCf9 = util.TextDecoder.create('big5', dOpt9);
        dOpt9.fatal = true;
        expect(dCf9.fatal).assertFalse();

      }
      {
        let dOpt11: util.TextDecoderOptions = { fatal: true };
        let dCopt11 = util.TextDecoder.create('big5', dOpt11);
        expect(dCopt11.fatal).assertTrue();
        expect(dOpt11.fatal).assertTrue();

      }
      {
        let dOpt13: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dCf13a = util.TextDecoder.create('big5', dOpt13);
        let dCf13b = util.TextDecoder.create('euc-jp', dOpt13);
        expect(dCf13a.fatal).assertEqual(dCf13b.fatal);
        expect(dCf13a.ignoreBOM).assertEqual(dCf13b.ignoreBOM);

      }
      {
        let dCr2 = util.TextDecoder.create('big5');
        expect(dCr2.fatal).assertFalse();

      }
      {
        let dOptT14: util.TextDecoderOptions = { fatal: true };
        let dRt14 = util.TextDecoder.create('utf-8', dOptT14);
        expect(dRt14.fatal).assertTrue();

      }
      {
        let dOptV1: util.TextDecoderOptions = { fatal: true };
        let dRv1 = util.TextDecoder.create('utf-8', dOptV1);
        expect(dRv1.encoding).assertEqual('utf-8');

      }
      {
        let dOptV2: util.TextDecoderOptions = { fatal: true };
        let dRv2 = util.TextDecoder.create('utf-16le', dOptV2);
        expect(dRv2.fatal).assertTrue();

      }
      {
        let dOptV4: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dRv4 = util.TextDecoder.create('big5', dOptV4);
        expect(dRv4.encoding).assertEqual('big5');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_0600
     * @tc.name testTdCreateFatal003
     * @tc.desc Verify TextDecoder.create with fatal option handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateFatal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dOptV5: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dRv5 = util.TextDecoder.create('big5', dOptV5);
        expect(dRv5.fatal).assertTrue();
        expect(dRv5.ignoreBOM).assertTrue();

      }
      {
        let dOptV6: util.TextDecoderOptions = { fatal: true };
        let dRv6 = util.TextDecoder.create('euc-jp', dOptV6);
        expect(dRv6.fatal).assertTrue();
        expect(dRv6.ignoreBOM).assertFalse();

      }
      {
        let dOptV7: util.TextDecoderOptions = { ignoreBOM: true };
        let dRv7 = util.TextDecoder.create('shift_jis', dOptV7);
        expect(dRv7.ignoreBOM).assertTrue();
        expect(dRv7.fatal).assertFalse();

      }
      {
        let optsGb: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let decGb = util.TextDecoder.create('gb18030', optsGb);
        expect(decGb.fatal).assertFalse();
        expect(decGb.ignoreBOM).assertFalse();

      }
      {
        let dOptV9: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dRv9 = util.TextDecoder.create('gb2312', dOptV9);
        expect(dRv9.encoding).assertEqual('gb2312');

      }
      {
        let dOptV11: util.TextDecoderOptions = { fatal: true };
        let dRv11 = util.TextDecoder.create('iso-8859-15', dOptV11);
        expect(dRv11.fatal).assertTrue();

      }
      {
        let dOptV12: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let dRv12 = util.TextDecoder.create('macintosh', dOptV12);
        expect(dRv12.fatal).assertTrue();
        expect(dRv12.ignoreBOM).assertFalse();

      }
      {
        let dOptI2: util.TextDecoderOptions = { fatal: true };
        let dRi2 = util.TextDecoder.create('big5', dOptI2);
        let dIn2: Uint8Array = new Uint8Array([0x61]);
        dRi2.decodeToString(dIn2);
        expect(dRi2.fatal).assertTrue();

      }
      {
        let dOptI4: util.TextDecoderOptions = { fatal: true };
        let dRi4 = util.TextDecoder.create('shift_jis', dOptI4);
        dOptI4.fatal = false;
        expect(dRi4.fatal).assertTrue();

      }
      {
        let dOptI6: util.TextDecoderOptions = { fatal: true };
        let dCoptI6 = util.TextDecoder.create('iso-8859-2', dOptI6);
        expect(dCoptI6.fatal).assertTrue();
        expect(dOptI6.fatal).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_0700
     * @tc.name testTdCreateFatal004
     * @tc.desc Verify TextDecoder.create with fatal option handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateFatal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dOptI9: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dRi9 = util.TextDecoder.create('utf-8', dOptI9);
        let dI9a = dRi9.fatal;
        let dI9b = dRi9.ignoreBOM;
        let dI9c = dRi9.encoding;
        expect(dI9a).assertTrue();
        expect(dI9b).assertTrue();
        expect(dI9c).assertEqual('utf-8');

      }
      {
        let dOptI10: util.TextDecoderOptions = { fatal: false };
        let dRi10 = util.TextDecoder.create('windows-1252', dOptI10);
        let dIn10: Uint8Array = new Uint8Array([0x61]);
        dRi10.decodeToString(dIn10);
        expect(dRi10.encoding).assertEqual('windows-1252');

      }
      {
        let dOptC2: util.TextDecoderOptions = { fatal: true };
        expect(util.TextDecoder.create('gbk', dOptC2).fatal).assertTrue();

      }
      {
        let dC8 = util.TextDecoder.create('utf-8');
        let dC8a = dC8.encoding;
        let dC8b = dC8.fatal;
        let dC8c = dC8.ignoreBOM;
        expect(dC8a).assertEqual('utf-8');
        expect(dC8b).assertFalse();
        expect(dC8c).assertFalse();

      }
      {
        let dRs4a = util.TextDecoder.create('utf-8');
        let dRs4b = util.TextDecoder.create('utf-8');
        expect(dRs4a.fatal).assertEqual(dRs4b.fatal);
        expect(dRs4a.fatal).assertFalse();

      }
      {
        let dOptS5a: util.TextDecoderOptions = { fatal: true };
        let dOptS5b: util.TextDecoderOptions = { fatal: false };
        let dRs5a = util.TextDecoder.create('utf-8', dOptS5a);
        let dRs5b = util.TextDecoder.create('utf-8', dOptS5b);
        expect(dRs5a.fatal).assertTrue();
        expect(dRs5b.fatal).assertFalse();

      }
      {
        let dOptS7: util.TextDecoderOptions = { fatal: true };
        let dRs7a = util.TextDecoder.create('utf-8', dOptS7);
        let dRs7b = util.TextDecoder.create('utf-8', dOptS7);
        dOptS7.fatal = false;
        expect(dRs7a.fatal).assertTrue();
        expect(dRs7b.fatal).assertTrue();

      }
      {
        let dOptS11: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dRs11a = util.TextDecoder.create('utf-8', dOptS11);
        let dRs11b = util.TextDecoder.create('utf-8', dOptS11);
        expect(dRs11a.encoding).assertEqual(dRs11b.encoding);
        expect(dRs11a.fatal).assertEqual(dRs11b.fatal);
        expect(dRs11a.ignoreBOM).assertEqual(dRs11b.ignoreBOM);

      }
      {
        let dOptS12a: util.TextDecoderOptions = { fatal: true };
        let dOptS12b: util.TextDecoderOptions = { fatal: false };
        let dRs12a = util.TextDecoder.create('utf-16le', dOptS12a);
        let dRs12b = util.TextDecoder.create('utf-16le', dOptS12b);
        expect(dRs12a.fatal).not().assertEqual(dRs12b.fatal);
        expect(dRs12a.fatal).assertTrue();
        expect(dRs12b.fatal).assertFalse();

      }
      {
        let opt3e8: util.TextDecoderOptions = { fatal: undefined };
        let d3e8 = util.TextDecoder.create('utf-8', opt3e8);
        expect(d3e8.fatal).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_0800
     * @tc.name testTdCreateFatal005
     * @tc.desc Verify TextDecoder.create with fatal option handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateFatal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let opt3f2: util.TextDecoderOptions = { fatal: false };
        let d3f2 = util.TextDecoder.create('utf-8', opt3f2);
        let r3f2 = d3f2.decodeToString(new Uint8Array([0xFF]));
        expect(r3f2).assertEqual('�');

      }
      {
        let opt3f9: util.TextDecoderOptions = { fatal: false };
        let d3f9 = util.TextDecoder.create('utf-8', opt3f9);
        let r3f9 = d3f9.decodeToString(new Uint8Array([0xFF, 0xFE, 0x80]));
        expect(r3f9).assertEqual('���');

      }
      {
        let opt3f10: util.TextDecoderOptions = { fatal: true };
        let d3f10 = util.TextDecoder.create('utf-8', opt3f10);
        let r3f10 = d3f10.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]));
        expect(r3f10).assertEqual('你');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_0900
     * @tc.name testTdCreateBom001
     * @tc.desc Verify TextDecoder.create with ignoreBOM and BOM handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateBom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dOpt4: util.TextDecoderOptions = { ignoreBOM: false };
        let dCf4 = util.TextDecoder.create('gbk', dOpt4);
        expect(dCf4.ignoreBOM).assertFalse();

      }
      {
        let dOpt10: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let dCf10 = util.TextDecoder.create('big5', dOpt10);
        dOpt10.ignoreBOM = true;
        expect(dCf10.ignoreBOM).assertFalse();

      }
      {
        let dOpt12: util.TextDecoderOptions = { ignoreBOM: true };
        let dCopt12 = util.TextDecoder.create('big5', dOpt12);
        expect(dCopt12.ignoreBOM).assertTrue();
        expect(dOpt12.ignoreBOM).assertTrue();

      }
      {
        let dCr3 = util.TextDecoder.create('big5');
        expect(dCr3.ignoreBOM).assertFalse();

      }
      {
        let dRt16 = util.TextDecoder.create('koi8-r');
        expect(dRt16.ignoreBOM).assertFalse();

      }
      {
        let dOptV3: util.TextDecoderOptions = { ignoreBOM: true };
        let dRv3 = util.TextDecoder.create('utf-16be', dOptV3);
        expect(dRv3.ignoreBOM).assertTrue();

      }
      {
        let dOptV10: util.TextDecoderOptions = { ignoreBOM: true };
        let dRv10 = util.TextDecoder.create('koi8-u', dOptV10);
        expect(dRv10.ignoreBOM).assertTrue();

      }
      {
        let dOptI3: util.TextDecoderOptions = { ignoreBOM: true };
        let dRi3 = util.TextDecoder.create('euc-jp', dOptI3);
        let dIn3: Uint8Array = new Uint8Array([0x61]);
        dRi3.decodeToString(dIn3);
        expect(dRi3.ignoreBOM).assertTrue();

      }
      {
        let dOptI5: util.TextDecoderOptions = { ignoreBOM: true };
        let dRi5 = util.TextDecoder.create('gb18030', dOptI5);
        dOptI5.ignoreBOM = false;
        expect(dRi5.ignoreBOM).assertTrue();

      }
      {
        let dOptI7: util.TextDecoderOptions = { ignoreBOM: true };
        let dCoptI7 = util.TextDecoder.create('iso-8859-10', dOptI7);
        expect(dCoptI7.ignoreBOM).assertTrue();
        expect(dOptI7.ignoreBOM).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_1000
     * @tc.name testTdCreateBom002
     * @tc.desc Verify TextDecoder.create with ignoreBOM and BOM handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateBom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dOptC3: util.TextDecoderOptions = { ignoreBOM: true };
        expect(util.TextDecoder.create('big5', dOptC3).ignoreBOM).assertTrue();

      }
      {
        let dOptS6a: util.TextDecoderOptions = { ignoreBOM: true };
        let dOptS6b: util.TextDecoderOptions = { ignoreBOM: false };
        let dRs6a = util.TextDecoder.create('utf-8', dOptS6a);
        let dRs6b = util.TextDecoder.create('utf-8', dOptS6b);
        expect(dRs6a.ignoreBOM).assertTrue();
        expect(dRs6b.ignoreBOM).assertFalse();

      }
      {
        let opt3f5: util.TextDecoderOptions = { ignoreBOM: true };
        let d3f5 = util.TextDecoder.create('utf-8', opt3f5);
        let r3f5 = d3f5.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(r3f5).assertEqual('a');

      }
      {
        let opt3f6: util.TextDecoderOptions = { ignoreBOM: false };
        let d3f6 = util.TextDecoder.create('utf-8', opt3f6);
        let r3f6 = d3f6.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(r3f6).assertEqual('\uFEFFa');

      }
      {
        let opt3f8: util.TextDecoderOptions = { ignoreBOM: true };
        let d3f8 = util.TextDecoder.create('utf-16le', opt3f8);
        let r3f8 = d3f8.decodeToString(new Uint8Array([0xFF, 0xFE, 0x41, 0x00]));
        expect(r3f8).assertEqual('A');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_1100
     * @tc.name testTdCreateEncoding001
     * @tc.desc Verify TextDecoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dCa1 = util.TextDecoder.create();
        expect(dCa1.encoding).assertEqual('utf-8');

      }
      {
        let dCa3 = util.TextDecoder.create('utf-8');
        expect(dCa3.encoding).assertEqual('utf-8');

      }
      {
        let dOptA5: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dCa5 = util.TextDecoder.create('utf-8', dOptA5);
        expect(dCa5.encoding).assertEqual('utf-8');

      }
      {
        let dEncU7: string | undefined = undefined;
        let dCa7 = util.TextDecoder.create(dEncU7);
        expect(dCa7.encoding).assertEqual('utf-8');

      }
      {
        let dOptE10: util.TextDecoderOptions = {};
        let dCa10 = util.TextDecoder.create('utf-8', dOptE10);
        expect(dCa10.fatal).assertFalse();
        expect(dCa10.ignoreBOM).assertFalse();

      }
      {
        let dCa11a = util.TextDecoder.create();
        let dCa11b = new util.TextDecoder();
        expect(dCa11a.encoding).assertEqual(dCa11b.encoding);

      }
      {
        let dCe1 = util.TextDecoder.create('big5');
        expect(dCe1.encoding).assertEqual('big5');

      }
      {
        let dCe2 = util.TextDecoder.create('gb18030');
        expect(dCe2.encoding).assertEqual('gb18030');

      }
      {
        let dCe3 = util.TextDecoder.create('utf-16be');
        expect(dCe3.encoding).assertEqual('utf-16be');

      }
      {
        let dCe4 = util.TextDecoder.create('utf-16le');
        expect(dCe4.encoding).assertEqual('utf-16le');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_1200
     * @tc.name testTdCreateEncoding002
     * @tc.desc Verify TextDecoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dCe5 = util.TextDecoder.create('gb2312');
        expect(dCe5.encoding).assertEqual('gb2312');

      }
      {
        let dCe6 = util.TextDecoder.create('iso-8859-1');
        expect(dCe6.encoding).assertEqual('iso-8859-1');

      }
      {
        let dCe7 = util.TextDecoder.create('iso-8859-2');
        expect(dCe7.encoding).assertEqual('iso-8859-2');

      }
      {
        let dCe8 = util.TextDecoder.create('iso-8859-3');
        expect(dCe8.encoding).assertEqual('iso-8859-3');

      }
      {
        let dCe9 = util.TextDecoder.create('iso-8859-4');
        expect(dCe9.encoding).assertEqual('iso-8859-4');

      }
      {
        let dCe10 = util.TextDecoder.create('iso-8859-5');
        expect(dCe10.encoding).assertEqual('iso-8859-5');

      }
      {
        let dCe11 = util.TextDecoder.create('iso-8859-6');
        expect(dCe11.encoding).assertEqual('iso-8859-6');

      }
      {
        let dCe12 = util.TextDecoder.create('iso-8859-7');
        expect(dCe12.encoding).assertEqual('iso-8859-7');

      }
      {
        let dCe13 = util.TextDecoder.create('iso-8859-8');
        expect(dCe13.encoding).assertEqual('iso-8859-8');

      }
      {
        let dCe14 = util.TextDecoder.create('iso-8859-8-i');
        expect(dCe14.encoding).assertEqual('iso-8859-8-i');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_1300
     * @tc.name testTdCreateEncoding003
     * @tc.desc Verify TextDecoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dCe15 = util.TextDecoder.create('iso-8859-10');
        expect(dCe15.encoding).assertEqual('iso-8859-10');

      }
      {
        let dCe16 = util.TextDecoder.create('iso-8859-13');
        expect(dCe16.encoding).assertEqual('iso-8859-13');

      }
      {
        let dCe17 = util.TextDecoder.create('iso-8859-14');
        expect(dCe17.encoding).assertEqual('iso-8859-14');

      }
      {
        let dCe18 = util.TextDecoder.create('iso-8859-15');
        expect(dCe18.encoding).assertEqual('iso-8859-15');

      }
      {
        let dCe19 = util.TextDecoder.create('koi8-r');
        expect(dCe19.encoding).assertEqual('koi8-r');

      }
      {
        let dCe20 = util.TextDecoder.create('koi8-u');
        expect(dCe20.encoding).assertEqual('koi8-u');

      }
      {
        let dCe21 = util.TextDecoder.create('macintosh');
        expect(dCe21.encoding).assertEqual('macintosh');

      }
      {
        let dCe22 = util.TextDecoder.create('windows-874');
        expect(dCe22.encoding).assertEqual('windows-874');

      }
      {
        let dCe23 = util.TextDecoder.create('windows-1250');
        expect(dCe23.encoding).assertEqual('windows-1250');

      }
      {
        let dCe24 = util.TextDecoder.create('windows-1251');
        expect(dCe24.encoding).assertEqual('windows-1251');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_1400
     * @tc.name testTdCreateEncoding004
     * @tc.desc Verify TextDecoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dCe25 = util.TextDecoder.create('windows-1252');
        expect(dCe25.encoding).assertEqual('windows-1252');

      }
      {
        let dCe26 = util.TextDecoder.create('windows-1253');
        expect(dCe26.encoding).assertEqual('windows-1253');

      }
      {
        let dCe27 = util.TextDecoder.create('windows-1254');
        expect(dCe27.encoding).assertEqual('windows-1254');

      }
      {
        let dCe28 = util.TextDecoder.create('windows-1255');
        expect(dCe28.encoding).assertEqual('windows-1255');

      }
      {
        let dCe29 = util.TextDecoder.create('windows-1256');
        expect(dCe29.encoding).assertEqual('windows-1256');

      }
      {
        let dCe30 = util.TextDecoder.create('windows-1257');
        expect(dCe30.encoding).assertEqual('windows-1257');

      }
      {
        let dCe31 = util.TextDecoder.create('windows-1258');
        expect(dCe31.encoding).assertEqual('windows-1258');

      }
      {
        let dCe32 = util.TextDecoder.create('x-mac-cyrillic');
        expect(dCe32.encoding).assertEqual('x-mac-cyrillic');

      }
      {
        let dCe33 = util.TextDecoder.create('gbk');
        expect(dCe33.encoding).assertEqual('gbk');

      }
      {
        let dCe34 = util.TextDecoder.create('euc-jp');
        expect(dCe34.encoding).assertEqual('euc-jp');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_1500
     * @tc.name testTdCreateEncoding005
     * @tc.desc Verify TextDecoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dCe35 = util.TextDecoder.create('iso-2022-jp');
        expect(dCe35.encoding).assertEqual('iso-2022-jp');

      }
      {
        let dCe36 = util.TextDecoder.create('shift_jis');
        expect(dCe36.encoding).assertEqual('shift_jis');

      }
      {
        let dCe37 = util.TextDecoder.create('euc-kr');
        expect(dCe37.encoding).assertEqual('euc-kr');

      }
      {
        let dCe38 = util.TextDecoder.create('ibm866');
        expect(dCe38.encoding).assertEqual('ibm866');

      }
      {
        let dCc4 = util.TextDecoder.create(' utf-8');
        expect(dCc4.encoding).assertEqual(' utf-8');

      }
      {
        let dCc5 = util.TextDecoder.create('utf-8 ');
        expect(dCc5.encoding).assertEqual('utf-8 ');

      }
      {
        let dCc6 = util.TextDecoder.create('utf8');
        expect(dCc6.encoding).assertEqual('utf8');

      }
      {
        let dCc7 = util.TextDecoder.create('latin1');
        expect(dCc7.encoding).assertEqual('latin1');

      }
      {
        let dCc8 = util.TextDecoder.create('ascii');
        expect(dCc8.encoding).assertEqual('ascii');

      }
      {
        let dCc9 = util.TextDecoder.create('');
        expect(dCc9.encoding).assertEqual('utf-8');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_1600
     * @tc.name testTdCreateEncoding006
     * @tc.desc Verify TextDecoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dCd1 = util.TextDecoder.create('utf-8');
        let dBytes1: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let dRet1 = dCd1.decodeToString(dBytes1);
        expect(dRet1).assertEqual('你好');

      }
      {
        let dCd2 = util.TextDecoder.create('utf-16le');
        let dBytes2: Uint8Array = new Uint8Array([0x41, 0x00, 0x42, 0x00]);
        let dRet2 = dCd2.decodeToString(dBytes2);
        expect(dRet2).assertEqual('AB');

      }
      {
        let dCd3 = util.TextDecoder.create('gbk');
        let dBytes3: Uint8Array = new Uint8Array([0xC4, 0xE3, 0xBA, 0xC3]);
        let dRet3 = dCd3.decodeToString(dBytes3);
        expect(dRet3).assertEqual('你好');

      }
      {
        let dCd4 = util.TextDecoder.create('utf-8');
        let dBytes4: Uint8Array = new Uint8Array([0xF0, 0x9F, 0x98, 0x80]);
        let dRet4 = dCd4.decodeToString(dBytes4);
        expect(dRet4).assertEqual('😀');

      }
      {
        let dCd5 = util.TextDecoder.create('big5');
        let dBytes5: Uint8Array = new Uint8Array([0xA4, 0xA4, 0xA6, 0x6E]);
        let dRet5 = dCd5.decodeToString(dBytes5);
        expect(dRet5).assertEqual('中好');

      }
      {
        let dCd6 = util.TextDecoder.create('euc-jp');
        let dBytes6: Uint8Array = new Uint8Array([0xC6, 0xFC, 0xC6, 0xFD]);
        let dRet6 = dCd6.decodeToString(dBytes6);
        expect(dRet6).assertEqual('日乳');

      }
      {
        let dCr4 = util.TextDecoder.create('utf-16be');
        expect(dCr4.encoding.length).assertEqual(8);

      }
      {
        let dCr5 = util.TextDecoder.create('iso-8859-8-i');
        expect(dCr5.encoding.length).assertEqual(12);

      }
      {
        let dCr6 = util.TextDecoder.create('windows-1258');
        expect(dCr6.encoding.length).assertEqual(12);

      }
      {
        let dCr7 = util.TextDecoder.create('x-mac-cyrillic');
        expect(dCr7.encoding.length).assertEqual(14);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_1700
     * @tc.name testTdCreateEncoding007
     * @tc.desc Verify TextDecoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateEncoding007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dA8 = util.TextDecoder.create('gbk').encoding;
        let dB8 = util.TextDecoder.create('gbk').encoding;
        expect(dA8).assertEqual('gbk');
        expect(dB8).assertEqual('gbk');

      }
      {
        let dCr9a = util.TextDecoder.create('utf-16le');
        let dCr9b = util.TextDecoder.create('utf-16le');
        expect(dCr9a.encoding).assertEqual(dCr9b.encoding);

      }
      {
        let dRt3 = util.TextDecoder.create('utf-8');
        expect(dRt3.encoding).assertEqual('utf-8');

      }
      {
        let dRt4 = util.TextDecoder.create();
        expect(dRt4.encoding).assertEqual('utf-8');

      }
      {
        let dRt5 = util.TextDecoder.create('gbk');
        expect(dRt5.encoding).assertEqual('gbk');

      }
      {
        let dRt6 = util.TextDecoder.create('big5');
        expect(dRt6.encoding).assertEqual('big5');

      }
      {
        let dRt7 = util.TextDecoder.create('utf-16le');
        expect(dRt7.encoding).assertEqual('utf-16le');

      }
      {
        let dRt8 = util.TextDecoder.create('utf-16be');
        expect(dRt8.encoding).assertEqual('utf-16be');

      }
      {
        let dRt9 = util.TextDecoder.create('euc-jp');
        expect(dRt9.encoding).assertEqual('euc-jp');

      }
      {
        let dRt10 = util.TextDecoder.create('shift_jis');
        expect(dRt10.encoding).assertEqual('shift_jis');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_1800
     * @tc.name testTdCreateEncoding008
     * @tc.desc Verify TextDecoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateEncoding008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dRt11 = util.TextDecoder.create('gb18030');
        expect(dRt11.encoding).assertEqual('gb18030');

      }
      {
        let dRt12 = util.TextDecoder.create('iso-8859-1');
        expect(dRt12.encoding).assertEqual('iso-8859-1');

      }
      {
        let dRt13 = util.TextDecoder.create('windows-1252');
        expect(dRt13.encoding).assertEqual('windows-1252');

      }
      {
        let dRl1 = util.TextDecoder.create('gbk');
        expect(dRl1.encoding.length).assertEqual(3);

      }
      {
        let dRl2 = util.TextDecoder.create('big5');
        expect(dRl2.encoding.length).assertEqual(4);

      }
      {
        let dRl3 = util.TextDecoder.create('utf-8');
        expect(dRl3.encoding.length).assertEqual(5);

      }
      {
        let dRl4 = util.TextDecoder.create('euc-jp');
        expect(dRl4.encoding.length).assertEqual(6);

      }
      {
        let dRl5 = util.TextDecoder.create('gb2312');
        expect(dRl5.encoding.length).assertEqual(6);

      }
      {
        let dRl6 = util.TextDecoder.create('gb18030');
        expect(dRl6.encoding.length).assertEqual(7);

      }
      {
        let dRl7 = util.TextDecoder.create('utf-16le');
        expect(dRl7.encoding.length).assertEqual(8);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_1900
     * @tc.name testTdCreateEncoding009
     * @tc.desc Verify TextDecoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateEncoding009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dRl8 = util.TextDecoder.create('shift_jis');
        expect(dRl8.encoding.length).assertEqual(9);

      }
      {
        let dRl9 = util.TextDecoder.create('macintosh');
        expect(dRl9.encoding.length).assertEqual(9);

      }
      {
        let dRl10 = util.TextDecoder.create('iso-8859-1');
        expect(dRl10.encoding.length).assertEqual(10);

      }
      {
        let dRl11 = util.TextDecoder.create('iso-8859-15');
        expect(dRl11.encoding.length).assertEqual(11);

      }
      {
        let dRl12 = util.TextDecoder.create('windows-1250');
        expect(dRl12.encoding.length).assertEqual(12);

      }
      {
        let dRl13 = util.TextDecoder.create('iso-8859-10');
        expect(dRl13.encoding.length).assertEqual(11);

      }
      {
        let dRl14 = util.TextDecoder.create('koi8-r');
        expect(dRl14.encoding.length).assertEqual(6);

      }
      {
        let dRi1 = util.TextDecoder.create('utf-16le');
        let dIn1: Uint8Array = new Uint8Array([0x41, 0x00]);
        dRi1.decodeToString(dIn1);
        expect(dRi1.encoding).assertEqual('utf-16le');

      }
      {
        let dRi8 = util.TextDecoder.create('utf-8');
        let dIn8: Uint8Array = new Uint8Array([0x61]);
        let dOut8 = dRi8.decodeToString(dIn8);
        expect(dOut8).assertEqual('a');
        expect(dRi8.encoding).assertEqual('utf-8');

      }
      {
        expect(util.TextDecoder.create('utf-8').encoding).assertEqual('utf-8');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_2000
     * @tc.name testTdCreateEncoding010
     * @tc.desc Verify TextDecoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateEncoding010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dInC4: Uint8Array = new Uint8Array([0x61]);
        expect(util.TextDecoder.create('utf-8').decodeToString(dInC4)).assertEqual('a');

      }
      {
        let dEncC5 = util.TextDecoder.create('utf-8').encoding;
        let dNc5 = util.TextDecoder.create(dEncC5);
        expect(dNc5.encoding).assertEqual('utf-8');

      }
      {
        expect(util.TextDecoder.create('utf-16le').encoding).assertEqual('utf-16le');

      }
      {
        expect(util.TextDecoder.create('euc-jp').encoding).assertEqual('euc-jp');

      }
      {
        let dRs1a = util.TextDecoder.create('utf-8');
        let dRs1b = util.TextDecoder.create('utf-8');
        expect(dRs1a).not().assertEqual(dRs1b);

      }
      {
        let dRs2a = util.TextDecoder.create('utf-8');
        let dRs2b = util.TextDecoder.create('utf-8');
        expect(dRs2a.encoding).assertEqual(dRs2b.encoding);

      }
      {
        let dRs3a = util.TextDecoder.create('utf-8');
        let dRs3b = util.TextDecoder.create('gbk');
        expect(dRs3a.encoding).not().assertEqual(dRs3b.encoding);
        expect(dRs3a.encoding).assertEqual('utf-8');
        expect(dRs3b.encoding).assertEqual('gbk');

      }
      {
        let dRs9 = util.TextDecoder.create('utf-8');
        util.TextDecoder.create('gbk');
        util.TextDecoder.create('big5');
        expect(dRs9.encoding).assertEqual('utf-8');

      }
      {
        let dRs10a = util.TextDecoder.create('utf-16le');
        let dRs10b = util.TextDecoder.create('gb18030');
        expect(dRs10a.encoding).assertEqual('utf-16le');
        expect(dRs10b.encoding).assertEqual('gb18030');

      }
      {
        let v3a1: ESObject = ESValue.Null;
        try {
          util.TextDecoder.create(v3a1 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_2100
     * @tc.name testTdCreateEncoding011
     * @tc.desc Verify TextDecoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateEncoding011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let v3a2: ESObject = ESValue.wrapNumber(-1);
        try {
          util.TextDecoder.create(v3a2 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3a3: ESObject = ESValue.wrapNumber(-0);
        try {
          util.TextDecoder.create(v3a3 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3a4: ESObject = ESValue.wrapBoolean(true);
        try {
          util.TextDecoder.create(v3a4 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3a5: ESObject = ESValue.wrapBoolean(false);
        try {
          util.TextDecoder.create(v3a5 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3a6: ESObject = ESValue.wrapNumber(3.14);
        try {
          util.TextDecoder.create(v3a6 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3a7: ESObject = ESValue.wrapNumber(Double.MAX_VALUE);
        try {
          util.TextDecoder.create(v3a7 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3a8: ESObject = ESValue.wrapNumber(Double.MIN_VALUE);
        try {
          util.TextDecoder.create(v3a8 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3a9: ESObject = ESValue.wrapNumber(Number.NaN);
        try {
          util.TextDecoder.create(v3a9 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3a10: ESObject = ESValue.wrapNumber(Number.POSITIVE_INFINITY);
        try {
          util.TextDecoder.create(v3a10 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3a11: ESObject = ESValue.wrapNumber(-Number.POSITIVE_INFINITY);
        try {
          util.TextDecoder.create(v3a11 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_2200
     * @tc.name testTdCreateEncoding012
     * @tc.desc Verify TextDecoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateEncoding012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let v3a12: ESObject = ESValue.wrapBigInt(BigInt(1));
        try {
          util.TextDecoder.create(v3a12 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3a15: ESObject = ESValue.wrap(new ProbeClass3());
        try {
          util.TextDecoder.create(v3a15 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3a16: ESObject = ESValue.wrap(new Date());
        try {
          util.TextDecoder.create(v3a16 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3a17: ESObject = ESValue.wrap(new Map<string, int>());
        try {
          util.TextDecoder.create(v3a17 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let v3a19: ESObject = ESValue.wrap(new Uint8Array([0x61, 0x62]));
        try {
          util.TextDecoder.create(v3a19 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CREATE_2300
     * @tc.name testTdCreateBasic001
     * @tc.desc Verify TextDecoder.create with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCreateBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dCa12 = util.TextDecoder.create('utf-8');
        let dBytes12: Uint8Array = new Uint8Array([0x61]);
        let dRet12 = dCa12.decodeToString(dBytes12);
        expect(dRet12).assertEqual('a');

      }
      {
        let dRs8a = util.TextDecoder.create('utf-16le');
        let dRs8b = util.TextDecoder.create('utf-16le');
        let dIn8a: Uint8Array = new Uint8Array([0x41, 0x00]);
        let dIn8b: Uint8Array = new Uint8Array([0x42, 0x00]);
        let dOut8a = dRs8a.decodeToString(dIn8a);
        let dOut8b = dRs8b.decodeToString(dIn8b);
        expect(dOut8a).assertEqual('A');
        expect(dOut8b).assertEqual('B');

      }
      {
        let opt3e7: util.TextDecoderOptions = { fatal: undefined, ignoreBOM: undefined };
        let d3e7 = util.TextDecoder.create('utf-8', opt3e7);
        expect(d3e7.fatal).assertFalse();
        expect(d3e7.ignoreBOM).assertFalse();

      }
    });

  });
}
