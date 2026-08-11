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

import { describe, beforeAll, beforeEach, afterEach, afterAll } from '../../../hypium/index';
import Utils from './Util.test';
import abilityTest from './Ability.test.ets';
import int32ArrayLastIndexOfPart01TestMindmapTestTest from './Int32Array/Int32ArrayLastIndexOfPart01Test.test.ets';
import int32ArrayLastIndexOfPart02TestMindmapTestTest from './Int32Array/Int32ArrayLastIndexOfPart02Test.test.ets';
import int32ArrayLastIndexOfPart03TestMindmapTestTest from './Int32Array/Int32ArrayLastIndexOfPart03Test.test.ets';
import int32ArrayLastIndexOfPart04TestMindmapTestTest from './Int32Array/Int32ArrayLastIndexOfPart04Test.test.ets';
import int32ArrayMapPart01Test from './Int32Array/Int32ArrayMapPart01Test.test.ets';
import int32ArrayMapPart02Test from './Int32Array/Int32ArrayMapPart02Test.test.ets';
import int32ArrayMapPart03TestMindmapTestTest from './Int32Array/Int32ArrayMapPart03Test.test.ets';
import int32ArrayMapPart04Test from './Int32Array/Int32ArrayMapPart04Test.test.ets';
import int32ArrayOfPart01Test from './Int32Array/Int32ArrayOfPart01Test.test.ets';
import int32ArrayOfPart02Test from './Int32Array/Int32ArrayOfPart02Test.test.ets';
import int32ArrayOfPart03Test from './Int32Array/Int32ArrayOfPart03Test.test.ets';
import int32ArrayOfPart04Test from './Int32Array/Int32ArrayOfPart04Test.test.ets';
import int32ArrayOverviewPart01Test from './Int32Array/Int32ArrayOverviewPart01Test.test.ets';
import int32ArrayOverviewPart02Test from './Int32Array/Int32ArrayOverviewPart02Test.test.ets';
import int32ArrayOverviewPart03TestMindmapTestTest from './Int32Array/Int32ArrayOverviewPart03Test.test.ets';
import int32ArrayOverviewPart04Test from './Int32Array/Int32ArrayOverviewPart04Test.test.ets';
import int32ArrayOverviewPart05Test from './Int32Array/Int32ArrayOverviewPart05Test.test.ets';
import int32ArrayOverviewPart06Test from './Int32Array/Int32ArrayOverviewPart06Test.test.ets';
import int32ArrayOverviewPart07Test from './Int32Array/Int32ArrayOverviewPart07Test.test.ets';
import int32ArrayOverviewPart08Test from './Int32Array/Int32ArrayOverviewPart08Test.test.ets';
import int32ArrayPropertiesPart01Test from './Int32Array/Int32ArrayPropertiesPart01Test.test.ets';
import int32ArrayPropertiesPart02Test from './Int32Array/Int32ArrayPropertiesPart02Test.test.ets';
import int32ArrayPropertiesPart03Test from './Int32Array/Int32ArrayPropertiesPart03Test.test.ets';
import int32ArrayPropertiesPart04Test from './Int32Array/Int32ArrayPropertiesPart04Test.test.ets';
import int32ArrayPropertiesPart05Test from './Int32Array/Int32ArrayPropertiesPart05Test.test.ets';
import Int32ArrayReducePart01Test from './Int32Array/Int32ArrayReducePart01Test.test.ets';
import Int32ArrayReducePart02Test from './Int32Array/Int32ArrayReducePart02Test.test.ets';
import Int32ArrayReducePart03Test from './Int32Array/Int32ArrayReducePart03Test.test.ets';
import Int32ArrayReducePart04Test from './Int32Array/Int32ArrayReducePart04Test.test.ets';
import Int32ArrayReducePart05Test from './Int32Array/Int32ArrayReducePart05Test.test.ets';
import int32ArrayReduceRightPart01TestMindmapTestTest from './Int32Array/Int32ArrayReduceRightPart01Test.test.ets';
import int32ArrayReduceRightPart02Test from './Int32Array/Int32ArrayReduceRightPart02Test.test.ets';
import int32ArrayReduceRightPart03Test from './Int32Array/Int32ArrayReduceRightPart03Test.test.ets';
import int32ArrayReduceRightPart04Test from './Int32Array/Int32ArrayReduceRightPart04Test.test.ets';
import int32ArrayReduceRightPart05Test from './Int32Array/Int32ArrayReduceRightPart05Test.test.ets';
import int32ArrayReversePart01Test from './Int32Array/Int32ArrayReversePart01Test.test.ets';
import int32ArrayReversePart02Test from './Int32Array/Int32ArrayReversePart02Test.test.ets';
import int32ArrayReversePart03Test from './Int32Array/Int32ArrayReversePart03Test.test.ets';
import int32ArrayReversePart04Test from './Int32Array/Int32ArrayReversePart04Test.test.ets';
import int32ArraySubarrayPart01TestMindmapTest from './Int32Array/Int32ArraySubarrayPart01Test.test.ets';
import int32ArraySubarrayPart02Test from './Int32Array/Int32ArraySubarrayPart02Test.test.ets';
import int32ArraySubarrayPart03Test from './Int32Array/Int32ArraySubarrayPart03Test.test.ets';
import int32ArraySubarrayPart04TestMindmapTestTest from './Int32Array/Int32ArraySubarrayPart04Test.test.ets';
import int32ArraySubarrayPart05TestMindmapTestTest from './Int32Array/Int32ArraySubarrayPart05Test.test.ets';
import int32ArrayToLocaleStringPart01Test from './Int32Array/Int32ArrayToLocaleStringPart01Test.test.ets';
import int32ArrayToLocaleStringPart02Test from './Int32Array/Int32ArrayToLocaleStringPart02Test.test.ets';
import int32ArrayToLocaleStringPart03Test from './Int32Array/Int32ArrayToLocaleStringPart03Test.test.ets';
import int32ArrayToLocaleStringPart04Test from './Int32Array/Int32ArrayToLocaleStringPart04Test.test.ets';
import int32ArrayToReversedPart01Test from './Int32Array/Int32ArrayToReversedPart01Test.test.ets';
import int32ArrayToReversedPart02Test from './Int32Array/Int32ArrayToReversedPart02Test.test.ets';
import int32ArrayToReversedPart03Test from './Int32Array/Int32ArrayToReversedPart03Test.test.ets';
import int32ArrayToSortedPart01TestMindmapTestTest from './Int32Array/Int32ArrayToSortedPart01Test.test.ets';
import int32ArrayToSortedPart02Test from './Int32Array/Int32ArrayToSortedPart02Test.test.ets';
import int32ArrayToSortedPart03Test from './Int32Array/Int32ArrayToSortedPart03Test.test.ets';
import int32ArrayToStringPart01TestMindmapTestTest from './Int32Array/Int32ArrayToStringPart01Test.test.ets';
import int32ArrayToStringPart02Test from './Int32Array/Int32ArrayToStringPart02Test.test.ets';
import int32ArrayToStringPart03Test from './Int32Array/Int32ArrayToStringPart03Test.test.ets';
import int32ArrayValueOfPart01TestMindmapTest from './Int32Array/Int32ArrayValueOfPart01Test.test.ets';
import int32ArrayValueOfPart02Test from './Int32Array/Int32ArrayValueOfPart02Test.test.ets';
import int32ArrayValuesPart01Test from './Int32Array/Int32ArrayValuesPart01Test.test.ets';
import int32ArrayValuesPart02Test from './Int32Array/Int32ArrayValuesPart02Test.test.ets';
import int32ArrayWithPart01Test from './Int32Array/Int32ArrayWithPart01Test.test.ets';
import int32ArrayWithPart02Test from './Int32Array/Int32ArrayWithPart02Test.test.ets';

export default function testsuite(): void {
  describe('testsuite', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });
  });

  abilityTest();
  int32ArrayLastIndexOfPart01TestMindmapTestTest();
  int32ArrayLastIndexOfPart02TestMindmapTestTest();
  int32ArrayLastIndexOfPart03TestMindmapTestTest();
  int32ArrayLastIndexOfPart04TestMindmapTestTest();
  int32ArrayMapPart01Test();
  int32ArrayMapPart02Test();
  int32ArrayMapPart03TestMindmapTestTest();
  int32ArrayMapPart04Test();
  int32ArrayOfPart01Test();
  int32ArrayOfPart02Test();
  int32ArrayOfPart03Test();
  int32ArrayOfPart04Test();
  int32ArrayOverviewPart01Test();
  int32ArrayOverviewPart02Test();
  int32ArrayOverviewPart03TestMindmapTestTest();
  int32ArrayOverviewPart04Test();
  int32ArrayOverviewPart05Test();
  int32ArrayOverviewPart06Test();
  int32ArrayOverviewPart07Test();
  int32ArrayOverviewPart08Test();
  int32ArrayPropertiesPart01Test();
  int32ArrayPropertiesPart02Test();
  int32ArrayPropertiesPart03Test();
  int32ArrayPropertiesPart04Test();
  int32ArrayPropertiesPart05Test();
  Int32ArrayReducePart01Test();
  Int32ArrayReducePart02Test();
  Int32ArrayReducePart03Test();
  Int32ArrayReducePart04Test();
  Int32ArrayReducePart05Test();
  int32ArrayReduceRightPart01TestMindmapTestTest();
  int32ArrayReduceRightPart02Test();
  int32ArrayReduceRightPart03Test();
  int32ArrayReduceRightPart04Test();
  int32ArrayReduceRightPart05Test();
  int32ArrayReversePart01Test();
  int32ArrayReversePart02Test();
  int32ArrayReversePart03Test();
  int32ArrayReversePart04Test();
  int32ArraySubarrayPart01TestMindmapTest();
  int32ArraySubarrayPart02Test();
  int32ArraySubarrayPart03Test();
  int32ArraySubarrayPart04TestMindmapTestTest();
  int32ArraySubarrayPart05TestMindmapTestTest();
  int32ArrayToLocaleStringPart01Test();
  int32ArrayToLocaleStringPart02Test();
  int32ArrayToLocaleStringPart03Test();
  int32ArrayToLocaleStringPart04Test();
  int32ArrayToReversedPart01Test();
  int32ArrayToReversedPart02Test();
  int32ArrayToReversedPart03Test();
  int32ArrayToSortedPart01TestMindmapTestTest();
  int32ArrayToSortedPart02Test();
  int32ArrayToSortedPart03Test();
  int32ArrayToStringPart01TestMindmapTestTest();
  int32ArrayToStringPart02Test();
  int32ArrayToStringPart03Test();
  int32ArrayValueOfPart01TestMindmapTest();
  int32ArrayValueOfPart02Test();
  int32ArrayValuesPart01Test();
  int32ArrayValuesPart02Test();
  int32ArrayWithPart01Test();
  int32ArrayWithPart02Test();
}
