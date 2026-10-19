'use static';

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
import Utils from './../Util.test';

class KeyValueEntry {
  val: Short;
  label: string;
  constructor(val: Short, label: string) {
    this.val = val;
    this.label = label;
  }
}

export default function shortToStringTest(): void {
  describe('ShortToStringTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0100
     * @tc.name testShortToString_merged1
     * @tc.desc BasicValue / BoundaryOverflow: covers 10 merged test points for Short.toString, including string conversion, boundary values, fractions and rounding, positive values, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let posTemp: Short = new Short(235 as short);
        expect(posTemp.toString()).assertEqual('235');
        let negTemp: Short = new Short((-150) as short);
        expect(negTemp.toString()).assertEqual('-150');
        let zeroTemp: Short = new Short(0 as short);
        expect(zeroTemp.toString()).assertEqual('0');
        let sign: string = negTemp.toString().startsWith('-') ? '-' : '+';
        let formatted: string = `${sign}${posTemp.toString()}°C`;
        expect(formatted).assertEqual('-235°C');
      }

      {
        let minBoundaryValue: short = Short.MIN_VALUE;
        let actualResult: string = Short.toString(minBoundaryValue);
        expect(actualResult).assertEqual('-32768');
        expect(actualResult.length).assertEqual(6);
      }

      {
        let maxBoundaryValue: short = Short.MAX_VALUE;
        let actualResult: string = Short.toString(maxBoundaryValue);
        expect(actualResult).assertEqual('32767');
        expect(actualResult.length).assertEqual(5);
      }

      {
        let inputValues: short[] = [123 as short, (-256) as short, 0 as short, Short.MAX_VALUE, Short.MIN_VALUE];
        let expectedStrings: string[] = ['123', '-256', '0', '32767', '-32768'];
        for (let caseIndex: int = 0; caseIndex < inputValues.length; caseIndex++) {
          let firstCallResult: string = Short.toString(inputValues[caseIndex]);
          let secondCallResult: string = Short.toString(inputValues[caseIndex]);
          let thirdCallResult: string = Short.toString(inputValues[caseIndex]);
          expect(firstCallResult).assertEqual(expectedStrings[caseIndex]);
          expect(secondCallResult).assertEqual(expectedStrings[caseIndex]);
          expect(thirdCallResult).assertEqual(expectedStrings[caseIndex]);
          expect(secondCallResult).assertEqual(firstCallResult);
          expect(thirdCallResult).assertEqual(secondCallResult);
        }
      }

      {
        let wrappingInts: int[] = [32768, 32767, 65534, 65535, 90000];
        let expectedStrings: string[] = ['-32768', '32767', '-2', '-1', '24464'];
        for (let caseIndex: int = 0; caseIndex < wrappingInts.length; caseIndex++) {
          let wrappedShort: short = Int.toShort(wrappingInts[caseIndex]);
          let actualResult: string = Short.toString(wrappedShort);
          expect(actualResult).assertEqual(expectedStrings[caseIndex]);
        }
      }

      {
        let radices: int[] = [2, 3, 5, 8, 10, 16, 20, 36];
        let belowExpected: string[] = ['1', '2', '4', '7', '9', 'f', 'j', 'z'];
        for (let caseIndex: int = 0; caseIndex < radices.length; caseIndex++) {
          let belowInstance: Short = new Short(Int.toShort(radices[caseIndex] - 1));
          let atInstance: Short = new Short(Int.toShort(radices[caseIndex]));
          let belowString: string = belowInstance.toString(radices[caseIndex]);
          let atString: string = atInstance.toString(radices[caseIndex]);
          expect(belowString).assertEqual(belowExpected[caseIndex]);
          expect(belowString.length).assertEqual(1);
          expect(atString).assertEqual('10');
          expect(atString.length).assertEqual(2);
        }
      }

      {
        let minBoundaryInstance: Short = new Short(Short.MIN_VALUE);
        let actualResult: String = minBoundaryInstance.toString();
        expect(actualResult).assertEqual('-32768');
        expect(actualResult.length).assertEqual(6);
      }

      {
        let maxBoundaryInstance: Short = new Short(Short.MAX_VALUE);
        let actualResult: String = maxBoundaryInstance.toString();
        expect(actualResult).assertEqual('32767');
        expect(actualResult.length).assertEqual(5);
      }

      {
        let inputInstances: Short[] = [new Short(456 as short), new Short((-789) as short), new Short(0 as short),
          new Short(Short.MAX_VALUE), new Short(Short.MIN_VALUE)];
        let expectedStrings: String[] = ['456', '-789', '0', '32767', '-32768'];
        for (let caseIndex: int = 0; caseIndex < inputInstances.length; caseIndex++) {
          let firstResult: String = inputInstances[caseIndex].toString();
          let secondResult: String = inputInstances[caseIndex].toString();
          let thirdResult: String = inputInstances[caseIndex].toString();
          expect(firstResult).assertEqual(expectedStrings[caseIndex]);
          expect(secondResult).assertEqual(expectedStrings[caseIndex]);
          expect(thirdResult).assertEqual(expectedStrings[caseIndex]);
          expect(secondResult).assertEqual(firstResult);
          expect(thirdResult).assertEqual(secondResult);
        }
      }

      {
        let dividends: short[] = [7 as short, (-7) as short, 100 as short, (-100) as short, 32767 as short];
        let divisors: short[] = [2 as short, 2 as short, 3 as short, 3 as short, 16 as short];
        let expectedStrings: string[] = ['3', '-3', '33', '-33', '2047'];
        for (let caseIndex: int = 0; caseIndex < dividends.length; caseIndex++) {
          let quotient: Short = new Short(dividends[caseIndex]).div(new Short(divisors[caseIndex]));
          expect(quotient.toString()).assertEqual(expectedStrings[caseIndex]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0200
     * @tc.name testShortToString_merged2
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toString, including string conversion, boundary values, radix conversion, fractions and rounding, and zero values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let maxInstance: Short = new Short(Short.MAX_VALUE);
        let minInstance: Short = new Short(Short.MIN_VALUE);
  
        let maxBinary: string = maxInstance.toString(2);
        let maxHex: string = maxInstance.toString(16);
        let minBinary: string = minInstance.toString(2);
        let minHex: string = minInstance.toString(16);
  
        expect(maxBinary).assertEqual('111111111111111');
        expect(maxHex).assertEqual('7fff');
        expect(minBinary).assertEqual('-1000000000000000');
        expect(minHex).assertEqual('-8000');
  
        expect(maxBinary.length).assertEqual(15);
        expect(maxHex.length).assertEqual(4);
        expect(minBinary.length).assertEqual(17);
        expect(minHex.length).assertEqual(5);
  
        let maxMagnitude: int = Int.parseInt(maxBinary, 2);
        let minMagnitude: int = Int.parseInt(minBinary.substring(1), 2);
        let maxHexMagnitude: int = Int.parseInt(maxHex, 16);
        let minHexMagnitude: int = Int.parseInt(minHex.substring(1), 16);
        expect(maxMagnitude).assertEqual(32767);
        expect(minMagnitude).assertEqual(32768);
        expect(maxHexMagnitude).assertEqual(32767);
        expect(minHexMagnitude).assertEqual(32768);
      }

      {
        let typicalInstance: Short = new Short(100 as short);
        let minBoundaryInstance: Short = new Short(Short.MIN_VALUE);
        let maxBoundaryInstance: Short = new Short(Short.MAX_VALUE);
        let typicalHexResult: string = typicalInstance.toString(16);
        let typicalOctalResult: string = typicalInstance.toString(8);
        let minDecimalResult: string = minBoundaryInstance.toString(10);
        let minHexResult: string = minBoundaryInstance.toString(16);
        let maxDecimalResult: string = maxBoundaryInstance.toString(10);
        let maxHexResult: string = maxBoundaryInstance.toString(16);
        expect(typicalHexResult).assertEqual('64');
        expect(typicalOctalResult).assertEqual('144');
        expect(minDecimalResult).assertEqual('-32768');
        expect(minHexResult).assertEqual('-8000');
        expect(maxDecimalResult).assertEqual('32767');
        expect(maxHexResult).assertEqual('7fff');
      }

      {
        let instance: Short = new Short(255 as short);
  
        expect(instance.toString(10.0)).assertEqual('255');
        expect(instance.toString(16.0)).assertEqual('ff');
        expect(instance.toString(8.0)).assertEqual('377');
        expect(instance.toString(2.0)).assertEqual('11111111');
  
        expect(instance.toString(10.9)).assertEqual(instance.toString(10));
        expect(instance.toString(10.1)).assertEqual(instance.toString(10));
        expect(instance.toString(16.9)).assertEqual(instance.toString(16));
        expect(instance.toString(2.7)).assertEqual(instance.toString(2));
      }

      {
        let zeroInstance: Short = new Short(0 as short);
        let oneInstance: Short = new Short(1 as short);
        let byteMaxInstance: Short = new Short(255 as short);
        let negativeOneInstance: Short = new Short((-1) as short);
        let maxBoundaryInstance: Short = new Short(Short.MAX_VALUE);
        let minBoundaryInstance: Short = new Short(Short.MIN_VALUE);
        let zeroBinaryResult: string = zeroInstance.toString(2);
        let oneBinaryResult: string = oneInstance.toString(2);
        let byteMaxBinaryResult: string = byteMaxInstance.toString(2);
        let negativeOneBinaryResult: string = negativeOneInstance.toString(2);
        let maxBinaryResult: string = maxBoundaryInstance.toString(2);
        let minBinaryResult: string = minBoundaryInstance.toString(2);
        expect(zeroBinaryResult).assertEqual('0');
        expect(oneBinaryResult).assertEqual('1');
        expect(byteMaxBinaryResult).assertEqual('11111111');
        expect(negativeOneBinaryResult).assertEqual('-1');
        expect(maxBinaryResult).assertEqual('111111111111111');
        expect(minBinaryResult).assertEqual('-1000000000000000');
      }

      {
        let zeroInstance: Short = new Short(0 as short);
        let maxSingleDigitInstance: Short = new Short(35 as short);
        let firstTwoDigitInstance: Short = new Short(36 as short);
        let maxBoundaryInstance: Short = new Short(Short.MAX_VALUE);
        let minBoundaryInstance: Short = new Short(Short.MIN_VALUE);
        let zeroBase36Result: string = zeroInstance.toString(36);
        let maxSingleDigitResult: string = maxSingleDigitInstance.toString(36);
        let firstTwoDigitResult: string = firstTwoDigitInstance.toString(36);
        let maxBase36Result: string = maxBoundaryInstance.toString(36);
        let minBase36Result: string = minBoundaryInstance.toString(36);
        expect(zeroBase36Result).assertEqual('0');
        expect(maxSingleDigitResult).assertEqual('z');
        expect(firstTwoDigitResult).assertEqual('10');
        expect(maxBase36Result).assertEqual('pa7');
        expect(minBase36Result).assertEqual('-pa8');
      }

      {
        let boundaryValues: short[] = [Short.MAX_VALUE, Short.MIN_VALUE, 32766 as short, (-32767) as short];
        let expectedStrings: string[] = ['32767', '-32768', '32766', '-32767'];
        let caseCount: int = 4;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          expect(Short.toString(boundaryValues[caseIndex])).assertEqual(expectedStrings[caseIndex]);
        }
      }

      {
        let maxInst: Short = new Short(Short.MAX_VALUE);
        let minInst: Short = new Short(Short.MIN_VALUE);
        expect(maxInst.toString(3)).assertEqual('1122221121');
        expect(minInst.toString(3)).assertEqual('-1122221122');
        expect(maxInst.toString(5)).assertEqual('2022032');
        expect(minInst.toString(5)).assertEqual('-2022033');
        expect(maxInst.toString(7)).assertEqual('164350');
        expect(minInst.toString(7)).assertEqual('-164351');
        expect(maxInst.toString(9)).assertEqual('48847');
        expect(minInst.toString(9)).assertEqual('-48848');
        expect(maxInst.toString(11)).assertEqual('22689');
        expect(minInst.toString(11)).assertEqual('-2268a');
        expect(maxInst.toString(13)).assertEqual('11bb7');
        expect(minInst.toString(13)).assertEqual('-11bb8');
      }

      {
        let maxInst: Short = new Short(Short.MAX_VALUE);
        expect(maxInst.toString(3)).assertEqual('1122221121');
        expect(maxInst.toString(4)).assertEqual('13333333');
        expect(maxInst.toString(5)).assertEqual('2022032');
        expect(maxInst.toString(6)).assertEqual('411411');
        expect(maxInst.toString(7)).assertEqual('164350');
        expect(maxInst.toString(8)).assertEqual('77777');
        expect(maxInst.toString(9)).assertEqual('48847');
      }

      {
        let minInst: Short = new Short(Short.MIN_VALUE);
        expect(minInst.toString(3)).assertEqual('-1122221122');
        expect(minInst.toString(4)).assertEqual('-20000000');
        expect(minInst.toString(5)).assertEqual('-2022033');
        expect(minInst.toString(6)).assertEqual('-411412');
        expect(minInst.toString(7)).assertEqual('-164351');
        expect(minInst.toString(8)).assertEqual('-100000');
        expect(minInst.toString(9)).assertEqual('-48848');
      }

      {
        let negValues: short[] = [(-1) as short, (-2) as short, (-32766) as short, (-32767) as short, (-32768) as short];
        let expectedStrings: string[] = ['-1', '-2', '-32766', '-32767', '-32768'];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let instance: Short = new Short(negValues[caseIndex]);
          let noArgResult: String = instance.toString();
          let staticResult: string = Short.toString(negValues[caseIndex]);
          expect(noArgResult).assertEqual(expectedStrings[caseIndex]);
          expect(staticResult).assertEqual(expectedStrings[caseIndex]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0300
     * @tc.name testShortToString_merged3
     * @tc.desc BoundaryOverflow / ErrorException / CrossTypeRoundTrip: covers 10 merged test points for Short.toString, including string conversion, radix conversion, fractions and rounding, boundary values, and wrapping.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let red: Short = new Short(Int.toShort(0x1F));
        let green: Short = new Short(Int.toShort(0x3F));
        let blue: Short = new Short(Int.toShort(0x1F));
  
        let composite: Short = new Short(Int.toShort(
          (red.toInt() << 11) | (green.toInt() << 5) | blue.toInt()
        ));
  
        let hexColor: string = Long.toLong(Short.toInt(composite) & 0xFFFF).toString(16);
        expect(hexColor).assertEqual('ffff');
  
        let redShamt: Short = new Short(Int.toShort(red.toInt() << 11));
        let redBinary: string = Long.toLong(Short.toInt(redShamt) & 0xFFFF).toString(2);
        expect(redBinary).assertEqual('1111100000000000');
  
        let black: Short = new Short(0 as short);
        expect(black.toString(16)).assertEqual('0');
      }

      {
        let samples: Short[] = [
          new Short(0 as short), new Short(1 as short), new Short((-1) as short),
          new Short(42 as short), new Short((-99) as short), new Short(Short.MAX_VALUE), new Short(Short.MIN_VALUE)
        ];
        let expectedLengths: int[] = [1, 1, 2, 2, 3, 5, 6];
        let idx: int = 0;
        for (let s of samples) {
          for (let r: int = 2; r <= 36; r++) {
            let result: string = s.toString(r);
            expect(result !== '').assertTrue();
          }
          expect(s.toString().length).assertEqual(expectedLengths[idx]);
          idx++;
        }
  
        let negSample: Short = samples[4];
        expect(negSample.toString(2)).assertEqual('-1100011');
        expect(negSample.toString(8)).assertEqual('-143');
        expect(negSample.toString(10)).assertEqual('-99');
        expect(negSample.toString(16)).assertEqual('-63');
        expect(negSample.toString(36)).assertEqual('-2r');
      }

      {
        let page4k: Short = new Short(4096 as short);
        expect(page4k.toString()).assertEqual('4096');
        expect(page4k.toString(16)).assertEqual('1000');
        let page8k: Short = new Short(8192 as short);
        expect(page8k.toString()).assertEqual('8192');
        let page16k: Short = new Short(16384 as short);
        expect(page16k.toString()).assertEqual('16384');
        let page64k: Short = new Short(Int.toShort(65536));
        expect(Int.parseInt(page64k.toString(), 10) >= 0).assertTrue();
      }

      {
        let formatWithPrefix = (val: Short, radix: int, prefix: string): string => {
          return prefix + val.toString(radix);
        };
        let inst: Short = new Short(255 as short);
        expect(formatWithPrefix(inst, 16, '0x')).assertEqual('0xff');
        expect(formatWithPrefix(inst, 8, '0o')).assertEqual('0o377');
        expect(formatWithPrefix(inst, 2, '0b')).assertEqual('0b11111111');
        expect(formatWithPrefix(new Short(42 as short), 16, '0x')).assertEqual('0x2a');
      }

      {
        let radixBelow: Short = new Short(100 as short);
        try {
          radixBelow.toString(1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
  
        let radixUpper: Short = new Short(100 as short);
        try {
          radixUpper.toString(37);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      {
        let radixInstance: Short = new Short(255 as short);
        let storedValueBeforeCalls: short = radixInstance.toShort();
        let minRadixResult: string = radixInstance.toString(2);
        let maxRadixResult: string = radixInstance.toString(36);
        try {
          radixInstance.toString(1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        try {
          radixInstance.toString(37);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        let storedValueAfterCalls: short = radixInstance.toShort();
        expect(minRadixResult).assertEqual('11111111');
        expect(maxRadixResult).assertEqual('73');
        expect(storedValueBeforeCalls).assertEqual(storedValueAfterCalls);
        expect(storedValueAfterCalls).assertEqual(255 as short);
      }

      {
        let errorCode: Short = new Short(255 as short);
        let lineNumber: Short = new Short(1024 as short);
        let moduleId: Short = new Short(Int.toShort(0x1A3F));
  
        let hexError: string = errorCode.toString(16);
        expect(hexError).assertEqual('ff');
  
        let decLine: string = lineNumber.toString();
        expect(decLine).assertEqual('1024');
  
        let hexModule: string = moduleId.toString(16);
        expect(hexModule).assertEqual('1a3f');
  
        let logMsg: string = `[ERROR:0x${hexError.toUpperCase()}] module=0x${hexModule} line=${decLine}`;
        expect(logMsg).assertEqual('[ERROR:0xFF] module=0x1a3f line=1024');
      }

      {
        let maxBoundaryInstance: Short = new Short(Short.MAX_VALUE);
        expect(maxBoundaryInstance.toString(2.0)).assertEqual('111111111111111');
        expect(maxBoundaryInstance.toString(36.0)).assertEqual('pa7');
        let minBoundaryInstance: Short = new Short(Short.MIN_VALUE);
        expect(minBoundaryInstance.toString(2.0)).assertEqual('-1000000000000000');
        expect(minBoundaryInstance.toString(36.0)).assertEqual('-pa8');
  
        let instance: Short = new Short(255 as short);
        try {
          instance.toString(1.9);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
  
        try {
          instance.toString(37.0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      {
        let inputValue: short = 123 as short;
        let actualResult: string = Short.toString(inputValue);
        expect(actualResult).assertEqual('123');
      }

      {
        let zeroValue: short = 0 as short;
        let actualResult: string = Short.toString(zeroValue);
        expect(actualResult).assertEqual('0');
        expect(actualResult.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0400
     * @tc.name testShortToString_merged4
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toString, including string conversion, fractions and rounding, negative values, business scenarios, and type conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let negativeValue: short = (-100) as short;
        let actualResult: string = Short.toString(negativeValue);
        expect(actualResult).assertEqual('-100');
        expect(actualResult.length).assertEqual(4);
      }

      {
        let byteSources: byte[] = [127 as byte, (-128) as byte, (-1) as byte, 100 as byte, 0 as byte];
        let expectedStrings: string[] = ['127', '-128', '-1', '100', '0'];
        for (let caseIndex: int = 0; caseIndex < byteSources.length; caseIndex++) {
          let convertedShort: short = Byte.toShort(byteSources[caseIndex]);
          let actualResult: string = Short.toString(convertedShort);
          expect(actualResult).assertEqual(expectedStrings[caseIndex]);
        }
      }

      {
        let positiveInstance: Short = new Short(10 as short);
        let negativeInstance: Short = new Short((-20) as short);
        let zeroInstance: Short = new Short(0 as short);
        let positiveResult: String = positiveInstance.toString();
        let negativeResult: String = negativeInstance.toString();
        let zeroResult: String = zeroInstance.toString();
        expect(positiveResult).assertEqual('10');
        expect(negativeResult).assertEqual('-20');
        expect(zeroResult).assertEqual('0');
      }

      {
        let zeroInstance: Short = new Short(0 as short);
        let actualResult: String = zeroInstance.toString();
        expect(actualResult).assertEqual('0');
        expect(actualResult.length).assertEqual(1);
      }

      {
        let negativeInstance: Short = new Short((-100) as short);
        let actualResult: String = negativeInstance.toString();
        expect(actualResult).assertEqual('-100');
        expect(actualResult.length).assertEqual(4);
      }

      {
        let secondsInputs: int[] = [0, 5, 65, 125, 500, 3599];
        let expectedDurations: string[] = ['00:00', '00:05', '01:05', '02:05', '08:20', '59:59'];
        let caseCount: int = secondsInputs.length;
        for (let i: int = 0; i < caseCount; i++) {
          let totalSec: Short = new Short(Int.toShort(secondsInputs[i]));
          let minutes: Short = totalSec.div(60 as short);
          let seconds: Short = totalSec.sub(minutes.mul(60 as short));
          let minutesStr: string = minutes.toString();
          let secondsStr: string = seconds.toString();
          let paddedMinutes: string = minutesStr.length < 2 ? '0' + minutesStr : minutesStr;
          let paddedSeconds: string = secondsStr.length < 2 ? '0' + secondsStr : secondsStr;
          let duration: string = paddedMinutes + ':' + paddedSeconds;
          expect(duration).assertEqual(expectedDurations[i]);
          expect(minutesStr).assertEqual(minutes.toInt().toString(10));
          expect(secondsStr).assertEqual(seconds.toInt().toString(10));
        }
      }

      {
        let values: short[] = [500 as short, 2048 as short, 16384 as short];
        let expectedStrings: string[] = ['500', '2048', '16384'];
        let caseCount: int = 3;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          expect(Short.toString(values[caseIndex])).assertEqual(expectedStrings[caseIndex]);
        }
      }

      {
        let values: short[] = [(-500) as short, (-2048) as short, (-16384) as short];
        let expectedStrings: string[] = ['-500', '-2048', '-16384'];
        let caseCount: int = 3;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          expect(Short.toString(values[caseIndex])).assertEqual(expectedStrings[caseIndex]);
        }
      }

      {
        let values: short[] = [42 as short, (-42) as short, 0 as short];
        let expectedStrings: string[] = ['42', '-42', '0'];
        let caseCount: int = 3;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let firstCall: string = Short.toString(values[caseIndex]);
          let secondCall: string = Short.toString(values[caseIndex]);
          expect(firstCall).assertEqual(expectedStrings[caseIndex]);
          expect(secondCall).assertEqual(firstCall);
        }
      }

      {
        let values: short[] = [1 as short, 10 as short, 100 as short, 1000 as short, 10000 as short];
        let expectedStrings: String[] = ['1', '10', '100', '1000', '10000'];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let instance: Short = new Short(values[caseIndex]);
          expect(instance.toString()).assertEqual(expectedStrings[caseIndex]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0500
     * @tc.name testShortToString_merged5
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toString, including string conversion, negative values, zero values, equality consistency, and positive values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let values: short[] = [(-1) as short, (-10) as short, (-100) as short, (-1000) as short, (-10000) as short];
        let expectedStrings: String[] = ['-1', '-10', '-100', '-1000', '-10000'];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let instance: Short = new Short(values[caseIndex]);
          expect(instance.toString()).assertEqual(expectedStrings[caseIndex]);
        }
      }

      {
        let values: short[] = [0 as short, 42 as short, (-128) as short, 500 as short, (-500) as short];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let instance: Short = new Short(values[caseIndex]);
          let firstCall: String = instance.toString();
          let secondCall: String = instance.toString();
          expect(secondCall).assertEqual(firstCall);
        }
      }

      {
        let instance: Short = new Short(100 as short);
        expect(instance.toString(17)).assertEqual('5f');
        expect(instance.toString(18)).assertEqual('5a');
        expect(instance.toString(19)).assertEqual('55');
        expect(instance.toString(20)).assertEqual('50');
      }

      {
        let values: short[] = [0 as short, 1 as short, (-1) as short, 256 as short, (-256) as short, 1000 as short, (-1000) as short];
        let caseCount: int = 7;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let staticResult: string = Short.toString(values[caseIndex]);
          let instance: Short = new Short(values[caseIndex]);
          let instanceResult: String = instance.toString();
          expect(instanceResult).assertEqual(staticResult);
        }
      }

      {
        let keyValues: KeyValueEntry[] = [
          new KeyValueEntry(new Short(0 as short), 'zero'),
          new KeyValueEntry(new Short(255 as short), 'byte_max'),
          new KeyValueEntry(new Short(32767 as short), 'short_max'),
          new KeyValueEntry(new Short(-32768 as short), 'short_min')
        ];
  
        let radices: int[] = [2, 8, 10, 16, 36];
  
        for (let r of radices) {
          expect(keyValues[0].val.toString(r)).assertEqual('0');
        }
  
        expect(keyValues[1].val.toString(2)).assertEqual('11111111');
        expect(keyValues[1].val.toString(8)).assertEqual('377');
        expect(keyValues[1].val.toString(16)).assertEqual('ff');
  
        let max36: string = keyValues[2].val.toString(36);
        expect(max36.length).assertEqual(3);
  
        let min16: string = keyValues[3].val.toString(16);
        expect(min16.startsWith('-')).assertTrue();
      }

      {
        let a: Short = new Short(1000 as short);
        let b: Short = new Short(234 as short);
  
        let sumStr: string = a.add(b).toString();
        expect(sumStr).assertEqual('1234');
  
        let subStr: string = a.sub(b).toString();
        expect(subStr).assertEqual('766');
  
        let mulStr: string = a.mul(new Short(3 as short)).toString();
        expect(mulStr).assertEqual('3000');
  
        let divStr: string = a.div(new Short(3 as short)).toString();
        expect(divStr).assertEqual('333');
  
        let negStr: string = new Short(-100 as short).add(new Short(23 as short)).toString();
        expect(negStr).assertEqual('-77');
      }

      {
        let original: Short[] = [
          new Short(0 as short), new Short(255 as short), new Short(-1 as short),
          new Short(32767 as short), new Short(-32768 as short)
        ];
  
        let serialized: string[] = [];
        for (let s of original) {
          serialized.push(s.toString());
        }
  
        expect(serialized[0]).assertEqual('0');
        expect(serialized[3]).assertEqual('32767');
        expect(serialized[4]).assertEqual('-32768');
  
        let restored: Short[] = [];
        for (let str of serialized) {
          let parsed: short = Short.parseInt(str, 10);
          restored.push(new Short(Int.toShort(parsed)));
        }
  
        for (let i: int = 0; i < original.length; i++) {
          expect(original[i].equals(restored[i])).assertTrue();
        }
  
        for (let i: int = 0; i < original.length; i++) {
          expect(original[i].toFloat()).assertEqual(restored[i].toFloat());
        }
      }

      {
        let values: short[] = [0 as short, 1 as short, (-1) as short, 255 as short, (-128) as short, Short.MAX_VALUE, Short.MIN_VALUE];
        let expectedDefault: string[] = ['0', '1', '-1', '255', '-128', '32767', '-32768'];
        let expectedBin: string[] = ['0', '1', '-1', '11111111', '-10000000', '111111111111111', '-1000000000000000'];
        let expectedOct: string[] = ['0', '1', '-1', '377', '-200', '77777', '-100000'];
        let expectedHex: string[] = ['0', '1', '-1', 'ff', '-80', '7fff', '-8000'];
        let expected36: string[] = ['0', '1', '-1', '73', '-3k', 'pa7', '-pa8'];
        for (let i: int = 0; i < values.length; i++) {
          let inst: Short = new Short(values[i]);
          expect(inst.toString()).assertEqual(expectedDefault[i]);
          expect(inst.toString(2)).assertEqual(expectedBin[i]);
          expect(inst.toString(8)).assertEqual(expectedOct[i]);
          expect(inst.toString(10)).assertEqual(expectedDefault[i]);
          expect(inst.toString(16)).assertEqual(expectedHex[i]);
          expect(inst.toString(36)).assertEqual(expected36[i]);
          expect(Short.toString(values[i])).assertEqual(expectedDefault[i]);
          expect(typeof inst.toString()).assertEqual('string');
          expect(typeof inst.toString(2)).assertEqual('string');
          expect(typeof inst.toString(8)).assertEqual('string');
          expect(typeof inst.toString(10)).assertEqual('string');
          expect(typeof inst.toString(16)).assertEqual('string');
          expect(typeof inst.toString(36)).assertEqual('string');
          expect(typeof Short.toString(values[i])).assertEqual('string');
        }
      }

      {
        let positives: short[] = [0 as short, 1 as short, 42 as short, 255 as short, 1000 as short, Short.MAX_VALUE];
        let negatives: short[] = [(-1) as short, (-42) as short, (-255) as short, (-1000) as short, Short.MIN_VALUE];
        let radices: int[] = [2, 8, 10, 16, 32, 36];
        for (let v of positives) {
          let inst: Short = new Short(v);
          for (let r of radices) {
            expect(!inst.toString(r).startsWith('-')).assertTrue();
          }
          expect(!Short.toString(v).startsWith('-')).assertTrue();
        }
        for (let v of negatives) {
          let inst: Short = new Short(v);
          for (let r of radices) {
            expect(inst.toString(r).startsWith('-')).assertTrue();
          }
          expect(Short.toString(v).startsWith('-')).assertTrue();
        }
      }

      {
        let inst: Short = new Short(12345 as short);
        let radices: int[] = [2, 5, 8, 10, 13, 16, 20, 25, 30, 36];
        for (let r of radices) {
          let call1: string = inst.toString(r);
          let call2: string = inst.toString(r);
          let call3: string = inst.toString(r);
          expect(call1).assertEqual(call2);
          expect(call2).assertEqual(call3);
        }
  
        let negInst: Short = new Short((-12345) as short);
        for (let r of radices) {
          let call1: string = negInst.toString(r);
          let call2: string = negInst.toString(r);
          expect(call1).assertEqual(call2);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0600
     * @tc.name testShortToString_merged6
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toString, including string conversion, fractions and rounding, containers and references, equality consistency, and type conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let values: short[] = [0 as short, 1 as short, (-1) as short, 100 as short, (-1000) as short, Short.MAX_VALUE, Short.MIN_VALUE];
        for (let v of values) {
          let inst: Short = new Short(v);
          expect(inst.toString(10)).assertEqual(inst.toLong().toString());
        }
      }

      {
        let values: short[] = [0 as short, 42 as short, (-42) as short, 32767 as short, (-32768) as short];
        let radices: int[] = [2, 10, 16, 36];
        for (let v of values) {
          let orig: Short = new Short(v);
          let afterToShort: short = orig.toShort();
          expect(afterToShort.toShort()).assertEqual(v);
          for (let r of radices) {
            expect(orig.toString(r)).assertEqual(afterToShort.toString(r));
          }
        }
      }

      {
        let parsed: short = Short.parseInt('ff', 16);
        let inst: Short = new Short(Int.toShort(parsed));
        expect(inst.toString()).assertEqual('255');
        expect(inst.toString(16)).assertEqual('ff');
        let parsed2: short = Short.parseInt(inst.toString(16), 16);
        expect(parsed2).assertEqual(255);
        let negParsed: Short = new Short(Int.toShort(Short.parseInt('-100', 8)));
        expect(negParsed.toString()).assertEqual('-64');
        expect(negParsed.toString(8)).assertEqual('-100');
      }

      {
        let acc: Short = new Short(0 as short);
        let one: Short = new Short(100 as short);
        for (let i: int = 0; i < 10; i++) {
          acc = acc.add(one);
        }
        expect(acc.toString()).assertEqual('1000');
        let negAcc: Short = new Short(0 as short);
        let negOne: Short = new Short((-50) as short);
        for (let i: int = 0; i < 5; i++) {
          negAcc = negAcc.add(negOne);
        }
        expect(negAcc.toString()).assertEqual('-250');
      }

      {
        let v: short = 12345 as short;
        let inst1: Short = new Short(v);
        let inst2: Short = new Short(v);
        for (let r: int = 2; r <= 36; r++) {
          expect(inst1.toString(r)).assertEqual(inst2.toString(r));
        }
        expect(inst1.toString()).assertEqual(inst2.toString());
      }

      {
        let status200: Short = new Short(200 as short);
        let status301: Short = new Short(301 as short);
        let status404: Short = new Short(404 as short);
        let status500: Short = new Short(500 as short);
        expect(status200.toString()).assertEqual('200');
        expect(status301.toString()).assertEqual('301');
        expect(status404.toString()).assertEqual('404');
        expect(status500.toString()).assertEqual('500');
        let codes: Short[] = [status200, status301, status404, status500];
        for (let c of codes) {
          let s: string = c.toString();
          expect(s.length).assertEqual(3);
          expect(Int.parseInt(s, 10) >= 100).assertTrue();
          expect(Int.parseInt(s, 10) < 600).assertTrue();
        }
      }

      {
        let highScore: Short = new Short(9999 as short);
        expect(highScore.toString()).assertEqual('9999');
        let penalty: Short = new Short((-500) as short);
        expect(penalty.toString()).assertEqual('-500');
        let zero: Short = new Short(0 as short);
        expect(zero.toString()).assertEqual('0');
        let scores: Short[] = [new Short(100 as short), new Short(0 as short), new Short((-50) as short)];
        let scoreStrs: string[] = scores.map((s) => s.toString());
        expect(scoreStrs[0]).assertEqual('100');
        expect(scoreStrs[1]).assertEqual('0');
        expect(scoreStrs[2]).assertEqual('-50');
      }

      {
        let values: Short[] = [
          new Short(0 as short), new Short(1 as short), new Short((-1) as short),
          new Short(100 as short), new Short((-100) as short)
        ];
        let strs: string[] = values.map((v) => v.toString());
        expect(strs[0]).assertEqual('0');
        expect(strs[1]).assertEqual('1');
        expect(strs[2]).assertEqual('-1');
        expect(strs[3]).assertEqual('100');
        expect(strs[4]).assertEqual('-100');
        let hexStrs: string[] = values.map((v) => v.toString(16));
        expect(hexStrs[3]).assertEqual('64');
        expect(hexStrs[4]).assertEqual('-64');
      }

      {
        let table: Map<string, string> = new Map<string, string>();
        let inst1: Short = new Short(42 as short);
        let inst2: Short = new Short(42 as short);
        table.set(inst1.toString(), 'first');
        table.set(inst2.toString(), 'second');
        expect(table.size).assertEqual(1);
        expect(table.get('42')).assertEqual('second');
        let inst3: Short = new Short((-99) as short);
        table.set(inst3.toString(), 'negative');
        expect(table.size).assertEqual(2);
        expect(table.get('-99')).assertEqual('negative');
      }

      {
        for (let i: int = -128; i <= 127; i++) {
          let inst: Short = new Short(Int.toShort(i));
          expect(inst.toString()).assertEqual(i.toString());
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0700
     * @tc.name testShortToString_merged7
     * @tc.desc CrossTypeRoundTrip / RadixConversion: covers 10 merged test points for Short.toString, including string conversion, radix conversion, loop accumulation, fractions and rounding, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let parts: string[] = [];
        let pow: short = 1 as short;
        for (let i: int = 0; i < 15; i++) {
          let inst: Short = new Short(pow);
          parts.push(inst.toString(2));
          pow = Int.toShort(pow << 1);
        }
        expect(parts[0]).assertEqual('1');
        expect(parts[1]).assertEqual('10');
        expect(parts[2]).assertEqual('100');
        expect(parts[14]).assertEqual('100000000000000');
        let joined: string = parts.join(',');
        expect(joined.startsWith('1,10,100,1000')).assertTrue();
      }

      {
        let x: Short = new Short(100 as short);
        expect(x.toString()).assertEqual('100');
        let step1: Short = x.sub(new Short(30 as short));
        expect(step1.toString()).assertEqual('70');
        let step2: Short = step1.add(new Short(200 as short));
        expect(step2.toString()).assertEqual('270');
        let step3: Short = step2.mul(new Short(3 as short));
        expect(step3.toString()).assertEqual('810');
        let step4: Short = step3.div(new Short(10 as short));
        expect(step4.toString()).assertEqual('81');
      }

      {
        let seen: string[] = [];
        let collision: boolean = false;
        for (let v: int = 0; v < 1000; v++) {
          let s: Short = new Short(Int.toShort(v));
          let str: string = s.toString(10);
          if (seen.indexOf(str) >= 0) {
            collision = true;
            break;
          }
          seen.push(str);
        }
        expect(collision).assertFalse();
      }

      {
        let charSources: char[] = [c'A', c'z', c'0', c'\u4E00', c'\uFFFF'];
        let expectedStrings: string[] = ['65', '122', '48', '19968', '-1'];
        for (let caseIndex: int = 0; caseIndex < charSources.length; caseIndex++) {
          let convertedShort: short = Char.toShort(charSources[caseIndex]);
          let actualResult: string = Short.toString(convertedShort);
          expect(actualResult).assertEqual(expectedStrings[caseIndex]);
        }
      }

      {
        let singleDigitValue: short = 5 as short;
        let doubleDigitValue: short = 42 as short;
        let tripleDigitValue: short = 999 as short;
        let quadrupleDigitValue: short = 1234 as short;
        let quintupleDigitValue: short = Short.MAX_VALUE;
        let singleDigitResult: string = Short.toString(singleDigitValue);
        let doubleDigitResult: string = Short.toString(doubleDigitValue);
        let tripleDigitResult: string = Short.toString(tripleDigitValue);
        let quadrupleDigitResult: string = Short.toString(quadrupleDigitValue);
        let quintupleDigitResult: string = Short.toString(quintupleDigitValue);
        expect(singleDigitResult).assertEqual('5');
        expect(singleDigitResult.length).assertEqual(1);
        expect(doubleDigitResult).assertEqual('42');
        expect(doubleDigitResult.length).assertEqual(2);
        expect(tripleDigitResult).assertEqual('999');
        expect(tripleDigitResult.length).assertEqual(3);
        expect(quadrupleDigitResult).assertEqual('1234');
        expect(quadrupleDigitResult.length).assertEqual(4);
        expect(quintupleDigitResult).assertEqual('32767');
        expect(quintupleDigitResult.length).assertEqual(5);
      }

      {
        let fixedValue: Short = new Short(1000 as short);
        let radices: int[] = [2, 4, 8, 10, 16, 20, 32, 36];
        let binaryLength: int = fixedValue.toString(2).length;
        expect(binaryLength).assertEqual(10);
        for (let index: int = 1; index < radices.length; index++) {
          let previousLength: int = fixedValue.toString(radices[index - 1]).length;
          let currentLength: int = fixedValue.toString(radices[index]).length;
          expect(currentLength <= previousLength).assertTrue();
        }
      }

      {
        let modValues: int[] = [123, 255, 100, 1000, 100, 4096, 8];
        let modRadices: int[] = [8, 8, 8, 16, 10, 8, 8];
        let modStrings: string[] = ['173', '377', '144', '3e8', '100', '10000', '10'];
        for (let caseIndex: int = 0; caseIndex < modValues.length; caseIndex++) {
          let instance: Short = new Short(Int.toShort(modValues[caseIndex]));
          let actualString: string = instance.toString(modRadices[caseIndex]);
          expect(actualString).assertEqual(modStrings[caseIndex]);
          let lastCharacter: string = actualString.substring(actualString.length - 1);
          let remainder: int = modValues[caseIndex] % modRadices[caseIndex];
          expect(Int.parseInt(lastCharacter, 10)).assertEqual(remainder);
        }
      }

      {
        let fiveDigitInstance: Short = new Short(12345 as short);
        let actualResult: String = fiveDigitInstance.toString();
        expect(actualResult.length).assertEqual(5);
        expect(actualResult).assertEqual('12345');
      }

      {
        let negativeValues: short[] = [(-15) as short, (-16) as short, (-100) as short, (-255) as short, (-1000) as short];
        let positiveValues: short[] = [15 as short, 16 as short, 100 as short, 255 as short, 1000 as short];
        let radices: int[] = [16, 16, 8, 16, 36];
        let expectedNegativeStrings: string[] = ['-f', '-10', '-144', '-ff', '-rs'];
        for (let caseIndex: int = 0; caseIndex < negativeValues.length; caseIndex++) {
          let negativeInstance: Short = new Short(negativeValues[caseIndex]);
          let positiveInstance: Short = new Short(positiveValues[caseIndex]);
          let negativeString: string = negativeInstance.toString(radices[caseIndex]);
          let positiveString: string = positiveInstance.toString(radices[caseIndex]);
          expect(negativeString).assertEqual(expectedNegativeStrings[caseIndex]);
          expect(negativeString).assertEqual('-' + positiveString);
        }
      }

      {
        let negativeHexValues: short[] = [(-32) as short, (-256) as short, (-4096) as short, (-8192) as short];
        let expectedStrings: string[] = ['-20', '-100', '-1000', '-2000'];
        for (let caseIndex: int = 0; caseIndex < negativeHexValues.length; caseIndex++) {
          expect(new Short(negativeHexValues[caseIndex]).toString(16)).assertEqual(expectedStrings[caseIndex]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0800
     * @tc.name testShortToString_merged8
     * @tc.desc RadixConversion: covers 10 merged test points for Short.toString, including radix conversion, string conversion, equality consistency, fractions and rounding, and zero values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let radices: int[] = [2, 8, 10, 16, 36];
        for (let caseIndex: int = 0; caseIndex < radices.length; caseIndex++) {
          let zeroString: string = new Short(0 as short).toString(radices[caseIndex]);
          expect(zeroString).assertEqual('0');
          expect(zeroString.length).assertEqual(1);
        }
        let nonZeroValues: short[] = [1 as short, 5 as short, 255 as short, 1000 as short, (-1) as short, Short.MAX_VALUE];
        let nonZeroRadices: int[] = [2, 2, 16, 8, 16, 16];
        let expectedStrings: string[] = ['1', '101', 'ff', '1750', '-1', '7fff'];
        for (let caseIndex: int = 0; caseIndex < nonZeroValues.length; caseIndex++) {
          let actualString: string = new Short(nonZeroValues[caseIndex]).toString(nonZeroRadices[caseIndex]);
          expect(actualString).assertEqual(expectedStrings[caseIndex]);
          expect(actualString.startsWith('0')).assertFalse();
        }
      }

      {
        let values: short[] = [0 as short, 1 as short, 2 as short, 3 as short, 8 as short, 15 as short,
          16 as short, 31 as short, 100 as short, 255 as short, 1024 as short, Short.MAX_VALUE];
        let expectedPopcounts: int[] = [0, 1, 1, 2, 1, 4, 1, 5, 3, 8, 1, 15];
        for (let caseIndex: int = 0; caseIndex < values.length; caseIndex++) {
          let binaryString: string = new Short(values[caseIndex]).toString(2);
          let oneCount: int = 0;
          for (let charIndex: int = 0; charIndex < binaryString.length; charIndex++) {
            if (binaryString.substring(charIndex, charIndex + 1) === '1') {
              oneCount++;
            }
          }
          expect(oneCount).assertEqual(expectedPopcounts[caseIndex]);
        }
      }

      {
        let radixSourceValue: short = 255 as short;
        let radixInstance: Short = new Short(radixSourceValue);
        let binaryResult: string = radixInstance.toString(2);
        let octalResult: string = radixInstance.toString(8);
        let decimalResult: string = radixInstance.toString(10);
        let hexResult: string = radixInstance.toString(16);
        let base36Result: string = radixInstance.toString(36);
        expect(binaryResult).assertEqual('11111111');
        expect(octalResult).assertEqual('377');
        expect(decimalResult).assertEqual('255');
        expect(hexResult).assertEqual('ff');
        expect(base36Result).assertEqual('73');
      }

      {
        let positiveInstance: Short = new Short(42 as short);
        let zeroInstance: Short = new Short(0 as short);
        let negativeInstance: Short = new Short((-1) as short);
        let positiveDecimalResult: string = positiveInstance.toString(10);
        let positiveHexResult: string = positiveInstance.toString(16);
        let zeroDecimalResult: string = zeroInstance.toString(10);
        let zeroBinaryResult: string = zeroInstance.toString(2);
        let negativeDecimalResult: string = negativeInstance.toString(10);
        let negativeHexResult: string = negativeInstance.toString(16);
        expect(positiveDecimalResult).assertEqual('42');
        expect(positiveHexResult).assertEqual('2a');
        expect(zeroDecimalResult).assertEqual('0');
        expect(zeroBinaryResult).assertEqual('0');
        expect(negativeDecimalResult).assertEqual('-1');
        expect(negativeHexResult).assertEqual('-1');
      }

      {
        let values: short[] = [0 as short, 5 as short, 9 as short, 27 as short, 585 as short, 255 as short];
        let radices: int[] = [10, 2, 2, 2, 2, 16];
        let expectedStrings: string[] = ['0', '101', '1001', '11011', '1001001001', 'ff'];
        for (let caseIndex: int = 0; caseIndex < values.length; caseIndex++) {
          let actualString: string = new Short(values[caseIndex]).toString(radices[caseIndex]);
          expect(actualString).assertEqual(expectedStrings[caseIndex]);
          let isPalindrome: boolean = true;
          for (let charIndex: int = 0; charIndex * 2 < actualString.length; charIndex++) {
            let headChar: string = actualString.substring(charIndex, charIndex + 1);
            let tailChar: string = actualString.substring(actualString.length - 1 - charIndex, actualString.length - charIndex);
            if (headChar != tailChar) {
              isPalindrome = false;
            }
          }
          expect(isPalindrome).assertTrue();
        }
      }

      {
        let values: short[] = [Short.MAX_VALUE, Short.MAX_VALUE, Short.MAX_VALUE, 1000 as short, 4096 as short, 500 as short];
        let radices: int[] = [16, 8, 10, 8, 16, 10];
        let expectedStrings: string[] = ['7fff', '77777', '32767', '1750', '1000', '500'];
        let expectedLengths: int[] = [4, 5, 5, 4, 4, 3];
        let highestPowers: int[] = [4096, 4096, 10000, 512, 4096, 100];
        let expectedLeadingDigits: string[] = ['7', '7', '3', '1', '1', '5'];
        for (let caseIndex: int = 0; caseIndex < values.length; caseIndex++) {
          let instance: Short = new Short(values[caseIndex]);
          let actualString: string = instance.toString(radices[caseIndex]);
          expect(actualString).assertEqual(expectedStrings[caseIndex]);
          expect(actualString.length).assertEqual(expectedLengths[caseIndex]);
          let valueAsInt: int = instance.toInt();
          let leadingQuotient: int = Int.toInt((valueAsInt - (valueAsInt % highestPowers[caseIndex])) / highestPowers[caseIndex]);
          expect(actualString.substring(0, 1)).assertEqual(expectedLeadingDigits[caseIndex]);
          expect(Int.parseInt(actualString.substring(0, 1), 10)).assertEqual(leadingQuotient);
        }
      }

      {
        let hexValues: short[] = [2748 as short, 2749 as short, 2750 as short, 2752 as short];
        let hexStrings: string[] = ['abc', 'abd', 'abe', 'ac0'];
        for (let caseIndex: int = 0; caseIndex < hexValues.length; caseIndex++) {
          let actualString: string = new Short(hexValues[caseIndex]).toString(16);
          expect(actualString).assertEqual(hexStrings[caseIndex]);
          expect(actualString.length).assertEqual(3);
        }
        for (let caseIndex: int = 0; caseIndex + 1 < hexValues.length; caseIndex++) {
          let actualString: string = new Short(hexValues[caseIndex]).toString(16);
          expect(actualString <= hexStrings[caseIndex + 1]).assertTrue();
        }
        let octalValues: short[] = [64 as short, 65 as short, 72 as short, 73 as short];
        let octalStrings: string[] = ['100', '101', '110', '111'];
        for (let caseIndex: int = 0; caseIndex < octalValues.length; caseIndex++) {
          let actualString: string = new Short(octalValues[caseIndex]).toString(8);
          expect(actualString).assertEqual(octalStrings[caseIndex]);
          expect(actualString.length).assertEqual(3);
        }
        for (let caseIndex: int = 0; caseIndex + 1 < octalValues.length; caseIndex++) {
          let actualString: string = new Short(octalValues[caseIndex]).toString(8);
          expect(actualString <= octalStrings[caseIndex + 1]).assertTrue();
        }
        let decimalValues: short[] = [10 as short, 11 as short, 12 as short, 19 as short];
        let decimalStrings: string[] = ['10', '11', '12', '19'];
        for (let caseIndex: int = 0; caseIndex < decimalValues.length; caseIndex++) {
          let actualString: string = new Short(decimalValues[caseIndex]).toString(10);
          expect(actualString).assertEqual(decimalStrings[caseIndex]);
          expect(actualString.length).assertEqual(2);
        }
        for (let caseIndex: int = 0; caseIndex + 1 < decimalValues.length; caseIndex++) {
          let actualString: string = new Short(decimalValues[caseIndex]).toString(10);
          expect(actualString <= decimalStrings[caseIndex + 1]).assertTrue();
        }
      }

      {
        let asciiChars: char[] = [c'A', c'Z', c'a', c'z', c'0', c'9'];
        let expectedHexStrings: string[] = ['41', '5a', '61', '7a', '30', '39'];
        for (let caseIndex: int = 0; caseIndex < asciiChars.length; caseIndex++) {
          let codeShort: short = Char.toShort(asciiChars[caseIndex]);
          expect(new Short(codeShort).toString(16)).assertEqual(expectedHexStrings[caseIndex]);
        }
      }

      {
        let values: short[] = [100 as short, 255 as short, 1000 as short, 12345 as short, 32767 as short];
        let baseRadices: int[] = [3, 2, 5, 4, 6];
        let squareRadices: int[] = [9, 4, 25, 16, 36];
        for (let caseIndex: int = 0; caseIndex < values.length; caseIndex++) {
          let baseR: int = baseRadices[caseIndex];
          let squareR: int = squareRadices[caseIndex];
          let baseString: string = new Short(values[caseIndex]).toString(baseR);
          let expected: string = new Short(values[caseIndex]).toString(squareR);
          let reconstructed: string = '';
          let position: int = baseString.length;
          while (position > 0) {
            let chunkStart: int = position - 2;
            if (chunkStart < 0) {
              chunkStart = 0;
            }
            let chunk: string = baseString.substring(chunkStart, position);
            let digitValue: int = Int.parseInt(chunk, baseR);
            let digitChar: string = digitValue.toString(squareR);
            reconstructed = digitChar + reconstructed;
            position = chunkStart;
          }
          expect(reconstructed).assertEqual(expected);
        }
      }

      {
        let negativeValues: short[] = [(-171) as short, (-188) as short, (-205) as short, (-222) as short, (-239) as short];
        let decimalStrings: string[] = ['-171', '-188', '-205', '-222', '-239'];
        let hexStrings: string[] = ['-ab', '-bc', '-cd', '-de', '-ef'];
        for (let caseIndex: int = 0; caseIndex < negativeValues.length; caseIndex++) {
          let instance: Short = new Short(negativeValues[caseIndex]);
          let decimalResult: string = instance.toString(10);
          let hexResult: string = instance.toString(16);
          expect(decimalResult).assertEqual(decimalStrings[caseIndex]);
          expect(hexResult).assertEqual(hexStrings[caseIndex]);
          let decimalMagnitude: int = Int.parseInt(decimalResult.substring(1), 10);
          let hexMagnitude: int = Int.parseInt(hexResult.substring(1), 16);
          expect(decimalMagnitude).assertEqual(hexMagnitude);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0900
     * @tc.name testShortToString_merged9
     * @tc.desc RadixConversion: covers 10 merged test points for Short.toString, including radix conversion, string conversion, zero values, fractions and rounding, and round-trip conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let posInstance: Short = new Short(100 as short);
        let negInstance: Short = new Short((-100) as short);
        let zeroInstance: Short = new Short(0 as short);
        expect(posInstance.toString(3)).assertEqual('10201');
        expect(negInstance.toString(3)).assertEqual('-10201');
        expect(zeroInstance.toString(3)).assertEqual('0');
      }

      {
        let roundTripValues: short[] = [42 as short, (-42) as short, 255 as short, (-255) as short,
          1000 as short, (-1000) as short, Short.MAX_VALUE, Short.MIN_VALUE];
        for (let valueIndex: int = 0; valueIndex < roundTripValues.length; valueIndex++) {
          let instance: Short = new Short(roundTripValues[valueIndex]);
          for (let currentRadix: int = 2; currentRadix <= 36; currentRadix++) {
            let serialized: string = instance.toString(currentRadix);
            expect(Short.parseInt(serialized, currentRadix)).assertEqual(roundTripValues[valueIndex]);
          }
        }
      }

      {
        let zeroInstance: Short = new Short(0 as short);
        for (let currentRadix: int = 2; currentRadix <= 36; currentRadix++) {
          let result: string = zeroInstance.toString(currentRadix);
          expect(result).assertEqual('0');
        }
      }

      {
        let testNumbers: short[] = [100 as short, 100 as short, 100 as short, 255 as short, 255 as short, 42 as short, 42 as short];
        let testRadices: int[] = [2, 8, 16, 2, 16, 3, 7];
        let pairCount: int = 7;
        for (let pi: int = 0; pi < pairCount; pi++) {
          let shortValue: short = testNumbers[pi];
          let radixVal: int = testRadices[pi];
          let instance: Short = new Short(shortValue);
          let stringResult: string = instance.toString(radixVal);
          let parsedBack: int = Int.parseInt(stringResult, radixVal);
          let expectedInt: int = shortValue;
          expect(parsedBack).assertEqual(expectedInt);
        }
      }

      {
        let values: short[] = [0 as short, 1 as short, (-1) as short, 42 as short, (-128) as short, 500 as short, (-500) as short, Short.MAX_VALUE, Short.MIN_VALUE];
        let caseCount: int = 9;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let instance: Short = new Short(values[caseIndex]);
          let noArgResult: String = instance.toString();
          let radix10Result: string = instance.toString(10);
          expect(radix10Result).assertEqual(noArgResult);
        }
      }

      {
        let instance: Short = new Short(42 as short);
        let expectedResults: string[] = [
          '101010', '1120', '222', '132', '110', '60', '52', '46',
          '42', '39', '36', '33', '30', '2c', '2a', '28', '26',
          '24', '22', '20', '1k', '1j', '1i', '1h', '1g', '1f',
          '1e', '1d', '1c', '1b', '1a', '19', '18', '17', '16'
        ];
        for (let currentRadix: int = 2; currentRadix <= 36; currentRadix++) {
          let actualResult: string = instance.toString(currentRadix);
          let expectedIndex: int = currentRadix - 2;
          expect(actualResult).assertEqual(expectedResults[expectedIndex]);
        }
      }

      {
        let instance: Short = new Short((-42) as short);
        let expectedResults: string[] = [
          '-101010', '-1120', '-222', '-132', '-110', '-60', '-52', '-46',
          '-42', '-39', '-36', '-33', '-30', '-2c', '-2a', '-28', '-26',
          '-24', '-22', '-20', '-1k', '-1j', '-1i', '-1h', '-1g', '-1f',
          '-1e', '-1d', '-1c', '-1b', '-1a', '-19', '-18', '-17', '-16'
        ];
        for (let currentRadix: int = 2; currentRadix <= 36; currentRadix++) {
          let actualResult: string = instance.toString(currentRadix);
          let expectedIndex: int = currentRadix - 2;
          expect(actualResult).assertEqual(expectedResults[expectedIndex]);
        }
      }

      {
        let posOneInstance: Short = new Short(1 as short);
        let negOneInstance: Short = new Short((-1) as short);
        for (let currentRadix: int = 2; currentRadix <= 36; currentRadix++) {
          expect(posOneInstance.toString(currentRadix)).assertEqual('1');
          expect(negOneInstance.toString(currentRadix)).assertEqual('-1');
        }
      }

      {
        let noteC4: Short = new Short(60 as short);
        let noteA4: Short = new Short(69 as short);
        let velocityMax: Short = new Short(127 as short);
        let ccVolume: Short = new Short(64 as short);
        let ccPan: Short = new Short(0x7F as short);
        let bendMin: Short = new Short((-8192) as short);
        let bendMax: Short = new Short(8191 as short);
        expect(noteC4.toString()).assertEqual('60');
        expect(noteA4.toString()).assertEqual('69');
        expect(velocityMax.toString()).assertEqual('127');
        expect(ccVolume.toString(16)).assertEqual('40');
        expect(ccPan.toString(16)).assertEqual('7f');
        expect(bendMin.toString()).assertEqual('-8192');
        expect(bendMax.toString()).assertEqual('8191');
        expect(bendMax.toString(16)).assertEqual('1fff');
      }

      {
        let value: Short = new Short(42 as short);
        let radixTable: Map<int, string> = new Map<int, string>();
  
        for (let radix: int = 2; radix <= 36; radix++) {
          radixTable.set(radix, value.toString(radix));
        }
  
        expect(radixTable.get(2)).assertEqual('101010');
        expect(radixTable.get(8)).assertEqual('52');
        expect(radixTable.get(10)).assertEqual('42');
        expect(radixTable.get(16)).assertEqual('2a');
        expect(radixTable.get(36)).assertEqual('16');
  
        for (let radix: int = 2; radix <= 36; radix++) {
          let viaShort: string = radixTable.get(radix) as string;
          let viaLong: string = value.toLong().toString(radix);
          expect(viaShort).assertEqual(viaLong);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_1000
     * @tc.name testShortToString_merged10
     * @tc.desc RadixConversion: covers 10 merged test points for Short.toString, including radix conversion, string conversion, fractions and rounding, containers and references, and sign handling.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let value: Short = new Short(100 as short);
  
        let representations: Set<string> = new Set<string>();
  
        let radices: int[] = [2, 4, 8, 10, 16, 20, 32, 36];
        for (let r of radices) {
          representations.add(value.toString(r));
        }
  
        expect(representations.size).assertEqual(radices.length);
  
        for (let r of radices) {
          let viaShort: string = value.toString(r);
          let viaInt: string = (100).toString(r);
          expect(viaShort).assertEqual(viaInt);
        }
      }

      {
        let validChars: string = '0123456789abcdefghijklmnopqrstuvwxyz';
        let testValues: short[] = [0 as short, 1 as short, (-1) as short, 255 as short, (-32768) as short, 32767 as short];
        let testRadices: int[] = [2, 11, 20, 30, 36];
        for (let v of testValues) {
          let inst: Short = new Short(v);
          for (let r of testRadices) {
            let s: string = inst.toString(r);
            let startIdx: int = s.startsWith('-') ? 1 : 0;
            for (let i: int = startIdx; i < s.length; i++) {
              let ch: string = s.substring(i, i + 1);
              let allowedSet: string = validChars.substring(0, r);
              expect(allowedSet.indexOf(ch) >= 0).assertTrue();
            }
          }
        }
      }

      {
        let negValues: short[] = [(-1) as short, (-16) as short, (-255) as short, (-4096) as short, Short.MIN_VALUE];
        for (let v of negValues) {
          let inst: Short = new Short(v);
          for (let r: int = 2; r <= 36; r += 3) {
            let s: string = inst.toString(r);
            expect(s.startsWith('-')).assertTrue();
            expect(s.indexOf('-', 1)).assertEqual(-1);
          }
        }
      }

      {
        let inst: Short = new Short(255 as short);
        let results: string[] = [];
        let radices: int[] = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 16, 20, 36];
        let expectedStrs: string[] = ['11111111', '100110', '3333', '2010', '1103', '513', '377', '313', '255', '212', 'ff', 'cf', '73'];
        for (let r of radices) {
          results.push(inst.toString(r));
        }
        for (let i: int = 0; i < results.length; i++) {
          expect(results[i]).assertEqual(expectedStrs[i]);
          for (let j: int = i + 1; j < results.length; j++) {
            expect(results[i] !== results[j]).assertTrue();
          }
        }
      }

      {
        let values: short[] = [0 as short, 15 as short, (-15) as short, 127 as short, (-128) as short, 1000 as short, Short.MAX_VALUE, Short.MIN_VALUE];
        let radices: int[] = [2, 8, 10, 16, 36];
        for (let v of values) {
          let inst: Short = new Short(v);
          for (let r of radices) {
            expect(inst.toString(r)).assertEqual(inst.toInt().toString(r));
          }
        }
      }

      {
        let pairs: [short, short][] = [
          [1 as short, 9 as short], [10 as short, 99 as short], [100 as short, 999 as short],
          [1000 as short, 9999 as short], [10000 as short, 32767 as short]
        ];
        let expectedSmalls: string[] = ['1', '10', '100', '1000', '10000'];
        let expectedLarges: string[] = ['9', '99', '999', '9999', '32767'];
        for (let idx: int = 0; idx < pairs.length; idx++) {
          let pair: [short, short] = pairs[idx];
          let smallInst: Short = new Short(pair[0]);
          let largeInst: Short = new Short(pair[1]);
          expect(smallInst.toString()).assertEqual(expectedSmalls[idx]);
          expect(largeInst.toString()).assertEqual(expectedLarges[idx]);
          expect(smallInst.toString().length <= largeInst.toString().length).assertTrue();
        }
      }

      {
        let perm755: Short = new Short(Int.toShort(0x1ED));
        expect(perm755.toString(8)).assertEqual('755');
        let perm644: Short = new Short(Int.toShort(0x1A4));
        expect(perm644.toString(8)).assertEqual('644');
        let perm700: Short = new Short(Int.toShort(0x1C0));
        expect(perm700.toString(8)).assertEqual('700');
        let perm000: Short = new Short(0 as short);
        expect(perm000.toString(8)).assertEqual('0');
      }

      {
        let octets: Short[] = [
          new Short(0xDE as short), new Short(0xAD as short), new Short(0xBE as short),
          new Short(0xEF as short), new Short(0x00 as short), new Short(0xFF as short)
        ];
        let hexParts: string[] = [];
        for (let o of octets) {
          let hex: string = o.toString(16);
          if (hex.length === 1) {
            hex = '0' + hex;
          }
          hexParts.push(hex);
        }
        expect(hexParts[0]).assertEqual('de');
        expect(hexParts[5]).assertEqual('ff');
        let mac: string = hexParts.join(':');
        expect(mac).assertEqual('de:ad:be:ef:00:ff');
      }

      {
        let adc10bitMax: Short = new Short(1023 as short);
        expect(adc10bitMax.toString()).assertEqual('1023');
        expect(adc10bitMax.toString(16)).assertEqual('3ff');
        let adc12bitMax: Short = new Short(4095 as short);
        expect(adc12bitMax.toString()).assertEqual('4095');
        expect(adc12bitMax.toString(16)).assertEqual('fff');
        let adcMid: Short = new Short(512 as short);
        expect(adcMid.toString()).assertEqual('512');
        expect(adcMid.toString(2)).assertEqual('1000000000');
        let adcZero: Short = new Short(0 as short);
        expect(adcZero.toString(10)).assertEqual('0');
      }

      {
        let bcdValue: Short = new Short(Int.toShort(0x59));
        let hex: string = bcdValue.toString(16);
        expect(hex).assertEqual('59');
        let highDigit: string = hex.substring(0, 1);
        let lowDigit: string = hex.substring(1, 2);
        expect(highDigit).assertEqual('5');
        expect(lowDigit).assertEqual('9');
        let bcdZero: Short = new Short(Int.toShort(0x00));
        expect(bcdZero.toString(16)).assertEqual('0');
        let bcdMax: Short = new Short(Int.toShort(0x99));
        expect(bcdMax.toString(16)).assertEqual('99');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_1100
     * @tc.name testShortToString_merged11
     * @tc.desc RadixConversion: covers 10 merged test points for Short.toString, including radix conversion, string conversion, negative values, round-trip conversion, and business scenarios.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString_merged11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let crc0: Short = new Short(0x3A as short);
        expect(crc0.toString(16)).assertEqual('3a');
        let crc1: Short = new Short(0xFF as short);
        expect(crc1.toString(16)).assertEqual('ff');
        let crc2: Short = new Short(0x00 as short);
        expect(crc2.toString(16)).assertEqual('0');
        let crc3: Short = new Short(0xAB as short);
        expect(crc3.toString(16)).assertEqual('ab');
        let crc4: Short = new Short(0xC5 as short);
        expect(crc4.toString(16)).assertEqual('c5');
      }

      {
        let reg7bit: Short = new Short(0x50 as short);
        expect(reg7bit.toString(16)).assertEqual('50');
        expect(reg7bit.toString(2)).assertEqual('1010000');
        let reg8bit: Short = new Short(0xFF as short);
        expect(reg8bit.toString(16)).assertEqual('ff');
        expect(reg8bit.toString(2)).assertEqual('11111111');
        let regZero: Short = new Short(0x00 as short);
        expect(regZero.toString(16)).assertEqual('0');
        let regMid: Short = new Short(0x7F as short);
        expect(regMid.toString(16)).assertEqual('7f');
      }

      {
        let small: Short = new Short(127 as short);
        let smallStr: string = small.toInt() < 256 ? small.toString(16) : small.toString();
        expect(smallStr).assertEqual('7f');
        let large: Short = new Short(256 as short);
        let largeStr: string = large.toInt() < 256 ? large.toString(16) : large.toString();
        expect(largeStr).assertEqual('256');
        let boundary: Short = new Short(255 as short);
        let boundaryStr: string = boundary.toInt() < 256 ? boundary.toString(16) : boundary.toString();
        expect(boundaryStr).assertEqual('ff');
      }

      {
        let nums: Short[] = [
          new Short(3 as short), new Short(30 as short), new Short(300 as short),
          new Short(3000 as short), new Short(5 as short), new Short(50 as short),
          new Short((-35) as short), new Short(32767 as short)
        ];
        let filtered: Short[] = [];
        for (let n of nums) {
          if (n.toString().startsWith('3')) {
            filtered.push(n);
          }
        }
        expect(filtered.length).assertEqual(5);
        expect(filtered[0].toInt()).assertEqual(3);
        expect(filtered[1].toInt()).assertEqual(30);
        expect(filtered[2].toInt()).assertEqual(300);
        expect(filtered[3].toInt()).assertEqual(3000);
        expect(filtered[4].toInt()).assertEqual(32767);
      }

      {
        let formatShort = (val: Short): string => {
          let n: int = val.toInt();
          if (n < 0) {
            return `-0x${val.toString(16).substring(1)}`;
          }
          if (n < 8) {
            return `0b${val.toString(2)}`;
          }
          if (n < 256) {
            return `0x${val.toString(16)}`;
          }
          return val.toString(10);
        };
        expect(formatShort(new Short(5 as short))).assertEqual('0b101');
        expect(formatShort(new Short(127 as short))).assertEqual('0x7f');
        expect(formatShort(new Short(1000 as short))).assertEqual('1000');
        expect(formatShort(new Short((-42) as short))).assertEqual('-0x2a');
      }

      {
        let powers: Short[] = [];
        let val: short = 1 as short;
        for (let i: int = 0; i < 15; i++) {
          powers.push(new Short(val));
          val = Int.toShort(val << 1);
        }
        for (let p of powers) {
          let bin: string = p.toString(2);
          expect(bin.startsWith('1')).assertTrue();
          expect(bin.substring(1).indexOf('1')).assertEqual(-1);
          expect(!p.toString(4).startsWith('-')).assertTrue();
          let dec: string = p.toString(10);
          expect(Int.parseInt(dec, 10) > 0).assertTrue();
        }
        expect(powers[0].toString(2)).assertEqual('1');
        expect(powers[1].toString(2)).assertEqual('10');
        expect(powers[8].toString(2)).assertEqual('100000000');
        expect(powers[14].toString(2)).assertEqual('100000000000000');
      }

      {
        let mismatch: int = 0;
        for (let i: int = -32768; i <= 32767; i++) {
          let inst: Short = new Short(Int.toShort(i));
          let str: string = inst.toString(10);
          let parsed: short = Short.parseInt(str, 10);
          if (parsed !== i) {
            mismatch++;
          }
        }
        expect(mismatch).assertEqual(0);
      }

      {
        let red: Short = new Short(255 as short);
        let green: Short = new Short(128 as short);
        let blue: Short = new Short(0 as short);
        let r: string = red.toString(16);
        let g: string = green.toString(16);
        let b: string = blue.toString(16);
        let hexColor: string = '#' + (r.length == 1 ? '0' + r : r) + (g.length == 1 ? '0' + g : g) + (b.length == 1 ? '0' + b : b);
        expect(hexColor.length).assertEqual(7);
        expect(hexColor).assertEqual('#ff8000');
      }

      {
        let negVal: Short = new Short((-42) as short);
        let radices: int[] = [2, 8, 10, 16, 36];
        for (let r of radices) {
          expect(negVal.toString(r)).assertEqual(negVal.toLong().toString(r));
        }
        let minVal: Short = new Short(Short.MIN_VALUE);
        expect(minVal.toString(16)).assertEqual(minVal.toLong().toString(16));
      }

      {
        let negVal: Short = new Short((-42) as short);
        let parsed: short = Short.parseInt(negVal.toString(3), 3);
        expect(new Short(parsed).equals(negVal)).assertTrue();
        let minVal: Short = new Short(Short.MIN_VALUE);
        let parsed2: short = Short.parseInt(minVal.toString(16), 16);
        expect(new Short(parsed2).equals(minVal)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_1200
     * @tc.name testShortToString_merged12
     * @tc.desc Idempotent / ArithmeticBitwise: covers 10 merged test points for Short.toString, including string conversion, radix conversion, idempotence, type conversion, and business scenarios.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString_merged12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let inputValue: short = 999 as short;
        let beforeLoopResult: string = Short.toString(inputValue);
        expect(beforeLoopResult).assertEqual('999');
        let maxIterations: int = 5;
        for (let iterationIndex: int = 0; iterationIndex < maxIterations; iterationIndex++) {
          let currentLoopResult: string = Short.toString(inputValue);
          expect(currentLoopResult).assertEqual('999');
          expect(currentLoopResult).assertEqual(beforeLoopResult);
        }
        let afterLoopResult: string = Short.toString(inputValue);
        expect(afterLoopResult).assertEqual('999');
        expect(afterLoopResult).assertEqual(beforeLoopResult);
      }

      {
        let hexValues: short[] = [15 as short, 255 as short, 4095 as short];
        let hexStrings: string[] = ['f', 'ff', 'fff'];
        for (let caseIndex: int = 0; caseIndex < hexValues.length; caseIndex++) {
          expect(new Short(hexValues[caseIndex]).toString(16)).assertEqual(hexStrings[caseIndex]);
        }
        let octalValues: short[] = [7 as short, 63 as short, 511 as short, 4095 as short];
        let octalStrings: string[] = ['7', '77', '777', '7777'];
        for (let caseIndex: int = 0; caseIndex < octalValues.length; caseIndex++) {
          expect(new Short(octalValues[caseIndex]).toString(8)).assertEqual(octalStrings[caseIndex]);
        }
      }

      {
        let positiveInstance: Short = new Short(100 as short);
        let negativeInstance: Short = new Short((-200) as short);
        let positiveFirstResult: String = positiveInstance.toString();
        let positiveSecondResult: String = positiveInstance.toString();
        let positiveThirdResult: String = positiveInstance.toString();
        let negativeFirstResult: String = negativeInstance.toString();
        let negativeSecondResult: String = negativeInstance.toString();
        let negativeThirdResult: String = negativeInstance.toString();
        expect(positiveFirstResult).assertEqual('100');
        expect(positiveSecondResult).assertEqual('100');
        expect(positiveThirdResult).assertEqual('100');
        expect(negativeFirstResult).assertEqual('-200');
        expect(negativeSecondResult).assertEqual('-200');
        expect(negativeThirdResult).assertEqual('-200');
        expect(positiveSecondResult).assertEqual(positiveFirstResult);
        expect(positiveThirdResult).assertEqual(positiveSecondResult);
        expect(negativeSecondResult).assertEqual(negativeFirstResult);
        expect(negativeThirdResult).assertEqual(negativeSecondResult);
      }

      {
        let firstInstance: Short = new Short(321 as short);
        let secondInstance: Short = new Short(321 as short);
        let firstInitialResult: String = firstInstance.toString();
        let firstRepeatedResult: String = firstInstance.toString();
        let secondResult: String = secondInstance.toString();
        expect(firstInitialResult).assertEqual('321');
        expect(firstRepeatedResult).assertEqual('321');
        expect(secondResult).assertEqual('321');
        expect(firstRepeatedResult).assertEqual(firstInitialResult);
        expect(secondResult).assertEqual(firstInitialResult);
      }

      {
        let values: short[] = [1200 as short, 1000 as short, 255 as short, 4095 as short, 123 as short, Short.MAX_VALUE];
        let hexStrings: string[] = ['4b0', '3e8', 'ff', 'fff', '7b', '7fff'];
        for (let caseIndex: int = 0; caseIndex < values.length; caseIndex++) {
          let instance: Short = new Short(values[caseIndex]);
          let hexString: string = instance.toString(16);
          expect(hexString).assertEqual(hexStrings[caseIndex]);
          let digitSum: int = 0;
          for (let charIndex: int = 0; charIndex < hexString.length; charIndex++) {
            digitSum += Int.parseInt(hexString.substring(charIndex, charIndex + 1), 16);
          }
          expect(digitSum % 15).assertEqual(instance.toInt() % 15);
        }
      }

      {
        let radixInstance: Short = new Short(42 as short);
        let firstBinaryResult: string = radixInstance.toString(2);
        let secondBinaryResult: string = radixInstance.toString(2);
        let thirdBinaryResult: string = radixInstance.toString(2);
        expect(firstBinaryResult).assertEqual('101010');
        expect(secondBinaryResult).assertEqual('101010');
        expect(thirdBinaryResult).assertEqual('101010');
        expect(secondBinaryResult).assertEqual(firstBinaryResult);
        expect(thirdBinaryResult).assertEqual(secondBinaryResult);
      }

      {
        let radixInstance: Short = new Short(42 as short);
        let storedValueBeforeCalls: short = radixInstance.toShort();
        let decimalResult: string = radixInstance.toString(10);
        let hexResult: string = radixInstance.toString(16);
        let binaryResult: string = radixInstance.toString(2);
        let octalResult: string = radixInstance.toString(8);
        let base36Result: string = radixInstance.toString(36);
        let storedValueAfterCalls: short = radixInstance.toShort();
        expect(decimalResult).assertEqual('42');
        expect(hexResult).assertEqual('2a');
        expect(binaryResult).assertEqual('101010');
        expect(octalResult).assertEqual('52');
        expect(base36Result).assertEqual('16');
        expect(storedValueBeforeCalls).assertEqual(storedValueAfterCalls);
        expect(storedValueAfterCalls).assertEqual(42 as short);
      }

      {
        let inst: Short = new Short(Short.MAX_VALUE);
        let before: int = inst.toInt();
        for (let r: int = 2; r <= 36; r++) {
          inst.toString(r);
          expect(inst.toInt()).assertEqual(before);
        }
  
        let negInst: Short = new Short(Short.MIN_VALUE);
        let negBefore: int = negInst.toInt();
        for (let r: int = 2; r <= 36; r++) {
          negInst.toString(r);
          expect(negInst.toInt()).assertEqual(negBefore);
        }
      }

      {
        let viaLiteral: Short = new Short(100 as short);
        let viaIntToShort: Short = new Short(Int.toShort(100));
        let viaParseInt: Short = new Short(Int.toShort(Short.parseInt('100', 10)));
        expect(viaLiteral.toString()).assertEqual(viaIntToShort.toString());
        expect(viaLiteral.toString()).assertEqual(viaParseInt.toString());
        expect(viaLiteral.toString(16)).assertEqual(viaIntToShort.toString(16));
        expect(viaLiteral.toString(2)).assertEqual(viaParseInt.toString(2));
        expect(viaLiteral.toString(8)).assertEqual(viaIntToShort.toString(8));
      }

      {
        let major: Short = new Short(2 as short);
        let minor: Short = new Short(4 as short);
        let patch: Short = new Short(99 as short);
        let version: string = `${major.toString()}.${minor.toString()}.${patch.toString()}`;
        expect(version).assertEqual('2.4.99');
        let major0: Short = new Short(0 as short);
        let minor0: Short = new Short(1 as short);
        let patch0: Short = new Short(0 as short);
        let version2: string = `${major0.toString()}.${minor0.toString()}.${patch0.toString()}`;
        expect(version2).assertEqual('0.1.0');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_1300
     * @tc.name testShortToString_merged13
     * @tc.desc BusinessScenario: covers 1 merged test points for Short.toString, including fractions and rounding.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString_merged13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let httpPort: Short = new Short(80 as short);
        expect(httpPort.toString()).assertEqual('80');
        let httpsPort: Short = new Short(443 as short);
        expect(httpsPort.toString()).assertEqual('443');
        let altPort: Short = new Short(8080 as short);
        expect(altPort.toString()).assertEqual('8080');
        let devPort: Short = new Short(3000 as short);
        expect(devPort.toString()).assertEqual('3000');
        let ports: Short[] = [httpPort, httpsPort, altPort, devPort];
        for (let p of ports) {
          let portNum: int = Int.parseInt(p.toString(), 10);
          expect(portNum > 0).assertTrue();
          expect(portNum <= 65535).assertTrue();
        }
      }
    });

  });
}