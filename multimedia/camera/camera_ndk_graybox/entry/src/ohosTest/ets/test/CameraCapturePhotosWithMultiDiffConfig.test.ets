import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function CameraCapturePhotosWithMultiDiffConfig() {
	describe('CameraCapturePhotosWithMultiDiffConfig', () => {
		// Defines a test suite. Two parameters are supported: test suite name and test suite function.
		beforeAll(() => {
		// Presets an action, which is performed only once before all test cases of the test suite start.
		// This API supports only one parameter: preset action function.
		})
		beforeEach(() => {
		// Presets an action, which is performed before each unit test case starts.
		// The number of execution times is the same as the number of test cases defined by **it**.
		// This API supports only one parameter: preset action function.
		})
		afterEach(async () => {
		// Presets a clear action, which is performed after e ach unit test case ends.
		// The number of execution times is the same as the number of test cases defined by **it**.
		// This API supports only one parameter: clear action function.
		})
		afterAll(() => {
		// Presets a clear action, which is performed after all test cases of the test suite end.
		// This API supports only one parameter: clear action function.
		})

		/**
		 * @tc.number    SUB_CAMERA_CPATUREDYNAMICPHOTO_TESTMULTICONFIG_000
		 * @tc.name      SUB_CAMERA_CPATUREDYNAMICPHOTO_TESTMULTICONFIG_000
		 * @tc.desc      camera capture 1 dynamic photo with multi Different config
		 * @tc.size      MEDIUM
		 * @tc.type      Function
		 * @tc.level     Level 0
		 */
		it('SUB_CAMERA_CPATUREDYNAMICPHOTO_TESTMULTICONFIG_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
			let a = 'abc';
			let b = 'b';
			// Defines a variety of assertion methods, which are used to declare expected boolean conditions.
			expect(a).assertContain(b);
			expect(a).assertEqual(a);
			done();
		})
	})
}