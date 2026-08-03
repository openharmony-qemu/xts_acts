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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysFillTest07(): void {
  describe('TypedUArraysFillTest07', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0100
     * @tc.name testTypedUArraysFillTestFileG001
     * @tc.desc Verify fill value 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0200
     * @tc.name testTypedUArraysFillTestFileG002
     * @tc.desc Verify start -1 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, -1);
      const val0 = result[0];
      expect(val0).assertEqual(1);
      const val1 = result[1];
      expect(val1).assertEqual(2);
      const val2 = result[2];
      expect(val2).assertEqual(3);
      const val3 = result[3];
      expect(val3).assertEqual(4);
      const val4 = result[4];
      expect(val4).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0300
     * @tc.name testTypedUArraysFillTestFileG003
     * @tc.desc Verify start -1 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, -1);
      const val5 = result[0];
      expect(val5).assertEqual(1);
      const val6 = result[1];
      expect(val6).assertEqual(2);
      const val7 = result[2];
      expect(val7).assertEqual(3);
      const val8 = result[3];
      expect(val8).assertEqual(4);
      const val9 = result[4];
      expect(val9).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0400
     * @tc.name testTypedUArraysFillTestFileG004
     * @tc.desc Verify start -1 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, -1);
      const val10 = result[0];
      expect(val10).assertEqual(1);
      const val11 = result[1];
      expect(val11).assertEqual(2);
      const val12 = result[2];
      expect(val12).assertEqual(3);
      const val13 = result[3];
      expect(val13).assertEqual(4);
      const val14 = result[4];
      expect(val14).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0500
     * @tc.name testTypedUArraysFillTestFileG005
     * @tc.desc Verify start -1 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(99, -1);
      const val15 = result[0];
      expect(val15).assertEqual(1);
      const val16 = result[1];
      expect(val16).assertEqual(2);
      const val17 = result[2];
      expect(val17).assertEqual(3);
      const val18 = result[3];
      expect(val18).assertEqual(4);
      const val19 = result[4];
      expect(val19).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0600
     * @tc.name testTypedUArraysFillTestFileG006
     * @tc.desc Verify start -1 0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(99n, -1);
      const val20 = result[0];
      expect(val20).assertEqual(1n);
      const val21 = result[1];
      expect(val21).assertEqual(2n);
      const val22 = result[2];
      expect(val22).assertEqual(3n);
      const val23 = result[3];
      expect(val23).assertEqual(4n);
      const val24 = result[4];
      expect(val24).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0700
     * @tc.name testTypedUArraysFillTestFileG007
     * @tc.desc Verify start -length 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(77, -5);
      const val25 = result[0];
      expect(val25).assertEqual(77);
      const val26 = result[1];
      expect(val26).assertEqual(77);
      const val27 = result[2];
      expect(val27).assertEqual(77);
      const val28 = result[3];
      expect(val28).assertEqual(77);
      const val29 = result[4];
      expect(val29).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0800
     * @tc.name testTypedUArraysFillTestFileG008
     * @tc.desc Verify start -length 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(77, -5);
      const val30 = result[0];
      expect(val30).assertEqual(77);
      const val31 = result[1];
      expect(val31).assertEqual(77);
      const val32 = result[2];
      expect(val32).assertEqual(77);
      const val33 = result[3];
      expect(val33).assertEqual(77);
      const val34 = result[4];
      expect(val34).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0900
     * @tc.name testTypedUArraysFillTestFileG009
     * @tc.desc Verify start -length 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(77, -5);
      const val35 = result[0];
      expect(val35).assertEqual(77);
      const val36 = result[1];
      expect(val36).assertEqual(77);
      const val37 = result[2];
      expect(val37).assertEqual(77);
      const val38 = result[3];
      expect(val38).assertEqual(77);
      const val39 = result[4];
      expect(val39).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1000
     * @tc.name testTypedUArraysFillTestFileG010
     * @tc.desc Verify start -length 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(77, -5);
      const val40 = result[0];
      expect(val40).assertEqual(77);
      const val41 = result[1];
      expect(val41).assertEqual(77);
      const val42 = result[2];
      expect(val42).assertEqual(77);
      const val43 = result[3];
      expect(val43).assertEqual(77);
      const val44 = result[4];
      expect(val44).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1100
     * @tc.name testTypedUArraysFillTestFileG011
     * @tc.desc Verify start -length 0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(77n, -5);
      const val45 = result[0];
      expect(val45).assertEqual(77n);
      const val46 = result[1];
      expect(val46).assertEqual(77n);
      const val47 = result[2];
      expect(val47).assertEqual(77n);
      const val48 = result[3];
      expect(val48).assertEqual(77n);
      const val49 = result[4];
      expect(val49).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1200
     * @tc.name testTypedUArraysFillTestFileG012
     * @tc.desc Verify start length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(88, 5);
      const val50 = result[0];
      expect(val50).assertEqual(1);
      const val51 = result[1];
      expect(val51).assertEqual(2);
      const val52 = result[2];
      expect(val52).assertEqual(3);
      const val53 = result[3];
      expect(val53).assertEqual(4);
      const val54 = result[4];
      expect(val54).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1300
     * @tc.name testTypedUArraysFillTestFileG013
     * @tc.desc Verify start length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(88, 5);
      const val55 = result[0];
      expect(val55).assertEqual(1);
      const val56 = result[1];
      expect(val56).assertEqual(2);
      const val57 = result[2];
      expect(val57).assertEqual(3);
      const val58 = result[3];
      expect(val58).assertEqual(4);
      const val59 = result[4];
      expect(val59).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1400
     * @tc.name testTypedUArraysFillTestFileG014
     * @tc.desc Verify start length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(88, 5);
      const val60 = result[0];
      expect(val60).assertEqual(1);
      const val61 = result[1];
      expect(val61).assertEqual(2);
      const val62 = result[2];
      expect(val62).assertEqual(3);
      const val63 = result[3];
      expect(val63).assertEqual(4);
      const val64 = result[4];
      expect(val64).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1500
     * @tc.name testTypedUArraysFillTestFileG015
     * @tc.desc Verify start length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(88, 5);
      const val65 = result[0];
      expect(val65).assertEqual(1);
      const val66 = result[1];
      expect(val66).assertEqual(2);
      const val67 = result[2];
      expect(val67).assertEqual(3);
      const val68 = result[3];
      expect(val68).assertEqual(4);
      const val69 = result[4];
      expect(val69).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1600
     * @tc.name testTypedUArraysFillTestFileG016
     * @tc.desc Verify start length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(88n, 5);
      const val70 = result[0];
      expect(val70).assertEqual(1n);
      const val71 = result[1];
      expect(val71).assertEqual(2n);
      const val72 = result[2];
      expect(val72).assertEqual(3n);
      const val73 = result[3];
      expect(val73).assertEqual(4n);
      const val74 = result[4];
      expect(val74).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1700
     * @tc.name testTypedUArraysFillTestFileG017
     * @tc.desc Verify start length+1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(66, 6);
      const val75 = result[0];
      expect(val75).assertEqual(1);
      const val76 = result[1];
      expect(val76).assertEqual(2);
      const val77 = result[2];
      expect(val77).assertEqual(3);
      const val78 = result[3];
      expect(val78).assertEqual(4);
      const val79 = result[4];
      expect(val79).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1800
     * @tc.name testTypedUArraysFillTestFileG018
     * @tc.desc Verify start length+1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(66, 6);
      const val80 = result[0];
      expect(val80).assertEqual(1);
      const val81 = result[1];
      expect(val81).assertEqual(2);
      const val82 = result[2];
      expect(val82).assertEqual(3);
      const val83 = result[3];
      expect(val83).assertEqual(4);
      const val84 = result[4];
      expect(val84).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1900
     * @tc.name testTypedUArraysFillTestFileG019
     * @tc.desc Verify start length+1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(66, 6);
      const val85 = result[0];
      expect(val85).assertEqual(1);
      const val86 = result[1];
      expect(val86).assertEqual(2);
      const val87 = result[2];
      expect(val87).assertEqual(3);
      const val88 = result[3];
      expect(val88).assertEqual(4);
      const val89 = result[4];
      expect(val89).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2000
     * @tc.name testTypedUArraysFillTestFileG020
     * @tc.desc Verify start length+1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(66, 6);
      const val90 = result[0];
      expect(val90).assertEqual(1);
      const val91 = result[1];
      expect(val91).assertEqual(2);
      const val92 = result[2];
      expect(val92).assertEqual(3);
      const val93 = result[3];
      expect(val93).assertEqual(4);
      const val94 = result[4];
      expect(val94).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2100
     * @tc.name testTypedUArraysFillTestFileG021
     * @tc.desc Verify start length+1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(66n, 6);
      const val95 = result[0];
      expect(val95).assertEqual(1n);
      const val96 = result[1];
      expect(val96).assertEqual(2n);
      const val97 = result[2];
      expect(val97).assertEqual(3n);
      const val98 = result[3];
      expect(val98).assertEqual(4n);
      const val99 = result[4];
      expect(val99).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2200
     * @tc.name testTypedUArraysFillTestFileG022
     * @tc.desc Verify end -1 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 0, -1);
      const val100 = result[0];
      expect(val100).assertEqual(99);
      const val101 = result[1];
      expect(val101).assertEqual(99);
      const val102 = result[2];
      expect(val102).assertEqual(99);
      const val103 = result[3];
      expect(val103).assertEqual(99);
      const val104 = result[4];
      expect(val104).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2300
     * @tc.name testTypedUArraysFillTestFileG023
     * @tc.desc Verify end -1 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 0, -1);
      const val105 = result[0];
      expect(val105).assertEqual(99);
      const val106 = result[1];
      expect(val106).assertEqual(99);
      const val107 = result[2];
      expect(val107).assertEqual(99);
      const val108 = result[3];
      expect(val108).assertEqual(99);
      const val109 = result[4];
      expect(val109).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2400
     * @tc.name testTypedUArraysFillTestFileG024
     * @tc.desc Verify end -1 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 0, -1);
      const val110 = result[0];
      expect(val110).assertEqual(99);
      const val111 = result[1];
      expect(val111).assertEqual(99);
      const val112 = result[2];
      expect(val112).assertEqual(99);
      const val113 = result[3];
      expect(val113).assertEqual(99);
      const val114 = result[4];
      expect(val114).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2500
     * @tc.name testTypedUArraysFillTestFileG025
     * @tc.desc Verify end -1 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 0, -1);
      const val115 = result[0];
      expect(val115).assertEqual(99);
      const val116 = result[1];
      expect(val116).assertEqual(99);
      const val117 = result[2];
      expect(val117).assertEqual(99);
      const val118 = result[3];
      expect(val118).assertEqual(99);
      const val119 = result[4];
      expect(val119).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2600
     * @tc.name testTypedUArraysFillTestFileG026
     * @tc.desc Verify end -1 0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(99n, 0, -1);
      const val120 = result[0];
      expect(val120).assertEqual(99n);
      const val121 = result[1];
      expect(val121).assertEqual(99n);
      const val122 = result[2];
      expect(val122).assertEqual(99n);
      const val123 = result[3];
      expect(val123).assertEqual(99n);
      const val124 = result[4];
      expect(val124).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2700
     * @tc.name testTypedUArraysFillTestFileG027
     * @tc.desc Verify end -length 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 0, -5);
      const val125 = result[0];
      expect(val125).assertEqual(1);
      const val126 = result[1];
      expect(val126).assertEqual(2);
      const val127 = result[2];
      expect(val127).assertEqual(3);
      const val128 = result[3];
      expect(val128).assertEqual(4);
      const val129 = result[4];
      expect(val129).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2800
     * @tc.name testTypedUArraysFillTestFileG028
     * @tc.desc Verify end -length 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 0, -5);
      const val130 = result[0];
      expect(val130).assertEqual(1);
      const val131 = result[1];
      expect(val131).assertEqual(2);
      const val132 = result[2];
      expect(val132).assertEqual(3);
      const val133 = result[3];
      expect(val133).assertEqual(4);
      const val134 = result[4];
      expect(val134).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2900
     * @tc.name testTypedUArraysFillTestFileG029
     * @tc.desc Verify end -length 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 0, -5);
      const val135 = result[0];
      expect(val135).assertEqual(1);
      const val136 = result[1];
      expect(val136).assertEqual(2);
      const val137 = result[2];
      expect(val137).assertEqual(3);
      const val138 = result[3];
      expect(val138).assertEqual(4);
      const val139 = result[4];
      expect(val139).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3000
     * @tc.name testTypedUArraysFillTestFileG030
     * @tc.desc Verify end -length 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 0, -5);
      const val140 = result[0];
      expect(val140).assertEqual(1);
      const val141 = result[1];
      expect(val141).assertEqual(2);
      const val142 = result[2];
      expect(val142).assertEqual(3);
      const val143 = result[3];
      expect(val143).assertEqual(4);
      const val144 = result[4];
      expect(val144).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3100
     * @tc.name testTypedUArraysFillTestFileG031
     * @tc.desc Verify end -length 0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(99n, 0, -5);
      const val145 = result[0];
      expect(val145).assertEqual(1n);
      const val146 = result[1];
      expect(val146).assertEqual(2n);
      const val147 = result[2];
      expect(val147).assertEqual(3n);
      const val148 = result[3];
      expect(val148).assertEqual(4n);
      const val149 = result[4];
      expect(val149).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3200
     * @tc.name testTypedUArraysFillTestFileG032
     * @tc.desc Verify end length length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(55, 0, 5);
      const val150 = result[0];
      expect(val150).assertEqual(55);
      const val151 = result[1];
      expect(val151).assertEqual(55);
      const val152 = result[2];
      expect(val152).assertEqual(55);
      const val153 = result[3];
      expect(val153).assertEqual(55);
      const val154 = result[4];
      expect(val154).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3300
     * @tc.name testTypedUArraysFillTestFileG033
     * @tc.desc Verify end length length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(55, 0, 5);
      const val155 = result[0];
      expect(val155).assertEqual(55);
      const val156 = result[1];
      expect(val156).assertEqual(55);
      const val157 = result[2];
      expect(val157).assertEqual(55);
      const val158 = result[3];
      expect(val158).assertEqual(55);
      const val159 = result[4];
      expect(val159).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3400
     * @tc.name testTypedUArraysFillTestFileG034
     * @tc.desc Verify end length length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(55, 0, 5);
      const val160 = result[0];
      expect(val160).assertEqual(55);
      const val161 = result[1];
      expect(val161).assertEqual(55);
      const val162 = result[2];
      expect(val162).assertEqual(55);
      const val163 = result[3];
      expect(val163).assertEqual(55);
      const val164 = result[4];
      expect(val164).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3500
     * @tc.name testTypedUArraysFillTestFileG035
     * @tc.desc Verify end length length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(55, 0, 5);
      const val165 = result[0];
      expect(val165).assertEqual(55);
      const val166 = result[1];
      expect(val166).assertEqual(55);
      const val167 = result[2];
      expect(val167).assertEqual(55);
      const val168 = result[3];
      expect(val168).assertEqual(55);
      const val169 = result[4];
      expect(val169).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3600
     * @tc.name testTypedUArraysFillTestFileG036
     * @tc.desc Verify end length length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(55n, 0, 5);
      const val170 = result[0];
      expect(val170).assertEqual(55n);
      const val171 = result[1];
      expect(val171).assertEqual(55n);
      const val172 = result[2];
      expect(val172).assertEqual(55n);
      const val173 = result[3];
      expect(val173).assertEqual(55n);
      const val174 = result[4];
      expect(val174).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3700
     * @tc.name testTypedUArraysFillTestFileG037
     * @tc.desc Verify end length+1 length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(44, 0, 6);
      const val175 = result[0];
      expect(val175).assertEqual(44);
      const val176 = result[1];
      expect(val176).assertEqual(44);
      const val177 = result[2];
      expect(val177).assertEqual(44);
      const val178 = result[3];
      expect(val178).assertEqual(44);
      const val179 = result[4];
      expect(val179).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3800
     * @tc.name testTypedUArraysFillTestFileG038
     * @tc.desc Verify end length+1 length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(44, 0, 6);
      const val180 = result[0];
      expect(val180).assertEqual(44);
      const val181 = result[1];
      expect(val181).assertEqual(44);
      const val182 = result[2];
      expect(val182).assertEqual(44);
      const val183 = result[3];
      expect(val183).assertEqual(44);
      const val184 = result[4];
      expect(val184).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3900
     * @tc.name testTypedUArraysFillTestFileG039
     * @tc.desc Verify end length+1 length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(44, 0, 6);
      const val185 = result[0];
      expect(val185).assertEqual(44);
      const val186 = result[1];
      expect(val186).assertEqual(44);
      const val187 = result[2];
      expect(val187).assertEqual(44);
      const val188 = result[3];
      expect(val188).assertEqual(44);
      const val189 = result[4];
      expect(val189).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4000
     * @tc.name testTypedUArraysFillTestFileG040
     * @tc.desc Verify end length+1 length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(44, 0, 6);
      const val190 = result[0];
      expect(val190).assertEqual(44);
      const val191 = result[1];
      expect(val191).assertEqual(44);
      const val192 = result[2];
      expect(val192).assertEqual(44);
      const val193 = result[3];
      expect(val193).assertEqual(44);
      const val194 = result[4];
      expect(val194).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4100
     * @tc.name testTypedUArraysFillTestFileG041
     * @tc.desc Verify end length+1 length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(44n, 0, 6);
      const val195 = result[0];
      expect(val195).assertEqual(44n);
      const val196 = result[1];
      expect(val196).assertEqual(44n);
      const val197 = result[2];
      expect(val197).assertEqual(44n);
      const val198 = result[3];
      expect(val198).assertEqual(44n);
      const val199 = result[4];
      expect(val199).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4200
     * @tc.name testTypedUArraysFillTestFileG042
     * @tc.desc Verify fill Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.fill(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4300
     * @tc.name testTypedUArraysFillTestFileG043
     * @tc.desc Verify fill Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      let result = arr.fill(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4400
     * @tc.name testTypedUArraysFillTestFileG044
     * @tc.desc Verify fill Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      let result = arr.fill(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4500
     * @tc.name testTypedUArraysFillTestFileG045
     * @tc.desc Verify fill Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let result = arr.fill(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4600
     * @tc.name testTypedUArraysFillTestFileG046
     * @tc.desc Verify fill BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      let result = arr.fill(0n);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4700
     * @tc.name testTypedUArraysFillTestFileG047
     * @tc.desc Verify fill Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let result = arr.fill(100);
      const val200 = result[0];
      expect(val200).assertEqual(100);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4800
     * @tc.name testTypedUArraysFillTestFileG048
     * @tc.desc Verify fill Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42]);
      let result = arr.fill(100);
      const val201 = result[0];
      expect(val201).assertEqual(100);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4900
     * @tc.name testTypedUArraysFillTestFileG049
     * @tc.desc Verify fill Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([42]);
      let result = arr.fill(100);
      const val202 = result[0];
      expect(val202).assertEqual(100);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_5000
     * @tc.name testTypedUArraysFillTestFileG050
     * @tc.desc Verify fill Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileG050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      let result = arr.fill(100);
      const val203 = result[0];
      expect(val203).assertEqual(100);
      expect(result.length).assertEqual(1);
    });
  });
}
