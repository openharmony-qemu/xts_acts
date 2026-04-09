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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  searchStringEqualsRegExpSymbolSearch,
  searchCustomSymbolSearchObject,
  searchBigIntCoerces,
  searchSymbolParameterThrows,
  searchFunctionCoerces,
  searchObjectWithSymbolToPrimitive,
  regexpSearchCallUndefinedThrows,
  regexpSearchCallNullThrows,
  regexpSearchRegexLikeIndex
} from './RegExpHelper';

export default function searchExtrasTest() {

    describe('SearchExtras_Tests', () => {
      /**
       * @tc.name testSearchTest0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0100
       * @tc.desc   uses RegExp[Symbol.search] semantics
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(searchStringEqualsRegExpSymbolSearch()).assertTrue();
      });

      /**
       * @tc.name testSearchTest0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0101
       * @tc.desc   supports custom objects via Symbol.search
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(searchCustomSymbolSearchObject()).assertTrue();
      });

      /**
       * @tc.name testSearchTest0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0102
       * @tc.desc   coerces BigInt to string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(searchBigIntCoerces()).assertTrue();
      });

      /**
       * @tc.name testSearchTest0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0103
       * @tc.desc   throws TypeError for Symbol pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(searchSymbolParameterThrows()).assertTrue();
      });

      /**
       * @tc.name testSearchTest0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0104
       * @tc.desc   coerces function to string pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(searchFunctionCoerces()).assertTrue();
      });

      /**
       * @tc.name testSearchTest0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0105
       * @tc.desc   uses @@toPrimitive when available
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(searchObjectWithSymbolToPrimitive()).assertTrue();
      });

      /**
       * @tc.name testSearchTest0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0106
       * @tc.desc   throws when calling RegExp[Symbol.search] with undefined receiver
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpSearchCallUndefinedThrows()).assertTrue();
      });

      /**
       * @tc.name testSearchTest0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0107
       * @tc.desc   throws when calling RegExp[Symbol.search] with null receiver
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpSearchCallNullThrows()).assertTrue();
      });

      /**
       * @tc.name testSearchTest0108
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0108
       * @tc.desc   supports regex-like objects via RegExp[Symbol.search]
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpSearchRegexLikeIndex()).assertTrue();
      });
    });

}
