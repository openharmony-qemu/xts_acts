'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { beforeAll, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';

export default function WebScrollbarLayoutPolicyTest(): void {
  describe('WebScrollbarLayoutPolicyTest', () => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(1000);
    });

    /**
     * @tc.name   testScrollbarLayoutPolicy001
     * @tc.number SUB_WEB_SCROLLLAYOUT_POLICY_0100
     * @tc.desc   scrollbarLayoutPolicy CONTENT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollbarLayoutPolicy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitScrollbarLayoutPolicy001', 10)
      await Utils.msSleep(1000);
      Utils.registerEvent('testScrollbarLayoutPolicy001', true, 184010, done);
      inspector.sendEventByKey('ScrollbarLayoutPolicyButton', 10, '');
      await Utils.msSleep(1500);
      done();
    })

    /**
     * @tc.name   testScrollbarLayoutPolicy002
     * @tc.number SUB_WEB_SCROLLLAYOUT_POLICY_0200
     * @tc.desc   scrollbarLayoutPolicy SYSTEM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollbarLayoutPolicy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitScrollbarLayoutPolicy002', 10)
      await Utils.msSleep(1000);
      Utils.registerEvent('testScrollbarLayoutPolicy002', true, 184020, done);
      inspector.sendEventByKey('ScrollbarLayoutPolicyButton', 10, '');
      await Utils.msSleep(1500);
      done();
    })
  })
}
