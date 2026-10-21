'use static'
/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { beforeAll, describe, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';

export default function WebFlingSpeedLimitTest(): void {
  describe('WebFlingSpeedLimitTest', () => {
    beforeAll(async (): Promise<void> => {
      Utils.emitEvent('emitSwitchToWebFlingSpeedLimitPage', 10);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('WebScrollDirectionalLockButton', 10, '');
      await Utils.msSleep(2000);
    });

    /**
     * @tc.name   testFlingSpeedLimit001
     * @tc.number SUB_WEB_WEBATTRIBUTE_FLINGSPEEDLIMIT_0100
     * @tc.desc   flingSpeedLimit 9000 vp/s
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlingSpeedLimit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitFlingSpeedLimit001', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFlingSpeedLimit001', true, 186010, () => {
          expect('emitFlingSpeedLimit001').assertContain('FlingSpeedLimit');
          done();
        });
        inspector.sendEventByKey('FlingSpeedLimitButton', 10, '');
        await Utils.msSleep(1500);
      })

    /**
     * @tc.name   testFlingSpeedLimit002
     * @tc.number SUB_WEB_WEBATTRIBUTE_FLINGSPEEDLIMIT_0200
     * @tc.desc   flingSpeedLimit 17000 vp/s
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlingSpeedLimit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitFlingSpeedLimit002', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFlingSpeedLimit002', true, 186020, () => {
          expect('emitFlingSpeedLimit002').assertContain('FlingSpeedLimit');
          done();
        });
        inspector.sendEventByKey('FlingSpeedLimitButton', 10, '');
        await Utils.msSleep(1500);
      })

    /**
     * @tc.name   testFlingSpeedLimit003
     * @tc.number SUB_WEB_WEBATTRIBUTE_FLINGSPEEDLIMIT_0300
     * @tc.desc   flingSpeedLimit 0 uses default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlingSpeedLimit003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitFlingSpeedLimit003', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFlingSpeedLimit003', true, 186030, () => {
          expect('emitFlingSpeedLimit003').assertContain('FlingSpeedLimit');
          done();
        });
        inspector.sendEventByKey('FlingSpeedLimitButton', 10, '');
        await Utils.msSleep(1500);
      })

    /**
     * @tc.name   testFlingSpeedLimit004
     * @tc.number SUB_WEB_WEBATTRIBUTE_FLINGSPEEDLIMIT_0400
     * @tc.desc   flingSpeedLimit negative uses default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlingSpeedLimit004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitFlingSpeedLimit004', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFlingSpeedLimit004', true, 186040, () => {
          expect('emitFlingSpeedLimit004').assertContain('FlingSpeedLimit');
          done();
        });
        inspector.sendEventByKey('FlingSpeedLimitButton', 10, '');
        await Utils.msSleep(1500);
      })

    /**
     * @tc.name   testFlingSpeedLimit005
     * @tc.number SUB_WEB_WEBATTRIBUTE_FLINGSPEEDLIMIT_0500
     * @tc.desc   flingSpeedLimit switch 9000 then 17000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlingSpeedLimit005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitFlingSpeedLimit005', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFlingSpeedLimit005', true, 186050, () => {
          expect('emitFlingSpeedLimit005').assertContain('FlingSpeedLimit');
          done();
        });
        inspector.sendEventByKey('FlingSpeedLimitButton', 10, '');
        await Utils.msSleep(1500);
      })
  })
}
