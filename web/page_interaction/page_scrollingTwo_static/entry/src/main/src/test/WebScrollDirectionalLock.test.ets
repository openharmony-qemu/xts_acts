/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { beforeAll, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';

export default function WebScrollDirectionalLockTest(): void {
  describe('WebScrollDirectionalLockTest', () => {
    beforeAll(async (): Promise<void> => {
      Utils.emitEvent('emitSwitchToWebScrollDirectionalLockPage', 10);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('ScrollbarLayoutPolicyButton', 10, '');
      await Utils.msSleep(2000);
    });

    /**
     * @tc.name   testScrollDirectionalLock001
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLESCROLLDIRECTIONALLOCK_PARAM_0100
     * @tc.desc   enableScrollDirectionalLock enable true with ScrollDirectionalLockType.ALL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollDirectionalLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitScrollDirectionalLock001', 10)
      await Utils.msSleep(1000);
      Utils.registerEvent('testScrollDirectionalLock001', true, 185010, done);
      inspector.sendEventByKey('WebScrollDirectionalLockButton', 10, '');
      const sleepResult = await Utils.msSleep(1500);
      expect(sleepResult).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testScrollDirectionalLock002
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLESCROLLDIRECTIONALLOCK_PARAM_0200
     * @tc.desc   enableScrollDirectionalLock enable true with ScrollDirectionalLockType.NESTED_SCROLL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollDirectionalLock002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitScrollDirectionalLock002', 10)
      await Utils.msSleep(1000);
      Utils.registerEvent('testScrollDirectionalLock002', true, 185020, done);
      inspector.sendEventByKey('WebScrollDirectionalLockButton', 10, '');
      const sleepResult = await Utils.msSleep(1500);
      expect(sleepResult).assertEqual(0);
      done();
    })
  })
}
