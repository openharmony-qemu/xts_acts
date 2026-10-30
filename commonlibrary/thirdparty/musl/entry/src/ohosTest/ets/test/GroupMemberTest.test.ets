/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, TestType, Size, Level } from "@ohos/hypium-dynamic"
import Utils from './Utils'
import group_member_test from 'libgroup_member_test.so';

export default function groupMemberTest() {
  describe('ActsGroupMemberTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslGroupMember0100
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0100
     * @tc.desc   test SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupMember0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = group_member_test.GroupMember_0100();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslGroupMember0200
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0200
     * @tc.desc   test SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupMember0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = group_member_test.GroupMember_0200();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslGroupMember0300
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0300
     * @tc.desc   test SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupMember0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = group_member_test.GroupMember_0300();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslGroupMember0500
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0500
     * @tc.desc   test SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupMember0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = group_member_test.GroupMember_0500();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslGroupMember0600
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0600
     * @tc.desc   test SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupMember0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = group_member_test.GroupMember_0600();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslGroupMember0700
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0700
     * @tc.desc   test SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupMember0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = group_member_test.GroupMember_0700();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslGroupMember0900
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0900
     * @tc.desc   test SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupMember0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = group_member_test.GroupMember_0900();
      expect(data).assertEqual(0);
      done()
    })
  });
}
