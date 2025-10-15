import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { finalResult77 } from './promisejs';
import { emptyObj, result13, testObj32, testObj32init, user12 } from './promisets';
import {
  PromiseWithResolversTest001,
  PromiseWithResolversTest002,
  PromiseWithResolversTest003,
  PromiseWithResolversTest004,
  PromiseWithResolversTest005,
  PromiseWithResolversTest006,
  PromiseWithResolversTest007,
  PromiseWithResolversTest008,
  PromiseWithResolversTest009,
  PromiseWithResolversTest010,
  PromiseWithResolversTest011,
  PromiseWithResolversTest012,
  PromiseWithResolversTest013,
  PromiseWithResolversTest014,
  PromiseWithResolversTest015,
  PromiseWithResolversTest016,
  PromiseWithResolversTest017,
  PromiseWithResolversTest018,
  PromiseWithResolversTest019,
  PromiseWithResolversTest020,
  PromiseWithResolversTest021,
  PromiseWithResolversTest022,
  PromiseWithResolversTest023,
  PromiseWithResolversTest024,
  PromiseWithResolversTest025,
  PromiseWithResolversTest026,
  PromiseWithResolversTest027,
  PromiseWithResolversTest028,
  PromiseWithResolversTest029,
  PromiseWithResolversTest030,
  PromiseWithResolversTest031,
  PromiseWithResolversTest032,
  PromiseWithResolversTest033,
  PromiseWithResolversTest034,
  PromiseWithResolversTest035,
  PromiseWithResolversTest036,
  PromiseWithResolversTest037,
  PromiseWithResolversTest038,
  PromiseWithResolversTest039,
  PromiseWithResolversTest040,
  PromiseWithResolversTest041,
  PromiseWithResolversTest042,
  PromiseWithResolversTest043,
  PromiseWithResolversTest044,
  PromiseWithResolversTest045,
  PromiseWithResolversTest046,
  PromiseWithResolversTest047,
  PromiseWithResolversTest048,
  PromiseWithResolversTest049,
  PromiseWithResolversTest050,
  PromiseWithResolversTest051,
  PromiseWithResolversTest052,
  PromiseWithResolversTest053,
  PromiseWithResolversTest054,
  PromiseWithResolversTest055,
  PromiseWithResolversTest056,
  PromiseWithResolversTest057,
  PromiseWithResolversTest058,
  PromiseWithResolversTest059,
  PromiseWithResolversTest060,
  PromiseWithResolversTest061,
  PromiseWithResolversTest062,
  PromiseWithResolversTest063,
  PromiseWithResolversTest064,
  PromiseWithResolversTest065,
  PromiseWithResolversTest066,
  PromiseWithResolversTest067,
  PromiseWithResolversTest068,
  PromiseWithResolversTest069,
  PromiseWithResolversTest070
} from './promiseWithResolversJs';
import {
  PromiseWithResolversTest071,
  PromiseWithResolversTest072,
  PromiseWithResolversTest073,
  PromiseWithResolversTest074,
  PromiseWithResolversTest075,
  PromiseWithResolversTest076,
  PromiseWithResolversTest077,
  PromiseWithResolversTest078,
  PromiseWithResolversTest079,
  PromiseWithResolversTest080,
  PromiseWithResolversTest081,
  PromiseWithResolversTest082,
  PromiseWithResolversTest083,
  PromiseWithResolversTest084,
  PromiseWithResolversTest085,
  PromiseWithResolversTest086,
  PromiseWithResolversTest087,
  PromiseWithResolversTest088,
  PromiseWithResolversTest089,
  PromiseWithResolversTest090,
  PromiseWithResolversTest091,
  PromiseWithResolversTest092,
  PromiseWithResolversTest093,
  PromiseWithResolversTest094,
  PromiseWithResolversTest095,
  PromiseWithResolversTest096,
  PromiseWithResolversTest097,
  PromiseWithResolversTest098,
  PromiseWithResolversTest099,
  PromiseWithResolversTest100
} from './promiseWithResolversJs2';
import { sleep } from './utils';

export default function promiseWithResolversTest() {
  describe('promiseWithResolversTest', () => {
    afterEach(async () => {
      await sleep(10)
    })
    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0001
     * @tc.name PromiseWithResolversTest001
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest001();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0002
     * @tc.name PromiseWithResolversTest002
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest002();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0003
     * @tc.name PromiseWithResolversTest003
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest003();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0004
     * @tc.name PromiseWithResolversTest004
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest004();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0005
     * @tc.name PromiseWithResolversTest005
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest005();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0006
     * @tc.name PromiseWithResolversTest006
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest006();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0007
     * @tc.name PromiseWithResolversTest007
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest007();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0008
     * @tc.name PromiseWithResolversTest008
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest008();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0009
     * @tc.name PromiseWithResolversTest009
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest009();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0010
     * @tc.name PromiseWithResolversTest010
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest010();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0011
     * @tc.name PromiseWithResolversTest011
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest011();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0012
     * @tc.name PromiseWithResolversTest012
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest012();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0013
     * @tc.name PromiseWithResolversTest013
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest013();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0014
     * @tc.name PromiseWithResolversTest014
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest014();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0015
     * @tc.name PromiseWithResolversTest015
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest015();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0016
     * @tc.name PromiseWithResolversTest016
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest016();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0017
     * @tc.name PromiseWithResolversTest017
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest017();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0018
     * @tc.name PromiseWithResolversTest018
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest018();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0019
     * @tc.name PromiseWithResolversTest019
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest019();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0020
     * @tc.name PromiseWithResolversTest020
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest020();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0021
     * @tc.name PromiseWithResolversTest021
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest021();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0022
     * @tc.name PromiseWithResolversTest022
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest022();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0023
     * @tc.name PromiseWithResolversTest023
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest023();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0024
     * @tc.name PromiseWithResolversTest024
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest024();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0025
     * @tc.name PromiseWithResolversTest025
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest025();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0026
     * @tc.name PromiseWithResolversTest026
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest026();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0027
     * @tc.name PromiseWithResolversTest027
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest027();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0028
     * @tc.name PromiseWithResolversTest028
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest028();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0029
     * @tc.name PromiseWithResolversTest029
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest029();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0030
     * @tc.name PromiseWithResolversTest030
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest030();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0031
     * @tc.name PromiseWithResolversTest031
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest031();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0032
     * @tc.name PromiseWithResolversTest032
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest032();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0033
     * @tc.name PromiseWithResolversTest033
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest033();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0034
     * @tc.name PromiseWithResolversTest034
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest034();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0035
     * @tc.name PromiseWithResolversTest035
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest035();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0036
     * @tc.name PromiseWithResolversTest036
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest036();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0037
     * @tc.name PromiseWithResolversTest037
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest037();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0038
     * @tc.name PromiseWithResolversTest038
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest038();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0039
     * @tc.name PromiseWithResolversTest039
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest039();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0040
     * @tc.name PromiseWithResolversTest040
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest040();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0041
     * @tc.name PromiseWithResolversTest041
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest041();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0042
     * @tc.name PromiseWithResolversTest042
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest042();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0043
     * @tc.name PromiseWithResolversTest043
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest043();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0044
     * @tc.name PromiseWithResolversTest044
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest044();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0045
     * @tc.name PromiseWithResolversTest045
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest045();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0046
     * @tc.name PromiseWithResolversTest046
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest046();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0047
     * @tc.name PromiseWithResolversTest047
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest047();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0048
     * @tc.name PromiseWithResolversTest048
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest048();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0049
     * @tc.name PromiseWithResolversTest049
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest049();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0050
     * @tc.name PromiseWithResolversTest050
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest050();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0051
     * @tc.name PromiseWithResolversTest051
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest051();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0052
     * @tc.name PromiseWithResolversTest052
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest052();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0053
     * @tc.name PromiseWithResolversTest053
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest053();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0054
     * @tc.name PromiseWithResolversTest054
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest054();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0055
     * @tc.name PromiseWithResolversTest055
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest055();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0056
     * @tc.name PromiseWithResolversTest056
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest056();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0057
     * @tc.name PromiseWithResolversTest057
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest057();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0058
     * @tc.name PromiseWithResolversTest058
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest058();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0059
     * @tc.name PromiseWithResolversTest059
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest059();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0060
     * @tc.name PromiseWithResolversTest060
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest060();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0061
     * @tc.name PromiseWithResolversTest061
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest061();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0062
     * @tc.name PromiseWithResolversTest062
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest062();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0063
     * @tc.name PromiseWithResolversTest063
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest063();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0064
     * @tc.name PromiseWithResolversTest064
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest064();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0065
     * @tc.name PromiseWithResolversTest065
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest065();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0066
     * @tc.name PromiseWithResolversTest066
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest066();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0067
     * @tc.name PromiseWithResolversTest067
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest067();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0068
     * @tc.name PromiseWithResolversTest068
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest068();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0069
     * @tc.name PromiseWithResolversTest069
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest069();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0070
     * @tc.name PromiseWithResolversTest070
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest070();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0071
     * @tc.name PromiseWithResolversTest071
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest071();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0072
     * @tc.name PromiseWithResolversTest072
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest072();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0073
     * @tc.name PromiseWithResolversTest073
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest073() as boolean;
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0074
     * @tc.name PromiseWithResolversTest074
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest074();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0075
     * @tc.name PromiseWithResolversTest075
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest075();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0076
     * @tc.name PromiseWithResolversTest076
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest076();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0077
     * @tc.name PromiseWithResolversTest077
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest077();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0078
     * @tc.name PromiseWithResolversTest078
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest078();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0079
     * @tc.name PromiseWithResolversTest079
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest079();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0080
     * @tc.name PromiseWithResolversTest080
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest080();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0081
     * @tc.name PromiseWithResolversTest081
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest081();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0082
     * @tc.name PromiseWithResolversTest082
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest082();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0083
     * @tc.name PromiseWithResolversTest083
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest083();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0084
     * @tc.name PromiseWithResolversTest084
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest084();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0085
     * @tc.name PromiseWithResolversTest085
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest085();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0086
     * @tc.name PromiseWithResolversTest086
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest086();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0087
     * @tc.name PromiseWithResolversTest087
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest087();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0088
     * @tc.name PromiseWithResolversTest088
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest088();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0089
     * @tc.name PromiseWithResolversTest089
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest089();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0090
     * @tc.name PromiseWithResolversTest090
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest090();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0091
     * @tc.name PromiseWithResolversTest091
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest091();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0092
     * @tc.name PromiseWithResolversTest092
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest092();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0093
     * @tc.name PromiseWithResolversTest093
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest093();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0094
     * @tc.name PromiseWithResolversTest094
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest094();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0095
     * @tc.name PromiseWithResolversTest095
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest095();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0096
     * @tc.name PromiseWithResolversTest096
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest096();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0097
     * @tc.name PromiseWithResolversTest097
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest097();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0098
     * @tc.name PromiseWithResolversTest098
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest098();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0099
     * @tc.name PromiseWithResolversTest099
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest099();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_WithResolvers_TEST_0100
     * @tc.name PromiseWithResolversTest100
     * @tc.desc test Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseWithResolversTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseWithResolversTest100();
      expect(result).assertEqual(true);
    });
  })
}