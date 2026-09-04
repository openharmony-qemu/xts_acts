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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  decodeTostring001,
  decodeTostring0010,
  decodeTostring0011,
  decodeTostring0012,
  decodeTostring0013,
  decodeTostring0014,
  decodeTostring0015,
  decodeTostring0016,
  decodeTostring0017,
  decodeTostring0018,
  decodeTostring0019,
  decodeTostring002,
  decodeTostring0020,
  decodeTostring0021,
  decodeTostring0022,
  decodeTostring0023,
  decodeTostring0024,
  decodeTostring0025,
  decodeTostring0026,
  decodeTostring0027,
  decodeTostring0028,
  decodeTostring0029,
  decodeTostring003,
  decodeTostring0030,
  decodeTostring0031,
  decodeTostring0032,
  decodeTostring0033,
  decodeTostring0034,
  decodeTostring004,
  decodeTostring005,
  decodeTostring006,
  decodeTostring007,
  decodeTostring008,
  decodeTostring009,
  decodeWithStream001,
  decodeWithStream002,
  decodeWithStream003,
  testEncodeInto002,
  testEncodeInto003,
  testEncodeInto004,
  testEncodeInto005,
  testEncodeInto006,
  testEncodeInto007,
  testEncodeInto008,
  testEncodeInto009,
  testEncodeInto010,
  testEncodeInto011,
  testEncodeInto012,
  testEncodeInto013,
  testEncodeInto014,
  testEncodeInto015,
  testEncodeInto016,
  testEncodeInto017,
  testEncodeInto018,
  testEncodeInto019,
  testEncodeInto020,
  testEncodeInto021,
  testEncodeInto022,
  testEncodeInto023,
  testEncodeInto024,
  testEncodeInto025,
  testEncodeInto026,
  testEncodeInto027,
  testEncodeInto028,
  testEncodeInto029,
  testEncodeInto030,
  testEncodeInto031,
  testEncodeInto032,
  testEncodeInto033,
  testEncodeInto034,
  testEncodeInto035,
  testEncodeInto036,
  testEncodeInto037,
  testEncodeInto038,
  testEncodeInto039,
  testEncodeInto040,
  testEncodeInto041,
  testEncodeInto042,
  testEncodeInto043,
  testEncodeInto044,
  testEncodeInto045,
  testEncodeInto046,
  testEncodeIntoThrowError001,
  testEncodeIntoThrowError002,
  testEncoding_001,
  testEncoding_002,
  testEncoding_003,
  testEncoding_004,
  testEncoding_005,
  testEncoding_create_001,
  testEncoding_create_002,
  testEncoding_create_003,
  testEncoding_create_004,
  testEncoding_create_005,
  testEnd001,
  testEnd002,
  testEnd003,
  testEnd004,
  testTextDecoderCreate001,
  testTextDecoderCreate0010,
  testTextDecoderCreate0013,
  testTextDecoderCreate002,
  testTextDecoderCreate003,
  testTextDecoderCreate004,
  testTextDecoderCreate005,
  testTextDecoderCreate006,
  testTextDecoderCreate007,
  testTextDecoderCreate008,
  testTextDecoderCreate009,
  testTextDecoderCreate011,
  testTextDecoderCreate012,
  testTextDecoderCreateThrowError001,
  testTextDecoderCreateThrowError002,
  testTextDecoderCreateThrowError003,
  testWrite001,
  testWrite002,
  testWrite003,
  testWrite004,
  testWrite005,
  testWrite006,
  testWrite007,
  testWrite008,
  testWrite009,
  testWrite010,
  testWrite011,
  testWrite012,
  testWrite013,
  testWrite014,
  testWrite015,
  testWrite016,
  testWrite017,
  testWrite018,
  testWrite019,
  testWrite020,
  testWrite021,
  testWrite022,
  testWrite023,
  testWrite024,
  testWrite025,
  testWrite026,
  testWrite027,
  testWrite028,
  testWrite029,
  testWrite030,
  testWrite031,
  testWrite032,
  testWrite033,
  testWrite034,
  testWrite035,
  testWrite036,
  testWrite037,
  testWrite038,
  testWrite039,
  testWrite040,
  testWrite041,
  testWrite042,
  testWrite043,
  testWrite044,
  testWrite045,
  testWrite046,
  testWrite047,
  testencodeInto001,
  testencodeIntoUint8Array001,
  testencodeIntoUint8Array002,
  testencodeIntoUint8Array003,
  testencodeIntoUint8Array004,
  testencodeIntoUint8Array005,
  testencodeIntoUint8Array006,
  testencodeIntoUint8Array007,
  testencodeIntoUint8Array008,
  testencodeIntoUint8Array009,
  testencodeIntoUint8Array010,
  testencodeIntoUint8Array011,
  testencodeIntoUint8Array012,
  testencodeIntoUint8Array013
} from './Util3Resource';

export default function UtilFunFP3Test() {
  describe('DecodeEncodeFP3Test', () => {
    /**
     * @tc.name   testTextDecoderCreate001
     * @tc.number SUB_COMMONLIBRARY_FP_TEXT_DECODER_CREATE_4180
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDecoderCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testTextDecoderCreate001()).assertEqual('utf-8')
    })

    /**
     * @tc.name   testTextDecoderCreate002
     * @tc.number SUB_COMMONLIBRARY_FP_TEXT_DECODER_CREATE_4190
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDecoderCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testTextDecoderCreate002()).assertEqual('utf-16le')
    })

    /**
     * @tc.name   testTextDecoderCreate003
     * @tc.number SUB_COMMONLIBRARY_FP_TEXT_DECODER_CREATE_4200
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDecoderCreate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testTextDecoderCreate003()).assertEqual('utf-16be')
    })

    /**
     * @tc.name   testTextDecoderCreate004
     * @tc.number SUB_COMMONLIBRARY_FP_TEXT_DECODER_CREATE_4210
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDecoderCreate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testTextDecoderCreate004()).assertEqual('utf-16be')
    })

    /**
     * @tc.name   testTextDecoderCreate005
     * @tc.number SUB_COMMONLIBRARY_FP_TEXT_DECODER_CREATE_4220
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDecoderCreate005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testTextDecoderCreate005()).assertEqual('utf-16be')
    })

    /**
     * @tc.name   testTextDecoderCreate006
     * @tc.number SUB_COMMONLIBRARY_FP_TEXT_DECODER_CREATE_4230
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDecoderCreate006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testTextDecoderCreate006()).assertEqual('utf-8')
    })

    /**
     * @tc.name   testTextDecoderCreate007
     * @tc.number SUB_COMMONLIBRARY_FP_TEXT_DECODER_CREATE_4240
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextDecoderCreate007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testTextDecoderCreate007()).assertEqual('utf-8')
    })

    /**
     * @tc.name   testTextDecoderCreate008
     * @tc.number SUB_COMMONLIBRARY_FP_TEXT_DECODER_CREATE_4250
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextDecoderCreate008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testTextDecoderCreate008()).assertEqual('utf-8')
    })

    /**
     * @tc.name   testTextDecoderCreate009
     * @tc.number SUB_COMMONLIBRARY_FP_TEXT_DECODER_CREATE_4260
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextDecoderCreate009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testTextDecoderCreate009()).assertEqual('utf-8')
    })

    /**
     * @tc.name   testTextDecoderCreate0010
     * @tc.number SUB_COMMONLIBRARY_FP_TEXT_DECODER_CREATE_4270
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextDecoderCreate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testTextDecoderCreate0010()).assertEqual('utf-8')
    })

    /**
     * @tc.name   testTextDecoderCreate011
     * @tc.number SUB_COMMONLIBRARY_FP_TEXT_DECODER_CREATE_4280
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextDecoderCreate011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testTextDecoderCreate011()).assertEqual('utf-8')
    })

    /**
     * @tc.name   testTextDecoderCreate012
     * @tc.number SUB_COMMONLIBRARY_FP_TEXT_DECODER_CREATE_4290
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDecoderCreate012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testTextDecoderCreate012()).assertEqual('utf-8')
    })

    /**
     * @tc.name   testTextDecoderCreate0013
     * @tc.number SUB_COMMONLIBRARY_FP_TEXT_DECODER_CREATE_4300
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDecoderCreate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testTextDecoderCreate0013()).assertEqual('utf-8')
    })

    /**
     * @tc.name   testTextDecoderCreateThrowError001
     * @tc.number SUB_COMMONLIBRARY_FP_TEXT_DECODER_CREATE_THROW_ERROR_4310
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDecoderCreateThrowError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testTextDecoderCreateThrowError001())
        .assertEqual("BusinessError: Parameter error. The type of 123 must be string")
    })

    /**
     * @tc.name   testTextDecoderCreateThrowError002
     * @tc.number SUB_COMMONLIBRARY_FP_TEXT_DECODER_CREATE_THROW_ERROR_4320
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDecoderCreateThrowError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testTextDecoderCreateThrowError002())
        .assertEqual("BusinessError: Parameter error. The type of ignoreBOM must be object")
    })

    /**
     * @tc.name   testTextDecoderCreateThrowError003
     * @tc.number SUB_COMMONLIBRARY_FP_TEXT_DECODER_CREATE_THROW_ERROR_4330
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDecoderCreateThrowError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testTextDecoderCreateThrowError003())
        .assertEqual("BusinessError: Parameter error. The type of 123 must be object")
    })

    /**
     * @tc.name   decodeWithStream001
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDE_WITH_STREAM_4340
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeWithStream001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeWithStream001()).assertEqual(' A15OKFE')
    })

    /**
     * @tc.name   decodeWithStream002
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDE_WITH_STREAM_4350
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeWithStream002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeWithStream002()).assertEqual('CA15 mp')
    })

    /**
     * @tc.name   decodeWithStream003
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDE_WITH_STREAM_4360
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeWithStream003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeWithStream003()).assertEqual('TCA51O ')
    })

    /**
     * @tc.name   decodeTostring001
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING001
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring001()[0]).assertEqual('你\u0000\u0000好\u0000')
      expect(decodeTostring001()[1]).assertEqual(5)
    })

    /**
     * @tc.name   decodeTostring002
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING002
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring002()[0]).assertEqual('\uFEFF你\u0000\u0000好\u0000')
      expect(decodeTostring002()[1]).assertEqual(6)
    })


    /**
     * @tc.name   decodeTostring003
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING003
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring003()[0]).assertEqual('你\u0000\u0000好\u0000')
      expect(decodeTostring003()[1]).assertEqual(5)
    })

    /**
     * @tc.name   decodeTostring004
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING004
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring004()[0]).assertEqual('你\u0000\u0000好\u0000')
      expect(decodeTostring004()[1]).assertEqual(5)
    })

    /**
     * @tc.name   decodeTostring005
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING005
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring005()[0]).assertEqual('你')
      expect(decodeTostring005()[1]).assertEqual('好')
    })

    /**
     * @tc.name   decodeTostring006
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING006
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring006()).assertEqual('')
    })

    /**
     * @tc.name   decodeTostring007
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING007
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring007()).assertEqual('')
    })

    /**
     * @tc.name   decodeTostring008
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING008
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring008()).assertEqual('abc哈哈熠熠')
    })

    /**
     * @tc.name   decodeTostring009
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING009
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring009()).assertEqual('abc哈哈熠熠')
    })

    /**
     * @tc.name   decodeTostring0010
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0010
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0010()).assertEqual('こんにちは')
    })

    /**
     * @tc.name   decodeTostring0011
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0011
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0011()).assertEqual('こんにちは')
    })

    /**
     * @tc.name   decodeTostring0012
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0012
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0012()).assertEqual('Здравствуйте')
    })

    /**
     * @tc.name   decodeTostring0013
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0013
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0013()).assertEqual('abc哈熠')
    })

    /**
     * @tc.name   decodeTostring0014
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0014
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0014()).assertEqual('abc哈熠')
    })

    /**
     * @tc.name   decodeTostring0015
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0015
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0015()).assertEqual('Szia')
    })

    /**
     * @tc.name   decodeTostring0016
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0016
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0016()).assertEqual('Tavaliselt tere päeval')
    })

    /**
     * @tc.name   decodeTostring0017
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0017
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0017()).assertEqual('Здравствуйте')
    })

    /**
     * @tc.name   decodeTostring0018
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0018
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0018()).assertEqual('مرحبا')
    })

    /**
     * @tc.name   decodeTostring0019
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0019
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0019()).assertEqual('Γεια σου')
    })

    /**
     * @tc.name   decodeTostring0020
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0020
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0020()).assertEqual('שלום')
    })

    /**
     * @tc.name   decodeTostring0021
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0021
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0021()).assertEqual('שלום')
    })

    /**
     * @tc.name   decodeTostring0022
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0022
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0022()).assertEqual('שלום')
    })

    /**
     * @tc.name   decodeTostring0023
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0023
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0023()).assertEqual('Hei')
    })

    /**
     * @tc.name   decodeTostring0024
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0024
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0024()).assertEqual('Sveiki')
    })

    /**
     * @tc.name   decodeTostring0025
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0025
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0025()).assertEqual('Diolch')
    })

    /**
     * @tc.name   decodeTostring0026
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0026
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0026()).assertEqual('Hola')
    })

    /**
     * @tc.name   decodeTostring0027
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0027
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0027()).assertEqual('Привет, мир!')
    })

    /**
     * @tc.name   decodeTostring0028
     * @tc.number SUB_COMMONLIBRARY_FP_DEOCDETOSTRING0028
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0028()).assertEqual('Привіт, світ')
    })

    /**
     * @tc.name   testencodeInto001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_4650
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeInto001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testencodeInto001()).assertEqual(0x61)
    })

    /**
     * @tc.name   testEncodeInto002
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_4660
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto002()).assertEqual(188)
    })

    /**
     * @tc.name   testEncodeInto003
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_4670
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto003()).assertEqual(0x61)
    })

    /**
     * @tc.name   testEncodeInto004
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_4680
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto004()).assertEqual(0x62)
    })

    /**
     * @tc.name   testEncodeInto005
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_4690
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto005()[0]).assertEqual(49)
      expect(testEncodeInto005()[1]).assertEqual(230)
    })

    /**
     * @tc.name   testEncodeInto006
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_4700
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto006()).assertEqual(0xbc)
    })

    /**
     * @tc.name   testEncodeInto007
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_4710
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto007()).assertEqual(0xc2)
    })

    /**
     * @tc.name   testEncodeInto008
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_4720
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto008()).assertEqual(0x24)
    })

    /**
     * @tc.name   testEncodeInto009
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_4730
     * @tc.desc   Returns the result of encoder for gb18030.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto009()[0]).assertEqual(97)
      expect(testEncodeInto009()[1]).assertEqual(185)
      expect(testEncodeInto009()[2]).assertEqual(254)
      expect(testEncodeInto009()[3]).assertEqual(236)
      expect(testEncodeInto009()[4]).assertEqual(218)
    })

    /**
     * @tc.name   testEncodeInto010
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_4740
     * @tc.desc   Returns the result of encoder for GB18030.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto010()[0]).assertEqual(97)
      expect(testEncodeInto010()[1]).assertEqual(185)
      expect(testEncodeInto010()[2]).assertEqual(254)
      expect(testEncodeInto010()[3]).assertEqual(236)
      expect(testEncodeInto010()[4]).assertEqual(218)
    })

    /**
     * @tc.name   testEncodeIntoThrowError001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_THROW_ERROR_4750
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeIntoThrowError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeIntoThrowError001())
        .assertEqual("BusinessError: Parameter error. The type of Parameter must be " + "string.")
    })

    /**
     * @tc.name   testEncodeIntoThrowError002
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_THROW_ERROR_4760
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeIntoThrowError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeIntoThrowError002())
        .assertEqual("BusinessError: Parameter error. The type of Parameter must be " + "string.")
    })

    /**
     * @tc.name   testencodeIntoUint8Array001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_UINT8ARRAY_4770
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testencodeIntoUint8Array001()[0]).assertEqual(7)
      expect(testencodeIntoUint8Array001()[1]).assertEqual(13)
    })

    /**
     * @tc.name   testencodeIntoUint8Array002
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_UINT8ARRAY_4780
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testencodeIntoUint8Array002()[0]).assertEqual(4)
      expect(testencodeIntoUint8Array002()[1]).assertEqual(6)
    })

    /**
     * @tc.name   testencodeIntoUint8Array003
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_UINT8ARRAY_4790
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testencodeIntoUint8Array003()[0]).assertEqual(4)
      expect(testencodeIntoUint8Array003()[1]).assertEqual(4)
    })

    /**
     * @tc.name   testencodeIntoUint8Array004
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_UINT8ARRAY_4800
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testencodeIntoUint8Array004()[0]).assertEqual(4)
      expect(testencodeIntoUint8Array004()[1]).assertEqual(4)
    })

    /**
     * @tc.name   testencodeIntoUint8Array005
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_UINT8ARRAY_4810
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testencodeIntoUint8Array005()[0]).assertEqual(4)
      expect(testencodeIntoUint8Array005()[1]).assertEqual(4)
    })

    /**
     * @tc.name   testencodeIntoUint8Array006
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_UINT8ARRAY_4820
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testencodeIntoUint8Array006()[0]).assertEqual(0)
      expect(testencodeIntoUint8Array006()[1]).assertEqual(0)
    })

    /**
     * @tc.name   testencodeIntoUint8Array007
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_UINT8ARRAY_4830
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testencodeIntoUint8Array007()[0]).assertEqual(4)
      expect(testencodeIntoUint8Array007()[1]).assertEqual(4)
    })

    /**
     * @tc.name   testencodeIntoUint8Array008
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_UINT8ARRAY_4840
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testencodeIntoUint8Array008()[0]).assertEqual(0)
      expect(testencodeIntoUint8Array008()[1]).assertEqual(0)
    })

    /**
     * @tc.name   testEncoding_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODING_4850
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncoding_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncoding_001()).assertEqual('big5')
    })

    /**
     * @tc.name   testEncoding_002
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODING_4860
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncoding_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncoding_002()).assertEqual('iso-8859-2')
    })

    /**
     * @tc.name   testEncoding_003
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODING_4870
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncoding_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncoding_003()).assertEqual('euc-kr')
    })

    /**
     * @tc.name   testEncoding_004
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODING_4880
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncoding_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncoding_004()).assertEqual('ibm866')
    })

    /**
     * @tc.name   testEncoding_005
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODING_4890
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncoding_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncoding_005()).assertEqual('x-mac-cyrillic')
    })

    /**
     * @tc.name   testEncoding_create_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODING_CREATE_4900
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncoding_create_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncoding_create_001()).assertEqual('utf-8')
    })

    /**
     * @tc.name   testEncoding_create_002
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODING_CREATE_4910
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncoding_create_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncoding_create_002()).assertEqual('iso-8859-2')
    })

    /**
     * @tc.name   testEncoding_create_003
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODING_CREATE_4920
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncoding_create_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncoding_create_003()).assertEqual('euc-kr')
    })

    /**
     * @tc.name   testEncoding_create_004
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODING_CREATE_4930
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncoding_create_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncoding_create_004()).assertEqual('ibm866')
    })

    /**
     * @tc.name   testEncoding_create_005
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODING_CREATE_4940
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncoding_create_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncoding_create_005()).assertEqual('x-mac-cyrillic')
    })

    /**
     * @tc.name   testEncodeInto011
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_4950
     * @tc.desc   Returns the result of encoder for GB18030.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto011()[0]).assertEqual(97)
      expect(testEncodeInto011()[1]).assertEqual(171)
      expect(testEncodeInto011()[2]).assertEqual(162)
      expect(testEncodeInto011()[3]).assertEqual(230)
      expect(testEncodeInto011()[4]).assertEqual(102)
    })

    /**
     * @tc.name   testEncodeInto012
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_4960
     * @tc.desc   Returns the result of encoder for GB18030.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto012()[0]).assertEqual(97)
      expect(testEncodeInto012()[1]).assertEqual(153)
      expect(testEncodeInto012()[2]).assertEqual(251)
      expect(testEncodeInto012()[3]).assertEqual(252)
      expect(testEncodeInto012()[4]).assertEqual(252)
    })

    /**
     * @tc.name   testEncodeInto013
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_4970
     * @tc.desc   Returns the result of encoder for GB18030.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testEncodeInto013()[0]).assertEqual(97)
      expect(testEncodeInto013()[1]).assertEqual(27)
      expect(testEncodeInto013()[2]).assertEqual(36)
      expect(testEncodeInto013()[3]).assertEqual(125)
      expect(testEncodeInto013()[4]).assertEqual(82)
    })

    /**
     * @tc.name   testEncodeInto014
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_4980
     * @tc.desc   Returns the result of encoder for GB18030.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testEncodeInto014()[0]).assertEqual(97)
      expect(testEncodeInto014()[1]).assertEqual(127)
      expect(testEncodeInto014()[2]).assertEqual(127)
    })

    /**
     * @tc.name   testEncodeInto015
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_4990
     * @tc.desc   Returns the result of encoder for GB18030.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testEncodeInto015()[0]).assertEqual(97)
      expect(testEncodeInto015()[1]).assertEqual(63)
      expect(testEncodeInto015()[2]).assertEqual(63)
    })

    /**
     * @tc.name   testEncodeInto016
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5000
     * @tc.desc   Returns the result of encoder for GBK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testEncodeInto016()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto017
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5010
     * @tc.desc   Returns the result of encoder for GB2312.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testEncodeInto017()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto018
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5020
     * @tc.desc   Returns the result of encoder for iso-8859-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testEncodeInto018()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto019
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5030
     * @tc.desc   Returns the result of encoder for iso-8859-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto019()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto020
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5040
     * @tc.desc   Returns the result of encoder for iso-8859-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto020()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto021
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5050
     * @tc.desc   Returns the result of encoder for iso-8859-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto021()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto022
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5060
     * @tc.desc   Returns the result of encoder for iso-8859-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto022()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto023
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5070
     * @tc.desc   Returns the result of encoder for iso-8859-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto023()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto024
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5080
     * @tc.desc   Returns the result of encoder for iso-8859-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto024()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto025
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5090
     * @tc.desc   Returns the result of encoder for iso-8859-8-i.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testEncodeInto025()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto026
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5100
     * @tc.desc   Returns the result of encoder for iso-8859-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testEncodeInto026()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto027
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5110
     * @tc.desc   Returns the result of encoder for iso-8859-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testEncodeInto027()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto028
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5120
     * @tc.desc   Returns the result of encoder for iso-8859-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testEncodeInto028()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto029
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5130
     * @tc.desc   Returns the result of encoder for iso-8859-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto029()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto030
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5140
     * @tc.desc   Returns the result of encoder for koi8-r.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto030()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto031
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5150
     * @tc.desc   Returns the result of encoder for koi8-u.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto031()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto032
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5160
     * @tc.desc   Returns the result of encoder for windows-874.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto032()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto033
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5170
     * @tc.desc   Returns the result of encoder for windows-1250.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto033()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto034
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5180
     * @tc.desc   Returns the result of encoder for windows-1251.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto034()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto035
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5190
     * @tc.desc   Returns the result of encoder for windows-1252.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto035()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto036
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5200
     * @tc.desc   Returns the result of encoder for windows-1253.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto036()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto037
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5210
     * @tc.desc   Returns the result of encoder for windows-1254.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto037()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto038
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5220
     * @tc.desc   Returns the result of encoder for windows-1255.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto038()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto039
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5230
     * @tc.desc   Returns the result of encoder for windows-1256.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto039()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto040
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5240
     * @tc.desc   Returns the result of encoder for windows-1257.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto040()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto041
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5250
     * @tc.desc   Returns the result of encoder for windows-1258.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto041()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto042
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5260
     * @tc.desc   Returns the result of encoder for euc-jp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto042()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto043
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5270
     * @tc.desc   Returns the result of encoder for euc-kr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto043()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto044
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5280
     * @tc.desc   Returns the result of encoder for x-mac-cyrillic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto044()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto045
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5290
     * @tc.desc   Returns the result of encoder for utf-16be.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto045()).assertTrue()
    })

    /**
     * @tc.name   testEncodeInto046
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_5300
     * @tc.desc   Returns the result of encoder for utf-16le.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodeInto046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEncodeInto046()).assertTrue()
    })

    /**
     * @tc.name   testencodeIntoUint8Array009
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_UINT8ARRAY_5310
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testencodeIntoUint8Array009()[0]).assertEqual(8)
      expect(testencodeIntoUint8Array009()[1]).assertEqual(8)
    })

    /**
     * @tc.name   testencodeIntoUint8Array010
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_UINT8ARRAY_5320
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testencodeIntoUint8Array010()[0]).assertEqual(3)
      expect(testencodeIntoUint8Array010()[1]).assertEqual(5)
    })

    /**
     * @tc.name   testencodeIntoUint8Array011
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_UINT8ARRAY_5330
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testencodeIntoUint8Array011()[0]).assertEqual(4)
      expect(testencodeIntoUint8Array011()[1]).assertEqual(4)
    })

    /**
     * @tc.name   testencodeIntoUint8Array012
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_UINT8ARRAY_5340
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testencodeIntoUint8Array012()[0]).assertEqual(4)
      expect(testencodeIntoUint8Array012()[1]).assertEqual(4)
    })

    /**
     * @tc.name   testencodeIntoUint8Array013
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_INTO_UINT8ARRAY_5350
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testencodeIntoUint8Array013()[0]).assertEqual(8)
      expect(testencodeIntoUint8Array013()[1]).assertEqual(8)
    })


    /**
     * @tc.name   testWrite001
     * @tc.number testWrite001
     * @tc.desc   testWrite001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testWrite001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite001()).assertEqual('你好')
    });

    /**
     * @tc.name   testWrite002
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5370
     * @tc.desc   Returns a decoded string, ensuring that any incomplete multibyte characters at the end of the Uint8Array are
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testWrite002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite002()).assertEqual('abc')
    });

    /**
     * @tc.name   testWrite003
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5380
     * @tc.desc   Returns a decoded string, ensuring that any incomplete multibyte characters at the end of the Uint8Array are
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testWrite003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite003()).assertEqual('你好')
    });

    /**
     * @tc.name   testWrite004
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5390
     * @tc.desc   Returns a decoded string, ensuring that any incomplete multibyte characters at the end of the Uint8Array are
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testWrite004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite004()).assertEqual('abc')
    });

    /**
     * @tc.name   testWrite005
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5400
     * @tc.desc   Returns a decoded string, ensuring that any incomplete multibyte characters at the end of the Uint8Array are
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testWrite005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite005()).assertEqual('abc')
    });

    /**
     * @tc.name   testWrite006
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5410
     * @tc.desc   Returns a decoded string, ensuring that any incomplete multibyte characters at the end of the Uint8Array are
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testWrite006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite006()).assertEqual('abc')
    });

    /**
     * @tc.name   testEnd001
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5420
     * @tc.desc   Returns any remaining input stored in the internal buffer as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testEnd001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEnd001()).assertEqual('a')
    });

    /**
     * @tc.name   testEnd002
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5430
     * @tc.desc   Returns any remaining input stored in the internal buffer as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testEnd002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEnd002()).assertEqual('abc')
    });

    /**
     * @tc.name   testEnd003
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5440
     * @tc.desc   Returns any remaining input stored in the internal buffer as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testEnd003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEnd003()).assertEqual('你好')
    });

    /**
     * @tc.name   testEnd004
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5450
     * @tc.desc   Returns any remaining input stored in the internal buffer as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testEnd004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testEnd004()[0]).assertEqual('你')
      expect(testEnd004()[1]).assertEqual('好')
    });

    /**
     * @tc.name   testWrite007
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5460
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite007()[0]).assertEqual('你\u0000好')
      expect(testWrite007()[1]).assertEqual(3)
    })

    /**
     * @tc.name   testWrite008
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5470
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite008()[0]).assertEqual('\u0000你')
      expect(testWrite008()[1]).assertEqual('好')
    })

    /**
     * @tc.name   testWrite009
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5480
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite009()).assertEqual('abc熠熠')
    })

    /**
     * @tc.name   testWrite010
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5490
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite010()).assertEqual('abc熠熠')
    })

    /**
     * @tc.name   testWrite011
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5500
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite011()).assertEqual('こんにちは')
    })

    /**
     * @tc.name   testWrite012
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5510
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite012()).assertEqual('こんにちは')
    })

    /**
     * @tc.name   testWrite013
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5520
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite013()).assertEqual('Здравствуйте')
    })

    /**
     * @tc.name   testWrite014
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5530
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite014()).assertEqual('abc熠熠')
    })

    /**
     * @tc.name   testWrite015
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5540
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite015()).assertEqual('abc熠熠')
    })

    /**
     * @tc.name   testWrite016
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5550
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite016()).assertEqual('Szia')
    })

    /**
     * @tc.name   testWrite017
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5560
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite017()).assertEqual('Tavaliselt tere päeval')
    })

    /**
     * @tc.name   testWrite018
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5570
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite018()).assertEqual('Здравствуйте')
    })

    /**
     * @tc.name   testWrite019
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5580
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite019()).assertEqual('مرحبا')
    })

    /**
     * @tc.name   testWrite020
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5590
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite020()).assertEqual('Γεια σου')
    })

    /**
     * @tc.name   testWrite021
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5600
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite021()).assertEqual('שלום')
    })

    /**
     * @tc.name   testWrite022
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5610
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite022()).assertEqual('é£')
    })

    /**
     * @tc.name   testWrite023
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5620
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite023()).assertEqual('שלום')
    })

    /**
     * @tc.name   testWrite024
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5630
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite024()).assertEqual('Hei')
    })

    /**
     * @tc.name   testWrite025
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5640
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite025()).assertEqual('Sveiki')
    })

    /**
     * @tc.name   testWrite026
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5650
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite026()).assertEqual('Diolch')
    })

    /**
     * @tc.name   testWrite027
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5660
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite027()).assertEqual('Hola')
    })

    /**
     * @tc.name   testWrite028
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5670
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite028()).assertEqual('Привет, мир!')
    })

    /**
     * @tc.name   testWrite029
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5680
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite029()).assertEqual('Привіт, світ')
    })

    /**
     * @tc.name   testWrite030
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5690
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite030()).assertEqual('😃')
    })

    /**
     * @tc.name   testWrite031
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5700
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite031()).assertEqual('aé中😃')
    })

    /**
     * @tc.name   testWrite032
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5710
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite032()).assertEqual('😃')
    })

    /**
     * @tc.name   testWrite033
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5720
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite033()).assertEqual('😃🤞')
    })

    /**
     * @tc.name   testWrite034
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5730
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite034()).assertEqual('a😃🤞b')
    })

    /**
     * @tc.name   testWrite035
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5740
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite035()).assertEqual('สวัสดี')
    })


    /**
     * @tc.name   testWrite036
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5750
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite036()).assertEqual('Привет, мир')
    })

    /**
     * @tc.name   testWrite037
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5760
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite037()).assertEqual('Hi, World')
    })

    /**
     * @tc.name   testWrite038
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5770
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite038()).assertEqual('Γεια σας, κόσμο')
    })

    /**
     * @tc.name   testWrite039
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5780
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite039()).assertEqual('Merhaba, dünya')
    })

    /**
     * @tc.name   testWrite040
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5790
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite040()).assertEqual('שלום, עולם')
    })

    /**
     * @tc.name   testWrite041
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5800
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite041()).assertEqual('مرحبا, العالم')
    })

    /**
     * @tc.name   testWrite042
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5810
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite042()).assertEqual('Tere, maailma')
    })

    /**
     * @tc.name   testWrite043
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5820
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite043()).assertEqual('Chào')
    })

    /**
     * @tc.name   testWrite044
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5830
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite044()).assertEqual('こんにちは')
    })

    /**
     * @tc.name   testWrite045
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5840
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite045()).assertEqual('안녕, 세상')
    })

    /**
     * @tc.name   testWrite046
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5850
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite046()).assertEqual('안녕, 세상')
    })

    /**
     * @tc.name   testWrite047
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5860
     * @tc.desc   Returns a decoded string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrite047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testWrite047()).assertEqual('Привет, мир!')
    })

    /**
     * @tc.name   decodeTostring0029
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5870
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0029())
        .assertEqual('Parameter error. Please check if the decode data matches the encoding format.')
    })

    /**
     * @tc.name   decodeTostring0030
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5880
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0030()).assertEqual(1)
    })

    /**
     * @tc.name   decodeTostring0031
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5890
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0031())
        .assertEqual('Parameter error. Please check if the decode data matches the encoding format.')
    })

    /**
     * @tc.name   decodeTostring0032
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5900
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0032()).assertEqual(1)
    })

    /**
     * @tc.name   decodeTostring0033
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5910
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0033())
        .assertEqual('Parameter error. Please check if the decode data matches the encoding format.')
    })

    /**
     * @tc.name   decodeTostring0034
     * @tc.number SUB_COMMONLIBRARY_FP_ETSUTILS_UTIL_5920
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('decodeTostring0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(decodeTostring0034()).assertEqual(1)
    })
  })
}
