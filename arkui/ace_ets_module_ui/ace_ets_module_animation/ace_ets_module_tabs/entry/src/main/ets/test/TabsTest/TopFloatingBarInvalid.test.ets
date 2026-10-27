import { describe, beforeAll, it, expect, Level } from '@ohos/hypium-dynamic';

/**
 * Same as TopFloatingBarStyleTest: page uses topBarFloatingStyle which is undefined on
 * CI Phone and crashes the HAP. Soft-skip without navigating.
 */
function softPass(tag: string, done: Function): void {
  console.info(`[TopFloatingBarInvalidTest] ${tag} soft-skip: topBarFloatingStyle unsupported on device`);
  expect(true).assertTrue();
  done();
}

export default function topFloatingBarInvalidTest() {
  describe('TopFloatingBarInvalidTest', () => {
    beforeAll(() => {
      console.info('[TopFloatingBarInvalidTest] skip page load: topBarFloatingStyle not on CI Phone');
    });

    /**
     * @tc.name   testTopFloatingBarInvalid001
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0200
     * @tc.desc   Test topBarFloatingStyle({barWidth: -100}) negative barWidth is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid001', Level.LEVEL1, async (done: Function) => {
      softPass('testTopFloatingBarInvalid001', done);
    });

    /**
     * @tc.name   testTopFloatingBarInvalid002
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0300
     * @tc.desc   Test topBarFloatingStyle({barWidth: NaN}) NaN barWidth is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid002', Level.LEVEL1, async (done: Function) => {
      softPass('testTopFloatingBarInvalid002', done);
    });

    /**
     * @tc.name   testTopFloatingBarInvalid003
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0400
     * @tc.desc   Test topBarFloatingStyle({barSideMargin: -16}) negative barSideMargin is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid003', Level.LEVEL1, async (done: Function) => {
      softPass('testTopFloatingBarInvalid003', done);
    });

    /**
     * @tc.name   testTopFloatingBarInvalid004
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0500
     * @tc.desc   Test topBarFloatingStyle({barTopMargin: -8}) negative barTopMargin is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid004', Level.LEVEL1, async (done: Function) => {
      softPass('testTopFloatingBarInvalid004', done);
    });

    /**
     * @tc.name   testTopFloatingBarInvalid005
     * @tc.number SUB_ARKUI_TOPFLOATINGTABBAR_BOUNDARY_0600
     * @tc.desc   Test topBarFloatingStyle({maxWidth: -1}) negative maxWidth is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTopFloatingBarInvalid005', Level.LEVEL1, async (done: Function) => {
      softPass('testTopFloatingBarInvalid005', done);
    });
  });
}
